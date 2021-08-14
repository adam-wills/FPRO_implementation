
module mmio_sys_vanilla
#(
      parameter N_SW = 10,
                N_LED = 10
)
(
      // FPRO bus
      input  logic clk,
      input  logic reset,
      input  logic mmio_cs,
      input  logic mmio_wr,
      input  logic mmio_rd,
      input  logic [20:0] mmio_addr,
      input  logic [31:0] mmio_wr_data,
      output logic [31:0] mmio_rd_data,
      // switches and LEDs
      input  logic [N_SW-1:0]  sw,
      output logic [N_LED-1:0] led,
      // uart
      input  logic rx,
      output logic tx
);

// declarations
localparam S0_SYS_TIMER = 0;
localparam S1_UART1     = 1;
localparam S2_LED       = 2;
localparam S3_SW        = 3;

logic [63:0] mem_rd_array;
logic [63:0] mem_wr_array;
logic [63:0] cs_array;
logic [31:0] rd_data_array [63:0];
logic [31:0] wr_data_array [63:0];
logic [4:0]  reg_addr_array[63:0];

// body
// mmio controller instance
chu_mmio_controller ctrl_unit
(
		// slot interface
		.slot_cs_array(cs_array),
		.slot_mem_rd_array(mem_rd_array),
		.slot_mem_wr_array(mem_wr_array),
		.slot_reg_addr_array(reg_addr_array),
		.slot_rd_data_array(rd_data_array),
		.slot_wr_data_array(wr_data_array),
		.*
);

// slot 0: system timer
chu_timer timer_slot0
(
		.clk(clk),
		.reset(reset),
		.cs(cs_array[S0_SYS_TIMER]),
		.read(mem_rd_array[S0_SYS_TIMER]),
		.write(mem_wr_array[S0_SYS_TIMER]),
		.addr(reg_addr_array[S0_SYS_TIMER]),
		.rd_data(rd_data_array[S0_SYS_TIMER]),
		.wr_data(wr_data_array[S0_SYS_TIMER])
);

// slot 1: UART
chu_uart uart_slot1
(
		.clk(clk),
		.reset(reset),
		.cs(cs_array[S1_UART1]),
		.read(mem_rd_array[S1_UART1]),
		.write(mem_wr_array[S1_UART1]),
		.addr(reg_addr_array[S1_UART1]),
		.rd_data(rd_data_array[S1_UART1]),
		.wr_data(wr_data_array[S1_UART1]),
		.tx(tx),
		.rx(rx)
);
//assign rd_data_array[1] = 32'h0;

chu_gpo #(.W(N_LED)) gpo_slot2
(
		.clk(clk),
		.reset(reset),
		.cs(cs_array[S2_LED]),
		.read(mem_rd_array[S2_LED]),
		.write(mem_wr_array[S2_LED]),
		.addr(reg_addr_array[S2_LED]),
		.rd_data(rd_data_array[S2_LED]),
		.wr_data(wr_data_array[S2_LED]),
		.dout(led)
);

// slot 3: gpi
chu_gpi #(.W(N_SW)) gpi_slot3
(
		.clk(clk),
		.reset(reset),
		.cs(cs_array[S3_SW]),
		.read(mem_rd_array[S3_SW]),
		.write(mem_wr_array[S3_SW]),
		.addr(reg_addr_array[S3_SW]),
		.rd_data(rd_data_array[S3_SW]),
		.wr_data(wr_data_array[S3_SW]),
		.din(sw)
);

// assign 0 to all unused slot rd_data sigs
generate
   genvar i;
   for (i = 4; i < 64; i = i+1) begin: unused_slot_init
      assign rd_data_array[i] = 32'hffffffff;
   end
endgenerate

endmodule
