module chu_gpo
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
      output logic [W-1:0] dout
);

   logic [W-1:0] buf_reg;
   logic         wr_en;

   //output buffer register
   always_ff @(posedge clk) begin
      if (reset)
         buf_reg <= 0;
      else begin
         if (wr_en)
            buf_reg <= wr_data[W-1:0];
      end
   end

   //decoding logic
   assign wr_en = cs && write;

   // slot read interface (unused)
   assign rd_data = 0;

   // external output
   assign dout = buf_reg;

endmodule
