module chu_gpi
#(
      parameter W = 8
)
(
      input  logic         clk,
      input  logic         reset,
      // slot interface
      input  logic         cs,
      input  logic         read,
      input  logic         write,
      input  logic [4:0]   addr,
      input  logic [31:0]  wr_data,
      output logic [31:0]  rd_data,
      // external signal
      output logic [W-1:0] din
);

logic [W-1:0] rd_data_reg;

// body
always_ff @ (posedge clk) begin
   if (reset)
      rd_data_reg <= 0;
   else
      rd_data_reg <= din;
end

assign rd_data[W-1:0] = rd_data_reg;
assign rd_data[31:W]  = 0;

endmodule
