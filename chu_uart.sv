module chu_uart
#(
      parameter FIFO_ADDR_DEPTH = 8
)
(
      input  logic        clk,
      input  logic        reset,
      // slot interface
      input  logic        cs,
      input  logic        read,
      input  logic        write,
      input  logic [4:0]  addr,
      input  logic [31:0] wr_data,
      output logic [31:0] rd_data,
		output logic tx,
		output logic rx
);

// signal declarations
logic wr_uart, rd_uart, wr_dvsr;
logic tx_full, rx_empty;
logic [10:0] dvsr_reg;
logic [7:0] r_data;
logic ctrl_reg;

uart #(.DBIT(8), .SB_TICK(16), .FIFO_W(FIFO_ADDR_DEPTH)) uart_unit
(
      .dvsr(dvsr_reg),
      .w_data(wr_data[7:0]),
		.*
);

// dvsr register
always_ff @(posedge clk) begin
   if (reset)
      dvsr_reg <= 0;
   else
      if (wr_dvsr)
         dvsr_reg <= wr_data[10:0];
end

// decoding
assign wr_dvsr = (write && cs && (addr[1:0] == 2'b01));
assign wr_uart = (write && cs && (addr[1:0] == 2'b10));
assign rd_uart = (write && cs && (addr[1:0] == 2'b11));

// slot read interface
assign rd_data = {22'h000000, tx_full, rx_empty, r_data};
endmodule
