	fpro u0 (
		.clk_clk              (<connected-to-clk_clk>),              //          clk.clk
		.reset_reset_n        (<connected-to-reset_reset_n>),        //        reset.reset_n
		.sdram_clk_clk        (<connected-to-sdram_clk_clk>),        //    sdram_clk.clk
		.sdram_wire_addr      (<connected-to-sdram_wire_addr>),      //   sdram_wire.addr
		.sdram_wire_ba        (<connected-to-sdram_wire_ba>),        //             .ba
		.sdram_wire_cas_n     (<connected-to-sdram_wire_cas_n>),     //             .cas_n
		.sdram_wire_cke       (<connected-to-sdram_wire_cke>),       //             .cke
		.sdram_wire_cs_n      (<connected-to-sdram_wire_cs_n>),      //             .cs_n
		.sdram_wire_dq        (<connected-to-sdram_wire_dq>),        //             .dq
		.sdram_wire_dqm       (<connected-to-sdram_wire_dqm>),       //             .dqm
		.sdram_wire_ras_n     (<connected-to-sdram_wire_ras_n>),     //             .ras_n
		.sdram_wire_we_n      (<connected-to-sdram_wire_we_n>),      //             .we_n
		.fp_clk_clk           (<connected-to-fp_clk_clk>),           //       fp_clk.clk
		.fp_rst_reset         (<connected-to-fp_rst_reset>),         //       fp_rst.reset
		.fp_readdata_conduit  (<connected-to-fp_readdata_conduit>),  //  fp_readdata.conduit
		.fp_writedata_conduit (<connected-to-fp_writedata_conduit>), // fp_writedata.conduit
		.fp_address_conduit   (<connected-to-fp_address_conduit>),   //   fp_address.conduit
		.fp_write_conduit     (<connected-to-fp_write_conduit>),     //     fp_write.conduit
		.fp_read_conduit      (<connected-to-fp_read_conduit>),      //      fp_read.conduit
		.fp_mmio_cs_conduit   (<connected-to-fp_mmio_cs_conduit>),   //   fp_mmio_cs.conduit
		.fp_video_cs_conduit  (<connected-to-fp_video_cs_conduit>)   //  fp_video_cs.conduit
	);

