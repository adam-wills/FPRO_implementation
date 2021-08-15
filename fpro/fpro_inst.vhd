	component fpro is
		port (
			clk_clk              : in    std_logic                     := 'X';             -- clk
			reset_reset_n        : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk        : out   std_logic;                                        -- clk
			sdram_wire_addr      : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba        : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n     : out   std_logic;                                        -- cas_n
			sdram_wire_cke       : out   std_logic;                                        -- cke
			sdram_wire_cs_n      : out   std_logic;                                        -- cs_n
			sdram_wire_dq        : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm       : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n     : out   std_logic;                                        -- ras_n
			sdram_wire_we_n      : out   std_logic;                                        -- we_n
			fp_clk_clk           : out   std_logic;                                        -- clk
			fp_rst_reset         : out   std_logic;                                        -- reset
			fp_readdata_conduit  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- conduit
			fp_writedata_conduit : out   std_logic_vector(31 downto 0);                    -- conduit
			fp_addr_conduit      : out   std_logic_vector(20 downto 0);                    -- conduit
			fp_write_conduit     : out   std_logic;                                        -- conduit
			fp_read_conduit      : out   std_logic;                                        -- conduit
			fp_mmio_cs_conduit   : out   std_logic;                                        -- conduit
			fp_video_cs_conduit  : out   std_logic                                         -- conduit
		);
	end component fpro;

	u0 : component fpro
		port map (
			clk_clk              => CONNECTED_TO_clk_clk,              --          clk.clk
			reset_reset_n        => CONNECTED_TO_reset_reset_n,        --        reset.reset_n
			sdram_clk_clk        => CONNECTED_TO_sdram_clk_clk,        --    sdram_clk.clk
			sdram_wire_addr      => CONNECTED_TO_sdram_wire_addr,      --   sdram_wire.addr
			sdram_wire_ba        => CONNECTED_TO_sdram_wire_ba,        --             .ba
			sdram_wire_cas_n     => CONNECTED_TO_sdram_wire_cas_n,     --             .cas_n
			sdram_wire_cke       => CONNECTED_TO_sdram_wire_cke,       --             .cke
			sdram_wire_cs_n      => CONNECTED_TO_sdram_wire_cs_n,      --             .cs_n
			sdram_wire_dq        => CONNECTED_TO_sdram_wire_dq,        --             .dq
			sdram_wire_dqm       => CONNECTED_TO_sdram_wire_dqm,       --             .dqm
			sdram_wire_ras_n     => CONNECTED_TO_sdram_wire_ras_n,     --             .ras_n
			sdram_wire_we_n      => CONNECTED_TO_sdram_wire_we_n,      --             .we_n
			fp_clk_clk           => CONNECTED_TO_fp_clk_clk,           --       fp_clk.clk
			fp_rst_reset         => CONNECTED_TO_fp_rst_reset,         --       fp_rst.reset
			fp_readdata_conduit  => CONNECTED_TO_fp_readdata_conduit,  --  fp_readdata.conduit
			fp_writedata_conduit => CONNECTED_TO_fp_writedata_conduit, -- fp_writedata.conduit
			fp_addr_conduit      => CONNECTED_TO_fp_addr_conduit,      --      fp_addr.conduit
			fp_write_conduit     => CONNECTED_TO_fp_write_conduit,     --     fp_write.conduit
			fp_read_conduit      => CONNECTED_TO_fp_read_conduit,      --      fp_read.conduit
			fp_mmio_cs_conduit   => CONNECTED_TO_fp_mmio_cs_conduit,   --   fp_mmio_cs.conduit
			fp_video_cs_conduit  => CONNECTED_TO_fp_video_cs_conduit   --  fp_video_cs.conduit
		);

