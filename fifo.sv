module fifo
#(
      parameter DW = 8,
                AW = 4
)
(
      input  logic clk, reset,
      input  logic rd, wr,
      input  logic [DW-1:0] w_data,
      output logic empty, full,
      output logic [DW-1:0] r_data
);

// sig declarations
logic [AW-1:0] w_addr, r_addr;
logic wr_en, full_export;

// write enabled only when fifo is not full
assign wr_en = wr & ~full_export;
assign full = full_export;

// fifo controller unit
fifoController #(.AW(AW)) c_unit
(
      .*,
      .full(full_export)
);

reg_file #(.DW(DW), .AW(AW)) reg_unit
(
      .*
);

endmodule
