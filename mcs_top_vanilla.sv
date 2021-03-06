module mcs_top_vanilla
(
    // Top Level Inputs/Outputs //
	
      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,
		
		///////// UART  /////////
		input  logic rx,
		output logic tx
);


assign reset = ~{KEY[0]};
//fpro bus
logic fp_mmio_cs, fp_wr, fp_rd, fp_clk, fp_reset;
logic [20:0] fp_addr;
logic [31:0] fp_wr_data, fp_rd_data;

// instantiate I/O subsystem
mmio_sys_vanilla #(.N_SW(10), .N_LED(10)) mmio_unit
(
		.clk(fp_clk),
		.reset(reset),
		.mmio_cs(fp_mmio_cs),
		.mmio_wr(fp_wr),
		.mmio_rd(fp_rd),
		.mmio_addr(fp_addr),
		.mmio_wr_data(fp_wr_data),
		.mmio_rd_data(fp_rd_data),
		.sw(SW),
		.led(LEDR),
		.rx(rx),
		.tx(tx)
);

fpro u0 (
	.clk_clk                           (MAX10_CLK1_50),  //clk.clk
	.reset_reset_n                     (1'b1),           //reset.reset_n

	//SDRAM
	.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
	.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
	.sdram_wire_ba(DRAM_BA),                             //.ba
	.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
	.sdram_wire_cke(DRAM_CKE),                           //.cke
	.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
	.sdram_wire_dq(DRAM_DQ),                             //.dq
	.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
	.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
	.sdram_wire_we_n(DRAM_WE_N),                         //.we_n
	
	//FPRO Bus
	.fp_clk_clk(fp_clk),
	.fp_rst_reset(fp_reset),
	.fp_readdata_conduit(fp_rd_data),
	.fp_writedata_conduit(fp_wr_data),
	.fp_addr_conduit(fp_addr),
	.fp_read_conduit(fp_rd),
	.fp_write_conduit(fp_wr),
	.fp_mmio_cs_conduit(fp_mmio_cs),
	.fp_video_cs_conduit()
);

endmodule
