module fpro_system
(
    // Top Level Inputs/Outputs //
	
      ///////// Clocks /////////
      input     MAX10_CLK1_50, 
      input     MAX10_CLK2_50,

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


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N

);


// declarations

logic Reset_h;
//logic Continue_h;
// Invert active-low reset and continue buttons
//assign {Continue_h} =~ (KEY[1]);
assign {Reset_h} =~ (KEY[0]);	

// MCS IO bus
logic io_addr_strobe;
logic io_read_strobe, io_write_strobe;
logic io_ready;
logic [31:0] io_address, io_read_data, io_write_data
logic [3:0] io_byte_enable;

//fpro bus
logic fp_mmio_cs, fp_wr, fp_rd;
logic [20:0] fp_addr;
logic [31:0] fp_wr_data, fp_rd_data;






endmodule
