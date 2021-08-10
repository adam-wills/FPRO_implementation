module chu_mcs_bridge
#(
      parameter BRG_BASE = 32'hc000_0000)
)
(
      // Avalon-MM
      input  logic read,
      input  logic write,
      input  logic chipselect,
      input  logic [3:0] byteenable,
      input  logic [31:0] address,
      input  logic [31:0] writedata,
		output logic [31:0] readdata,
		// fpro bus
      input  logic [31:0] fp_rd_data,
      output logic [31:0] fp_wr_data,
		output logic [20:0] fp_addr,
      output logic fp_wr,
      output logic fp_rd,
      output logic fp_mmio_cs,
      output logic fp_video_cs
);

	// signal declarations
	logic mcs_bridge_en;
	logic [29:0] word_addr;
	logic [31:0] byte_mask[4];
	logic [31:0] mask = 32'h0000_0000;
	assign byte_mask[0] = 32'h0000_00ff;
	assign byte_mask[1] = 32'h0000_ff00;
	assign byte_mask[2] = 32'h00ff_0000;
	assign byte_mask[3] = 32'hff00_0000;

	// address translation/decoding
	// LSBs are '00' due to word alignment
	// (again probably something i'll need to change)
	assign word_addr = address[31:2];
	assign mcs_bridge_en = (address[31:24] == BRG_BASE[31:24]);
	assign fp_video_cs = (chipselect && mcs_bridge_en && address[23] == 1);
	assign fp_mmio_cs = (chipselect && mcs_bridge_en && address[23] == 0);
	assign fp_addr = word_addr[20:0];

	// control-line conversion
	assign fp_wr = write;
	assign fp_rd = read;

	// data-line conversion
	generate
	   genvar i;
	   for (i = 0; i < 4; i = i+1) begin
         if (byteenable[i])
            mask |= byte_mask[i];
         else
            mask &= ~byte_mask[i];
      end
	endgenerate
	assign fp_wr_data = writedata & mask;
	assign readdata = fp_rd_data;

endmodule
