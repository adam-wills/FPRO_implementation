module reg_file
#(
       parameter DW = 8,
                 AW = 2
)
(
      input  logic clk, wr_en,
		input  logic [AW-1:0] w_addr, r_addr,
      input  logic [DW-1:0] w_data,
      output logic [DW-1:0] r_data
);

logic [DW-1:0] array_reg [0:2**AW-1];

always_ff @(posedge clk)
   if (wr_en)
      array_reg[w_addr] <= w_data;

assign r_data = array_reg[r_addr]

endmodule
