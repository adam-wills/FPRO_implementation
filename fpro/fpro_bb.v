
module fpro (
	clk_clk,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	fp_clk_clk,
	fp_rst_reset,
	fp_readdata_conduit,
	fp_writedata_conduit,
	fp_address_conduit,
	fp_write_conduit,
	fp_read_conduit,
	fp_mmio_cs_conduit,
	fp_video_cs_conduit);	

	input		clk_clk;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output		fp_clk_clk;
	output		fp_rst_reset;
	input	[31:0]	fp_readdata_conduit;
	output	[31:0]	fp_writedata_conduit;
	output	[20:0]	fp_address_conduit;
	output		fp_write_conduit;
	output		fp_read_conduit;
	output		fp_mmio_cs_conduit;
	output		fp_video_cs_conduit;
endmodule
