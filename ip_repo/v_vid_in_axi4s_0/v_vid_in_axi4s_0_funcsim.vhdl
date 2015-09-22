-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Tue Sep 22 18:28:10 2015
-- Host        : Windows running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Anthony/armqp/ip_repo/v_vid_in_axi4s_0/v_vid_in_axi4s_0_funcsim.vhdl
-- Design      : v_vid_in_axi4s_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    DOBDO : out STD_LOGIC_VECTOR ( 1 downto 0 );
    wr_error : out STD_LOGIC;
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid_reg : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 18 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    idf_de : in STD_LOGIC;
    vid_io_in_clk : in STD_LOGIC;
    aclk : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 18 downto 0 );
    vid_io_in_ce : in STD_LOGIC;
    first_sof_reg : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    rst : in STD_LOGIC;
    valid_reg_0 : in STD_LOGIC;
    aclken : in STD_LOGIC;
    p_0_in6_in : in STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC;
    p_0_in_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2 : entity is "v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2";
end v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2;

architecture STRUCTURE of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2 is
  signal \^dobdo\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ack_rd_dom_1 : STD_LOGIC;
  signal ack_rd_dom_2 : STD_LOGIC;
  signal ack_rd_dom_3 : STD_LOGIC;
  signal ack_wr_dom_1 : STD_LOGIC;
  signal ack_wr_dom_2 : STD_LOGIC;
  signal ack_wr_dom_3 : STD_LOGIC;
  signal ce_rd_ptr_sample : STD_LOGIC;
  signal ce_rd_ptr_wr_dom : STD_LOGIC;
  signal ce_wr_ptr_rd_dom : STD_LOGIC;
  signal ce_wr_ptr_sample : STD_LOGIC;
  signal \^empty\ : STD_LOGIC;
  signal empty0 : STD_LOGIC;
  signal empty_i_2_n_0 : STD_LOGIC;
  signal fifo_dout : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal fifo_empty : STD_LOGIC;
  signal fifo_ram_reg_i_1_n_0 : STD_LOGIC;
  signal full_comb : STD_LOGIC;
  signal level_rd : STD_LOGIC_VECTOR ( 9 downto 2 );
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \ptr_diff_rd_dom[3]_i_2_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[3]_i_3_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[3]_i_4_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[3]_i_5_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[7]_i_2_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[7]_i_3_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[7]_i_4_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[7]_i_5_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[9]_i_2_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[9]_i_3_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[9]_i_4_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom[9]_i_5_n_0\ : STD_LOGIC;
  signal ptr_diff_rd_dom_comb0_out : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \ptr_diff_rd_dom_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[9]_i_1_n_1\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[9]_i_1_n_2\ : STD_LOGIC;
  signal \ptr_diff_rd_dom_reg[9]_i_1_n_3\ : STD_LOGIC;
  signal ram_out_rd_error : STD_LOGIC;
  signal ram_out_rd_error_i_1_n_0 : STD_LOGIC;
  signal ram_out_rd_error_i_2_n_0 : STD_LOGIC;
  signal \rd_data[15]_i_4_n_0\ : STD_LOGIC;
  signal rd_error_i_1_n_0 : STD_LOGIC;
  signal rd_error_i_2_n_0 : STD_LOGIC;
  signal rd_error_i_3_n_0 : STD_LOGIC;
  signal rd_error_i_4_n_0 : STD_LOGIC;
  signal rd_error_i_5_n_0 : STD_LOGIC;
  signal rd_error_i_6_n_0 : STD_LOGIC;
  signal rd_error_i_7_n_0 : STD_LOGIC;
  signal rd_ptr_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \rd_ptr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[3]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[3]_i_1_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[3]_i_1_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[3]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[3]_i_1_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[3]_i_1_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[3]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[3]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[7]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[7]_i_1_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[7]_i_1_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[7]_i_1_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[7]_i_1_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[7]_i_1_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[7]_i_1_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[7]_i_1_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[9]_i_2_n_1\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[9]_i_2_n_2\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[9]_i_2_n_3\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[9]_i_2_n_4\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[9]_i_2_n_5\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[9]_i_2_n_6\ : STD_LOGIC;
  signal \rd_ptr_reg_rep[9]_i_2_n_7\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[0]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[1]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[2]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[3]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[4]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[5]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[6]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[7]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[8]\ : STD_LOGIC;
  signal \rd_ptr_reg_rep_n_0_[9]\ : STD_LOGIC;
  signal \rd_ptr_rep[3]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[3]_i_3_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[3]_i_4_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[3]_i_5_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[7]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[7]_i_3_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[7]_i_4_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[7]_i_5_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_10_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_3_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_4_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_5_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_6_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_7_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_8_n_0\ : STD_LOGIC;
  signal \rd_ptr_rep[9]_i_9_n_0\ : STD_LOGIC;
  signal rd_ptr_sample : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \rd_ptr_wr_dom_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[10]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[1]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[2]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[3]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[4]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[5]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[6]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[7]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[8]\ : STD_LOGIC;
  signal \rd_ptr_wr_dom_reg_n_0_[9]\ : STD_LOGIC;
  signal rd_to_wr_req : STD_LOGIC;
  signal req_rd_dom_1 : STD_LOGIC;
  signal req_rd_dom_2 : STD_LOGIC;
  signal req_rd_dom_3 : STD_LOGIC;
  signal req_wr_dom_1 : STD_LOGIC;
  signal req_wr_dom_2 : STD_LOGIC;
  signal req_wr_dom_3 : STD_LOGIC;
  signal rst_rd_1 : STD_LOGIC;
  signal rst_rd_2 : STD_LOGIC;
  signal rst_wr_1 : STD_LOGIC;
  signal rst_wr_2 : STD_LOGIC;
  signal valid_i_2_n_0 : STD_LOGIC;
  signal valid_i_3_n_0 : STD_LOGIC;
  signal valid_i_4_n_0 : STD_LOGIC;
  signal wr_error_i_10_n_0 : STD_LOGIC;
  signal wr_error_i_11_n_0 : STD_LOGIC;
  signal wr_error_i_12_n_0 : STD_LOGIC;
  signal wr_error_i_13_n_0 : STD_LOGIC;
  signal wr_error_i_14_n_0 : STD_LOGIC;
  signal wr_error_i_15_n_0 : STD_LOGIC;
  signal wr_error_i_1_n_0 : STD_LOGIC;
  signal wr_error_i_4_n_0 : STD_LOGIC;
  signal wr_error_i_5_n_0 : STD_LOGIC;
  signal wr_error_i_6_n_0 : STD_LOGIC;
  signal wr_error_i_8_n_0 : STD_LOGIC;
  signal wr_error_i_9_n_0 : STD_LOGIC;
  signal wr_error_reg_i_2_n_2 : STD_LOGIC;
  signal wr_error_reg_i_2_n_3 : STD_LOGIC;
  signal wr_error_reg_i_2_n_6 : STD_LOGIC;
  signal wr_error_reg_i_2_n_7 : STD_LOGIC;
  signal wr_error_reg_i_3_n_0 : STD_LOGIC;
  signal wr_error_reg_i_3_n_1 : STD_LOGIC;
  signal wr_error_reg_i_3_n_2 : STD_LOGIC;
  signal wr_error_reg_i_3_n_3 : STD_LOGIC;
  signal wr_error_reg_i_3_n_4 : STD_LOGIC;
  signal wr_error_reg_i_3_n_5 : STD_LOGIC;
  signal wr_error_reg_i_3_n_6 : STD_LOGIC;
  signal wr_error_reg_i_3_n_7 : STD_LOGIC;
  signal wr_error_reg_i_7_n_0 : STD_LOGIC;
  signal wr_error_reg_i_7_n_1 : STD_LOGIC;
  signal wr_error_reg_i_7_n_2 : STD_LOGIC;
  signal wr_error_reg_i_7_n_3 : STD_LOGIC;
  signal wr_error_reg_i_7_n_4 : STD_LOGIC;
  signal wr_error_reg_i_7_n_5 : STD_LOGIC;
  signal wr_error_reg_i_7_n_6 : STD_LOGIC;
  signal wr_error_reg_i_7_n_7 : STD_LOGIC;
  signal \wr_ptr[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[0]_i_3_n_0\ : STD_LOGIC;
  signal wr_ptr_rd_dom : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal wr_ptr_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \wr_ptr_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg__0\ : STD_LOGIC_VECTOR ( 11 downto 10 );
  signal wr_ptr_sample : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal wr_to_rd_req : STD_LOGIC;
  signal NLW_fifo_ram_reg_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_ram_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_ram_reg_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 19 );
  signal NLW_fifo_ram_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_ram_reg_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_ram_reg_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_ptr_diff_rd_dom_reg[9]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_rd_ptr_reg[9]_i_2_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_rd_ptr_reg[9]_i_2_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_rd_ptr_reg_rep[9]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_wr_error_reg_i_2_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_wr_error_reg_i_2_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wr_ptr_reg[9]_i_2_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_wr_ptr_reg[9]_i_2_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of ack_rd_dom_1_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of ack_rd_dom_1_reg : label is "yes";
  attribute ASYNC_REG of ack_rd_dom_2_reg : label is std.standard.true;
  attribute KEEP of ack_rd_dom_2_reg : label is "yes";
  attribute ASYNC_REG of ack_rd_dom_3_reg : label is std.standard.true;
  attribute KEEP of ack_rd_dom_3_reg : label is "yes";
  attribute ASYNC_REG of ack_wr_dom_1_reg : label is std.standard.true;
  attribute KEEP of ack_wr_dom_1_reg : label is "yes";
  attribute ASYNC_REG of ack_wr_dom_2_reg : label is std.standard.true;
  attribute KEEP of ack_wr_dom_2_reg : label is "yes";
  attribute ASYNC_REG of ack_wr_dom_3_reg : label is std.standard.true;
  attribute KEEP of ack_wr_dom_3_reg : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of empty_i_2 : label is "soft_lutpair7";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of fifo_ram_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of fifo_ram_reg : label is 19456;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of fifo_ram_reg : label is "fifo_ram";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of fifo_ram_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of fifo_ram_reg : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of fifo_ram_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of fifo_ram_reg : label is 35;
  attribute SOFT_HLUTNM of \rd_data[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rd_data[12]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rd_data[15]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rd_data[17]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rd_data[18]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rd_data[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rd_data[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of rd_error_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of rd_error_i_3 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of rd_error_i_5 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of rd_error_i_6 : label is "soft_lutpair7";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \rd_ptr_reg[1]_i_2_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \rd_ptr_reg[1]_i_2_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \rd_ptr_reg[5]_i_2_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \rd_ptr_reg[5]_i_2_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \rd_ptr_reg[9]_i_2_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \rd_ptr_reg[9]_i_2_CARRY4\ : label is "LO:O";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \rd_ptr_reg_rep[0]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[1]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[2]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[3]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[4]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[5]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[6]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[7]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[8]\ : label is "no";
  attribute equivalent_register_removal of \rd_ptr_reg_rep[9]\ : label is "no";
  attribute SOFT_HLUTNM of \rd_ptr_rep[9]_i_4\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rd_ptr_rep[9]_i_5\ : label is "soft_lutpair1";
  attribute ASYNC_REG of req_rd_dom_1_reg : label is std.standard.true;
  attribute KEEP of req_rd_dom_1_reg : label is "yes";
  attribute ASYNC_REG of req_rd_dom_2_reg : label is std.standard.true;
  attribute KEEP of req_rd_dom_2_reg : label is "yes";
  attribute ASYNC_REG of req_rd_dom_3_reg : label is std.standard.true;
  attribute KEEP of req_rd_dom_3_reg : label is "yes";
  attribute ASYNC_REG of req_wr_dom_1_reg : label is std.standard.true;
  attribute KEEP of req_wr_dom_1_reg : label is "yes";
  attribute ASYNC_REG of req_wr_dom_2_reg : label is std.standard.true;
  attribute KEEP of req_wr_dom_2_reg : label is "yes";
  attribute ASYNC_REG of req_wr_dom_3_reg : label is std.standard.true;
  attribute KEEP of req_wr_dom_3_reg : label is "yes";
  attribute ASYNC_REG of rst_rd_1_reg : label is std.standard.true;
  attribute KEEP of rst_rd_1_reg : label is "yes";
  attribute ASYNC_REG of rst_rd_2_reg : label is std.standard.true;
  attribute KEEP of rst_rd_2_reg : label is "yes";
  attribute ASYNC_REG of rst_wr_1_reg : label is std.standard.true;
  attribute KEEP of rst_wr_1_reg : label is "yes";
  attribute ASYNC_REG of rst_wr_2_reg : label is std.standard.true;
  attribute KEEP of rst_wr_2_reg : label is "yes";
  attribute SOFT_HLUTNM of valid_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of valid_i_3 : label is "soft_lutpair6";
  attribute XILINX_LEGACY_PRIM of \wr_ptr_reg[1]_i_2_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \wr_ptr_reg[1]_i_2_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \wr_ptr_reg[5]_i_2_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \wr_ptr_reg[5]_i_2_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \wr_ptr_reg[9]_i_2_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \wr_ptr_reg[9]_i_2_CARRY4\ : label is "LO:O";
begin
  DOBDO(1 downto 0) <= \^dobdo\(1 downto 0);
  SR(0) <= \^sr\(0);
  empty <= \^empty\;
ack_rd_dom_1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => req_wr_dom_3,
      Q => ack_rd_dom_1,
      R => rst_rd_2
    );
ack_rd_dom_2_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ack_rd_dom_1,
      Q => ack_rd_dom_2,
      R => rst_rd_2
    );
ack_rd_dom_3_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ack_rd_dom_2,
      Q => ack_rd_dom_3,
      R => rst_rd_2
    );
ack_wr_dom_1_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => req_rd_dom_3,
      Q => ack_wr_dom_1,
      R => rst_wr_2
    );
ack_wr_dom_2_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => ack_wr_dom_1,
      Q => ack_wr_dom_2,
      R => rst_wr_2
    );
ack_wr_dom_3_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => ack_wr_dom_2,
      Q => ack_wr_dom_3,
      R => rst_wr_2
    );
empty_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EFFFEFAA"
    )
        port map (
      I0 => fifo_empty,
      I1 => m_axis_video_tready,
      I2 => valid_reg_0,
      I3 => valid_i_2_n_0,
      I4 => empty_i_2_n_0,
      I5 => \rd_ptr_rep[9]_i_3_n_0\,
      O => empty0
    );
empty_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEA"
    )
        port map (
      I0 => level_rd(4),
      I1 => level_rd(2),
      I2 => level_rd(3),
      I3 => rd_error_i_7_n_0,
      O => empty_i_2_n_0
    );
empty_reg: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => empty0,
      Q => fifo_empty,
      S => rst_rd_2
    );
fifo_ram_reg: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 5) => wr_ptr_reg(9 downto 0),
      ADDRARDADDR(4) => '1',
      ADDRARDADDR(3) => '1',
      ADDRARDADDR(2) => '1',
      ADDRARDADDR(1) => '1',
      ADDRARDADDR(0) => '1',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14) => \rd_ptr_reg_rep_n_0_[9]\,
      ADDRBWRADDR(13) => \rd_ptr_reg_rep_n_0_[8]\,
      ADDRBWRADDR(12) => \rd_ptr_reg_rep_n_0_[7]\,
      ADDRBWRADDR(11) => \rd_ptr_reg_rep_n_0_[6]\,
      ADDRBWRADDR(10) => \rd_ptr_reg_rep_n_0_[5]\,
      ADDRBWRADDR(9) => \rd_ptr_reg_rep_n_0_[4]\,
      ADDRBWRADDR(8) => \rd_ptr_reg_rep_n_0_[3]\,
      ADDRBWRADDR(7) => \rd_ptr_reg_rep_n_0_[2]\,
      ADDRBWRADDR(6) => \rd_ptr_reg_rep_n_0_[1]\,
      ADDRBWRADDR(5) => \rd_ptr_reg_rep_n_0_[0]\,
      ADDRBWRADDR(4) => '1',
      ADDRBWRADDR(3) => '1',
      ADDRBWRADDR(2) => '1',
      ADDRBWRADDR(1) => '1',
      ADDRBWRADDR(0) => '1',
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_fifo_ram_reg_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_fifo_ram_reg_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => vid_io_in_clk,
      CLKBWRCLK => aclk,
      DBITERR => NLW_fifo_ram_reg_DBITERR_UNCONNECTED,
      DIADI(31) => '0',
      DIADI(30) => '0',
      DIADI(29) => '0',
      DIADI(28) => '0',
      DIADI(27) => '0',
      DIADI(26) => '0',
      DIADI(25) => '0',
      DIADI(24) => '0',
      DIADI(23) => '0',
      DIADI(22) => '0',
      DIADI(21) => '0',
      DIADI(20) => '0',
      DIADI(19) => '0',
      DIADI(18 downto 0) => DIADI(18 downto 0),
      DIBDI(31) => '0',
      DIBDI(30) => '0',
      DIBDI(29) => '0',
      DIBDI(28) => '0',
      DIBDI(27) => '0',
      DIBDI(26) => '0',
      DIBDI(25) => '0',
      DIBDI(24) => '0',
      DIBDI(23) => '0',
      DIBDI(22) => '0',
      DIBDI(21) => '0',
      DIBDI(20) => '0',
      DIBDI(19) => '0',
      DIBDI(18) => '1',
      DIBDI(17) => '1',
      DIBDI(16) => '1',
      DIBDI(15) => '1',
      DIBDI(14) => '1',
      DIBDI(13) => '1',
      DIBDI(12) => '1',
      DIBDI(11) => '1',
      DIBDI(10) => '1',
      DIBDI(9) => '1',
      DIBDI(8) => '1',
      DIBDI(7) => '1',
      DIBDI(6) => '1',
      DIBDI(5) => '1',
      DIBDI(4) => '1',
      DIBDI(3) => '1',
      DIBDI(2) => '1',
      DIBDI(1) => '1',
      DIBDI(0) => '1',
      DIPADIP(3) => '0',
      DIPADIP(2) => '0',
      DIPADIP(1) => '0',
      DIPADIP(0) => '0',
      DIPBDIP(3) => '0',
      DIPBDIP(2) => '0',
      DIPBDIP(1) => '0',
      DIPBDIP(0) => '0',
      DOADO(31 downto 0) => NLW_fifo_ram_reg_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 19) => NLW_fifo_ram_reg_DOBDO_UNCONNECTED(31 downto 19),
      DOBDO(18 downto 17) => \^dobdo\(1 downto 0),
      DOBDO(16 downto 0) => fifo_dout(16 downto 0),
      DOPADOP(3 downto 0) => NLW_fifo_ram_reg_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_fifo_ram_reg_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_fifo_ram_reg_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => idf_de,
      ENBWREN => fifo_ram_reg_i_1_n_0,
      INJECTDBITERR => NLW_fifo_ram_reg_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_fifo_ram_reg_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_fifo_ram_reg_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => rst_rd_2,
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_fifo_ram_reg_SBITERR_UNCONNECTED,
      WEA(3) => vid_io_in_ce,
      WEA(2) => vid_io_in_ce,
      WEA(1) => vid_io_in_ce,
      WEA(0) => vid_io_in_ce,
      WEBWE(7) => '0',
      WEBWE(6) => '0',
      WEBWE(5) => '0',
      WEBWE(4) => '0',
      WEBWE(3) => '0',
      WEBWE(2) => '0',
      WEBWE(1) => '0',
      WEBWE(0) => '0'
    );
fifo_ram_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF45"
    )
        port map (
      I0 => rd_error_i_2_n_0,
      I1 => first_sof_reg,
      I2 => rd_error_i_3_n_0,
      I3 => rst_rd_2,
      I4 => rd_error_i_4_n_0,
      O => fifo_ram_reg_i_1_n_0
    );
full_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => full_comb,
      Q => full,
      R => rst_wr_2
    );
\ptr_diff_rd_dom[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(3),
      I1 => rd_ptr_reg(3),
      O => \ptr_diff_rd_dom[3]_i_2_n_0\
    );
\ptr_diff_rd_dom[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(2),
      I1 => rd_ptr_reg(2),
      O => \ptr_diff_rd_dom[3]_i_3_n_0\
    );
\ptr_diff_rd_dom[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(1),
      I1 => rd_ptr_reg(1),
      O => \ptr_diff_rd_dom[3]_i_4_n_0\
    );
\ptr_diff_rd_dom[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(0),
      I1 => rd_ptr_reg(0),
      O => \ptr_diff_rd_dom[3]_i_5_n_0\
    );
\ptr_diff_rd_dom[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(7),
      I1 => rd_ptr_reg(7),
      O => \ptr_diff_rd_dom[7]_i_2_n_0\
    );
\ptr_diff_rd_dom[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(6),
      I1 => rd_ptr_reg(6),
      O => \ptr_diff_rd_dom[7]_i_3_n_0\
    );
\ptr_diff_rd_dom[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(5),
      I1 => rd_ptr_reg(5),
      O => \ptr_diff_rd_dom[7]_i_4_n_0\
    );
\ptr_diff_rd_dom[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(4),
      I1 => rd_ptr_reg(4),
      O => \ptr_diff_rd_dom[7]_i_5_n_0\
    );
\ptr_diff_rd_dom[9]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(11),
      I1 => rd_ptr_reg(11),
      O => \ptr_diff_rd_dom[9]_i_2_n_0\
    );
\ptr_diff_rd_dom[9]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(10),
      I1 => rd_ptr_reg(10),
      O => \ptr_diff_rd_dom[9]_i_3_n_0\
    );
\ptr_diff_rd_dom[9]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(9),
      I1 => rd_ptr_reg(9),
      O => \ptr_diff_rd_dom[9]_i_4_n_0\
    );
\ptr_diff_rd_dom[9]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_rd_dom(8),
      I1 => rd_ptr_reg(8),
      O => \ptr_diff_rd_dom[9]_i_5_n_0\
    );
\ptr_diff_rd_dom_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ptr_diff_rd_dom_comb0_out(2),
      Q => level_rd(2),
      R => rst_rd_2
    );
\ptr_diff_rd_dom_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ptr_diff_rd_dom_comb0_out(3),
      Q => level_rd(3),
      R => rst_rd_2
    );
\ptr_diff_rd_dom_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ptr_diff_rd_dom_reg[3]_i_1_n_0\,
      CO(2) => \ptr_diff_rd_dom_reg[3]_i_1_n_1\,
      CO(1) => \ptr_diff_rd_dom_reg[3]_i_1_n_2\,
      CO(0) => \ptr_diff_rd_dom_reg[3]_i_1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => wr_ptr_rd_dom(3 downto 0),
      O(3 downto 0) => ptr_diff_rd_dom_comb0_out(3 downto 0),
      S(3) => \ptr_diff_rd_dom[3]_i_2_n_0\,
      S(2) => \ptr_diff_rd_dom[3]_i_3_n_0\,
      S(1) => \ptr_diff_rd_dom[3]_i_4_n_0\,
      S(0) => \ptr_diff_rd_dom[3]_i_5_n_0\
    );
\ptr_diff_rd_dom_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ptr_diff_rd_dom_comb0_out(4),
      Q => level_rd(4),
      R => rst_rd_2
    );
\ptr_diff_rd_dom_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ptr_diff_rd_dom_comb0_out(5),
      Q => level_rd(5),
      R => rst_rd_2
    );
\ptr_diff_rd_dom_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ptr_diff_rd_dom_comb0_out(6),
      Q => level_rd(6),
      R => rst_rd_2
    );
\ptr_diff_rd_dom_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ptr_diff_rd_dom_comb0_out(7),
      Q => level_rd(7),
      R => rst_rd_2
    );
\ptr_diff_rd_dom_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ptr_diff_rd_dom_reg[3]_i_1_n_0\,
      CO(3) => \ptr_diff_rd_dom_reg[7]_i_1_n_0\,
      CO(2) => \ptr_diff_rd_dom_reg[7]_i_1_n_1\,
      CO(1) => \ptr_diff_rd_dom_reg[7]_i_1_n_2\,
      CO(0) => \ptr_diff_rd_dom_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => wr_ptr_rd_dom(7 downto 4),
      O(3 downto 0) => ptr_diff_rd_dom_comb0_out(7 downto 4),
      S(3) => \ptr_diff_rd_dom[7]_i_2_n_0\,
      S(2) => \ptr_diff_rd_dom[7]_i_3_n_0\,
      S(1) => \ptr_diff_rd_dom[7]_i_4_n_0\,
      S(0) => \ptr_diff_rd_dom[7]_i_5_n_0\
    );
\ptr_diff_rd_dom_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ptr_diff_rd_dom_comb0_out(8),
      Q => level_rd(8),
      R => rst_rd_2
    );
\ptr_diff_rd_dom_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ptr_diff_rd_dom_comb0_out(9),
      Q => level_rd(9),
      R => rst_rd_2
    );
\ptr_diff_rd_dom_reg[9]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \ptr_diff_rd_dom_reg[7]_i_1_n_0\,
      CO(3) => \NLW_ptr_diff_rd_dom_reg[9]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \ptr_diff_rd_dom_reg[9]_i_1_n_1\,
      CO(1) => \ptr_diff_rd_dom_reg[9]_i_1_n_2\,
      CO(0) => \ptr_diff_rd_dom_reg[9]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => wr_ptr_rd_dom(10 downto 8),
      O(3 downto 0) => ptr_diff_rd_dom_comb0_out(11 downto 8),
      S(3) => \ptr_diff_rd_dom[9]_i_2_n_0\,
      S(2) => \ptr_diff_rd_dom[9]_i_3_n_0\,
      S(1) => \ptr_diff_rd_dom[9]_i_4_n_0\,
      S(0) => \ptr_diff_rd_dom[9]_i_5_n_0\
    );
ram_out_rd_error_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF570054"
    )
        port map (
      I0 => \rd_ptr_rep[9]_i_3_n_0\,
      I1 => rd_error_i_4_n_0,
      I2 => ram_out_rd_error_i_2_n_0,
      I3 => rst_rd_2,
      I4 => ram_out_rd_error,
      O => ram_out_rd_error_i_1_n_0
    );
ram_out_rd_error_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B000B0000000B000"
    )
        port map (
      I0 => m_axis_video_tready,
      I1 => valid_reg_0,
      I2 => valid_i_2_n_0,
      I3 => aclken,
      I4 => fifo_empty,
      I5 => fifo_dout(16),
      O => ram_out_rd_error_i_2_n_0
    );
ram_out_rd_error_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => ram_out_rd_error_i_1_n_0,
      Q => ram_out_rd_error,
      R => '0'
    );
\rd_data[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(0),
      O => D(0)
    );
\rd_data[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(10),
      O => D(10)
    );
\rd_data[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(11),
      O => D(11)
    );
\rd_data[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(12),
      O => D(12)
    );
\rd_data[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(13),
      O => D(13)
    );
\rd_data[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(14),
      O => D(14)
    );
\rd_data[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rst,
      I1 => aresetn,
      O => \^sr\(0)
    );
\rd_data[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBB0B0000"
    )
        port map (
      I0 => fifo_dout(16),
      I1 => fifo_empty,
      I2 => valid_reg_0,
      I3 => m_axis_video_tready,
      I4 => aclken,
      I5 => \rd_data[15]_i_4_n_0\,
      O => E(0)
    );
\rd_data[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(15),
      O => D(15)
    );
\rd_data[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000DF00"
    )
        port map (
      I0 => \^dobdo\(0),
      I1 => \^dobdo\(1),
      I2 => p_0_in6_in,
      I3 => aclken,
      I4 => first_sof_reg,
      O => \rd_data[15]_i_4_n_0\
    );
\rd_data[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(16),
      O => D(16)
    );
\rd_data[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8C88"
    )
        port map (
      I0 => first_sof_reg,
      I1 => \^dobdo\(0),
      I2 => \^dobdo\(1),
      I3 => p_0_in6_in,
      O => D(17)
    );
\rd_data[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => first_sof_reg,
      I1 => \^dobdo\(1),
      O => D(18)
    );
\rd_data[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(1),
      O => D(1)
    );
\rd_data[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(2),
      O => D(2)
    );
\rd_data[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(3),
      O => D(3)
    );
\rd_data[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(4),
      O => D(4)
    );
\rd_data[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(5),
      O => D(5)
    );
\rd_data[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(6),
      O => D(6)
    );
\rd_data[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(7),
      O => D(7)
    );
\rd_data[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(8),
      O => D(8)
    );
\rd_data[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF200000"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      I3 => first_sof_reg,
      I4 => fifo_dout(9),
      O => D(9)
    );
rd_error_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAEFEEAAAA2022"
    )
        port map (
      I0 => ram_out_rd_error,
      I1 => rd_error_i_2_n_0,
      I2 => first_sof_reg,
      I3 => rd_error_i_3_n_0,
      I4 => rd_error_i_4_n_0,
      I5 => \^empty\,
      O => rd_error_i_1_n_0
    );
rd_error_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4FFF4F4F"
    )
        port map (
      I0 => fifo_dout(16),
      I1 => fifo_empty,
      I2 => aclken,
      I3 => m_axis_video_tready,
      I4 => valid_reg_0,
      O => rd_error_i_2_n_0
    );
rd_error_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \^dobdo\(1),
      I2 => \^dobdo\(0),
      O => rd_error_i_3_n_0
    );
rd_error_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000DDD000000000"
    )
        port map (
      I0 => \^dobdo\(0),
      I1 => rd_error_i_5_n_0,
      I2 => rd_error_i_6_n_0,
      I3 => rd_error_i_7_n_0,
      I4 => first_sof_reg,
      I5 => aclken,
      O => rd_error_i_4_n_0
    );
rd_error_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^dobdo\(1),
      I1 => p_0_in6_in,
      O => rd_error_i_5_n_0
    );
rd_error_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => level_rd(3),
      I1 => level_rd(2),
      I2 => level_rd(4),
      O => rd_error_i_6_n_0
    );
rd_error_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => level_rd(9),
      I1 => level_rd(5),
      I2 => level_rd(6),
      I3 => p_0_in_0,
      I4 => level_rd(7),
      I5 => level_rd(8),
      O => rd_error_i_7_n_0
    );
rd_error_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => rd_error_i_1_n_0,
      Q => \^empty\,
      R => rst_rd_2
    );
\rd_ptr[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_ptr_reg(0),
      O => p_0_in(0)
    );
\rd_ptr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[0]_i_1_n_0\,
      Q => rd_ptr_reg(0),
      R => rst_rd_2
    );
\rd_ptr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[10]_i_1_n_0\,
      Q => rd_ptr_reg(10),
      R => rst_rd_2
    );
\rd_ptr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[11]_i_1_n_0\,
      Q => rd_ptr_reg(11),
      R => rst_rd_2
    );
\rd_ptr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[1]_i_1_n_0\,
      Q => rd_ptr_reg(1),
      R => rst_rd_2
    );
\rd_ptr_reg[1]_i_2_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rd_ptr_reg[4]_i_2_n_0\,
      CO(2) => \rd_ptr_reg[3]_i_2_n_0\,
      CO(1) => \rd_ptr_reg[2]_i_2_n_0\,
      CO(0) => \rd_ptr_reg[1]_i_2_n_0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \rd_ptr_reg[3]_i_1_n_0\,
      O(2) => \rd_ptr_reg[2]_i_1_n_0\,
      O(1) => \rd_ptr_reg[1]_i_1_n_0\,
      O(0) => \rd_ptr_reg[0]_i_1_n_0\,
      S(3 downto 1) => rd_ptr_reg(3 downto 1),
      S(0) => p_0_in(0)
    );
\rd_ptr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[2]_i_1_n_0\,
      Q => rd_ptr_reg(2),
      R => rst_rd_2
    );
\rd_ptr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[3]_i_1_n_0\,
      Q => rd_ptr_reg(3),
      R => rst_rd_2
    );
\rd_ptr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[4]_i_1_n_0\,
      Q => rd_ptr_reg(4),
      R => rst_rd_2
    );
\rd_ptr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[5]_i_1_n_0\,
      Q => rd_ptr_reg(5),
      R => rst_rd_2
    );
\rd_ptr_reg[5]_i_2_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg[4]_i_2_n_0\,
      CO(3) => \rd_ptr_reg[8]_i_2_n_0\,
      CO(2) => \rd_ptr_reg[7]_i_2_n_0\,
      CO(1) => \rd_ptr_reg[6]_i_2_n_0\,
      CO(0) => \rd_ptr_reg[5]_i_2_n_0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \rd_ptr_reg[7]_i_1_n_0\,
      O(2) => \rd_ptr_reg[6]_i_1_n_0\,
      O(1) => \rd_ptr_reg[5]_i_1_n_0\,
      O(0) => \rd_ptr_reg[4]_i_1_n_0\,
      S(3 downto 0) => rd_ptr_reg(7 downto 4)
    );
\rd_ptr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[6]_i_1_n_0\,
      Q => rd_ptr_reg(6),
      R => rst_rd_2
    );
\rd_ptr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[7]_i_1_n_0\,
      Q => rd_ptr_reg(7),
      R => rst_rd_2
    );
\rd_ptr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[8]_i_1_n_0\,
      Q => rd_ptr_reg(8),
      R => rst_rd_2
    );
\rd_ptr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg[9]_i_1_n_0\,
      Q => rd_ptr_reg(9),
      R => rst_rd_2
    );
\rd_ptr_reg[9]_i_2_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg[8]_i_2_n_0\,
      CO(3 downto 2) => \NLW_rd_ptr_reg[9]_i_2_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \rd_ptr_reg[10]_i_2_n_0\,
      CO(0) => \rd_ptr_reg[9]_i_2_n_0\,
      CYINIT => '0',
      DI(3) => \NLW_rd_ptr_reg[9]_i_2_CARRY4_DI_UNCONNECTED\(3),
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \rd_ptr_reg[11]_i_1_n_0\,
      O(2) => \rd_ptr_reg[10]_i_1_n_0\,
      O(1) => \rd_ptr_reg[9]_i_1_n_0\,
      O(0) => \rd_ptr_reg[8]_i_1_n_0\,
      S(3 downto 0) => rd_ptr_reg(11 downto 8)
    );
\rd_ptr_reg_rep[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[3]_i_1_n_7\,
      Q => \rd_ptr_reg_rep_n_0_[0]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[3]_i_1_n_6\,
      Q => \rd_ptr_reg_rep_n_0_[1]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[3]_i_1_n_5\,
      Q => \rd_ptr_reg_rep_n_0_[2]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[3]_i_1_n_4\,
      Q => \rd_ptr_reg_rep_n_0_[3]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rd_ptr_reg_rep[3]_i_1_n_0\,
      CO(2) => \rd_ptr_reg_rep[3]_i_1_n_1\,
      CO(1) => \rd_ptr_reg_rep[3]_i_1_n_2\,
      CO(0) => \rd_ptr_reg_rep[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => rd_ptr_reg(0),
      O(3) => \rd_ptr_reg_rep[3]_i_1_n_4\,
      O(2) => \rd_ptr_reg_rep[3]_i_1_n_5\,
      O(1) => \rd_ptr_reg_rep[3]_i_1_n_6\,
      O(0) => \rd_ptr_reg_rep[3]_i_1_n_7\,
      S(3) => \rd_ptr_rep[3]_i_2_n_0\,
      S(2) => \rd_ptr_rep[3]_i_3_n_0\,
      S(1) => \rd_ptr_rep[3]_i_4_n_0\,
      S(0) => \rd_ptr_rep[3]_i_5_n_0\
    );
\rd_ptr_reg_rep[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[7]_i_1_n_7\,
      Q => \rd_ptr_reg_rep_n_0_[4]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[7]_i_1_n_6\,
      Q => \rd_ptr_reg_rep_n_0_[5]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[7]_i_1_n_5\,
      Q => \rd_ptr_reg_rep_n_0_[6]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[7]_i_1_n_4\,
      Q => \rd_ptr_reg_rep_n_0_[7]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg_rep[3]_i_1_n_0\,
      CO(3) => \rd_ptr_reg_rep[7]_i_1_n_0\,
      CO(2) => \rd_ptr_reg_rep[7]_i_1_n_1\,
      CO(1) => \rd_ptr_reg_rep[7]_i_1_n_2\,
      CO(0) => \rd_ptr_reg_rep[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \rd_ptr_reg_rep[7]_i_1_n_4\,
      O(2) => \rd_ptr_reg_rep[7]_i_1_n_5\,
      O(1) => \rd_ptr_reg_rep[7]_i_1_n_6\,
      O(0) => \rd_ptr_reg_rep[7]_i_1_n_7\,
      S(3) => \rd_ptr_rep[7]_i_2_n_0\,
      S(2) => \rd_ptr_rep[7]_i_3_n_0\,
      S(1) => \rd_ptr_rep[7]_i_4_n_0\,
      S(0) => \rd_ptr_rep[7]_i_5_n_0\
    );
\rd_ptr_reg_rep[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[9]_i_2_n_7\,
      Q => \rd_ptr_reg_rep_n_0_[8]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \rd_ptr_rep[9]_i_1_n_0\,
      D => \rd_ptr_reg_rep[9]_i_2_n_6\,
      Q => \rd_ptr_reg_rep_n_0_[9]\,
      R => rst_rd_2
    );
\rd_ptr_reg_rep[9]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_ptr_reg_rep[7]_i_1_n_0\,
      CO(3) => \NLW_rd_ptr_reg_rep[9]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \rd_ptr_reg_rep[9]_i_2_n_1\,
      CO(1) => \rd_ptr_reg_rep[9]_i_2_n_2\,
      CO(0) => \rd_ptr_reg_rep[9]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \rd_ptr_reg_rep[9]_i_2_n_4\,
      O(2) => \rd_ptr_reg_rep[9]_i_2_n_5\,
      O(1) => \rd_ptr_reg_rep[9]_i_2_n_6\,
      O(0) => \rd_ptr_reg_rep[9]_i_2_n_7\,
      S(3) => \rd_ptr_rep[9]_i_6_n_0\,
      S(2) => \rd_ptr_rep[9]_i_7_n_0\,
      S(1) => \rd_ptr_rep[9]_i_8_n_0\,
      S(0) => \rd_ptr_rep[9]_i_9_n_0\
    );
\rd_ptr_rep[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(3),
      O => \rd_ptr_rep[3]_i_2_n_0\
    );
\rd_ptr_rep[3]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(2),
      O => \rd_ptr_rep[3]_i_3_n_0\
    );
\rd_ptr_rep[3]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(1),
      O => \rd_ptr_rep[3]_i_4_n_0\
    );
\rd_ptr_rep[3]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_ptr_reg(0),
      O => \rd_ptr_rep[3]_i_5_n_0\
    );
\rd_ptr_rep[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(7),
      O => \rd_ptr_rep[7]_i_2_n_0\
    );
\rd_ptr_rep[7]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(6),
      O => \rd_ptr_rep[7]_i_3_n_0\
    );
\rd_ptr_rep[7]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(5),
      O => \rd_ptr_rep[7]_i_4_n_0\
    );
\rd_ptr_rep[7]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(4),
      O => \rd_ptr_rep[7]_i_5_n_0\
    );
\rd_ptr_rep[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A888888888888888"
    )
        port map (
      I0 => \rd_ptr_rep[9]_i_3_n_0\,
      I1 => rd_error_i_4_n_0,
      I2 => \rd_ptr_rep[9]_i_4_n_0\,
      I3 => valid_i_2_n_0,
      I4 => aclken,
      I5 => \rd_ptr_rep[9]_i_5_n_0\,
      O => \rd_ptr_rep[9]_i_1_n_0\
    );
\rd_ptr_rep[9]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => ptr_diff_rd_dom_comb0_out(5),
      I1 => ptr_diff_rd_dom_comb0_out(7),
      I2 => ptr_diff_rd_dom_comb0_out(3),
      I3 => ptr_diff_rd_dom_comb0_out(1),
      I4 => ptr_diff_rd_dom_comb0_out(4),
      I5 => ptr_diff_rd_dom_comb0_out(2),
      O => \rd_ptr_rep[9]_i_10_n_0\
    );
\rd_ptr_rep[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => ptr_diff_rd_dom_comb0_out(8),
      I1 => ptr_diff_rd_dom_comb0_out(9),
      I2 => ptr_diff_rd_dom_comb0_out(6),
      I3 => ptr_diff_rd_dom_comb0_out(10),
      I4 => ptr_diff_rd_dom_comb0_out(11),
      I5 => \rd_ptr_rep[9]_i_10_n_0\,
      O => \rd_ptr_rep[9]_i_3_n_0\
    );
\rd_ptr_rep[9]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => m_axis_video_tready,
      I1 => valid_reg_0,
      O => \rd_ptr_rep[9]_i_4_n_0\
    );
\rd_ptr_rep[9]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => fifo_dout(16),
      I1 => fifo_empty,
      O => \rd_ptr_rep[9]_i_5_n_0\
    );
\rd_ptr_rep[9]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(11),
      O => \rd_ptr_rep[9]_i_6_n_0\
    );
\rd_ptr_rep[9]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(10),
      O => \rd_ptr_rep[9]_i_7_n_0\
    );
\rd_ptr_rep[9]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(9),
      O => \rd_ptr_rep[9]_i_8_n_0\
    );
\rd_ptr_rep[9]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rd_ptr_reg(8),
      O => \rd_ptr_rep[9]_i_9_n_0\
    );
\rd_ptr_sample[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => ack_rd_dom_2,
      I1 => ack_rd_dom_3,
      O => ce_rd_ptr_sample
    );
\rd_ptr_sample_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(0),
      Q => rd_ptr_sample(0),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(10),
      Q => rd_ptr_sample(10),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(1),
      Q => rd_ptr_sample(1),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(2),
      Q => rd_ptr_sample(2),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(3),
      Q => rd_ptr_sample(3),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(4),
      Q => rd_ptr_sample(4),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(5),
      Q => rd_ptr_sample(5),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(6),
      Q => rd_ptr_sample(6),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(7),
      Q => rd_ptr_sample(7),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(8),
      Q => rd_ptr_sample(8),
      R => rst_rd_2
    );
\rd_ptr_sample_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_rd_ptr_sample,
      D => rd_ptr_reg(9),
      Q => rd_ptr_sample(9),
      R => rst_rd_2
    );
\rd_ptr_wr_dom[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => req_wr_dom_2,
      I1 => req_wr_dom_3,
      O => ce_rd_ptr_wr_dom
    );
\rd_ptr_wr_dom_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(0),
      Q => \rd_ptr_wr_dom_reg_n_0_[0]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(10),
      Q => \rd_ptr_wr_dom_reg_n_0_[10]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(1),
      Q => \rd_ptr_wr_dom_reg_n_0_[1]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(2),
      Q => \rd_ptr_wr_dom_reg_n_0_[2]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(3),
      Q => \rd_ptr_wr_dom_reg_n_0_[3]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(4),
      Q => \rd_ptr_wr_dom_reg_n_0_[4]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(5),
      Q => \rd_ptr_wr_dom_reg_n_0_[5]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(6),
      Q => \rd_ptr_wr_dom_reg_n_0_[6]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(7),
      Q => \rd_ptr_wr_dom_reg_n_0_[7]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(8),
      Q => \rd_ptr_wr_dom_reg_n_0_[8]\,
      R => rst_wr_2
    );
\rd_ptr_wr_dom_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_rd_ptr_wr_dom,
      D => rd_ptr_sample(9),
      Q => \rd_ptr_wr_dom_reg_n_0_[9]\,
      R => rst_wr_2
    );
req_rd_dom_1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ack_wr_dom_3,
      O => wr_to_rd_req
    );
req_rd_dom_1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => wr_to_rd_req,
      Q => req_rd_dom_1,
      R => rst_rd_2
    );
req_rd_dom_2_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => req_rd_dom_1,
      Q => req_rd_dom_2,
      R => rst_rd_2
    );
req_rd_dom_3_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => req_rd_dom_2,
      Q => req_rd_dom_3,
      R => rst_rd_2
    );
req_wr_dom_1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ack_rd_dom_3,
      O => rd_to_wr_req
    );
req_wr_dom_1_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => rd_to_wr_req,
      Q => req_wr_dom_1,
      R => rst_wr_2
    );
req_wr_dom_2_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => req_wr_dom_1,
      Q => req_wr_dom_2,
      R => rst_wr_2
    );
req_wr_dom_3_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => req_wr_dom_2,
      Q => req_wr_dom_3,
      R => rst_wr_2
    );
rst_rd_1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \^sr\(0),
      Q => rst_rd_1,
      R => '0'
    );
rst_rd_2_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => rst_rd_1,
      Q => rst_rd_2,
      R => '0'
    );
rst_wr_1_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => \^sr\(0),
      Q => rst_wr_1,
      R => '0'
    );
rst_wr_2_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => '1',
      D => rst_wr_1,
      Q => rst_wr_2,
      R => '0'
    );
valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00008F0000008000"
    )
        port map (
      I0 => valid_i_2_n_0,
      I1 => valid_i_3_n_0,
      I2 => valid_i_4_n_0,
      I3 => aresetn,
      I4 => rst,
      I5 => valid_reg_0,
      O => valid_reg
    );
valid_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
        port map (
      I0 => first_sof_reg,
      I1 => \^dobdo\(0),
      I2 => \^dobdo\(1),
      I3 => p_0_in6_in,
      O => valid_i_2_n_0
    );
valid_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4545FF45"
    )
        port map (
      I0 => \^empty\,
      I1 => fifo_dout(16),
      I2 => fifo_empty,
      I3 => valid_reg_0,
      I4 => m_axis_video_tready,
      O => valid_i_3_n_0
    );
valid_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFF0F0FEFEF0F0"
    )
        port map (
      I0 => m_axis_video_tready,
      I1 => valid_reg_0,
      I2 => \rd_data[15]_i_4_n_0\,
      I3 => \^empty\,
      I4 => aclken,
      I5 => \rd_ptr_rep[9]_i_5_n_0\,
      O => valid_i_4_n_0
    );
wr_error_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => rst_wr_2,
      I1 => idf_de,
      I2 => vid_io_in_ce,
      O => wr_error_i_1_n_0
    );
wr_error_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(5),
      I1 => \rd_ptr_wr_dom_reg_n_0_[5]\,
      O => wr_error_i_10_n_0
    );
wr_error_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(4),
      I1 => \rd_ptr_wr_dom_reg_n_0_[4]\,
      O => wr_error_i_11_n_0
    );
wr_error_i_12: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(3),
      I1 => \rd_ptr_wr_dom_reg_n_0_[3]\,
      O => wr_error_i_12_n_0
    );
wr_error_i_13: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(2),
      I1 => \rd_ptr_wr_dom_reg_n_0_[2]\,
      O => wr_error_i_13_n_0
    );
wr_error_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(1),
      I1 => \rd_ptr_wr_dom_reg_n_0_[1]\,
      O => wr_error_i_14_n_0
    );
wr_error_i_15: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(0),
      I1 => \rd_ptr_wr_dom_reg_n_0_[0]\,
      O => wr_error_i_15_n_0
    );
wr_error_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \wr_ptr_reg__0\(10),
      I1 => \rd_ptr_wr_dom_reg_n_0_[10]\,
      O => wr_error_i_4_n_0
    );
wr_error_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(9),
      I1 => \rd_ptr_wr_dom_reg_n_0_[9]\,
      O => wr_error_i_5_n_0
    );
wr_error_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(8),
      I1 => \rd_ptr_wr_dom_reg_n_0_[8]\,
      O => wr_error_i_6_n_0
    );
wr_error_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(7),
      I1 => \rd_ptr_wr_dom_reg_n_0_[7]\,
      O => wr_error_i_8_n_0
    );
wr_error_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => wr_ptr_reg(6),
      I1 => \rd_ptr_wr_dom_reg_n_0_[6]\,
      O => wr_error_i_9_n_0
    );
wr_error_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => full_comb,
      Q => wr_error,
      R => wr_error_i_1_n_0
    );
wr_error_reg_i_2: unisim.vcomponents.CARRY4
     port map (
      CI => wr_error_reg_i_3_n_0,
      CO(3 downto 2) => NLW_wr_error_reg_i_2_CO_UNCONNECTED(3 downto 2),
      CO(1) => wr_error_reg_i_2_n_2,
      CO(0) => wr_error_reg_i_2_n_3,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1 downto 0) => wr_ptr_reg(9 downto 8),
      O(3) => NLW_wr_error_reg_i_2_O_UNCONNECTED(3),
      O(2) => full_comb,
      O(1) => wr_error_reg_i_2_n_6,
      O(0) => wr_error_reg_i_2_n_7,
      S(3) => '0',
      S(2) => wr_error_i_4_n_0,
      S(1) => wr_error_i_5_n_0,
      S(0) => wr_error_i_6_n_0
    );
wr_error_reg_i_3: unisim.vcomponents.CARRY4
     port map (
      CI => wr_error_reg_i_7_n_0,
      CO(3) => wr_error_reg_i_3_n_0,
      CO(2) => wr_error_reg_i_3_n_1,
      CO(1) => wr_error_reg_i_3_n_2,
      CO(0) => wr_error_reg_i_3_n_3,
      CYINIT => '0',
      DI(3 downto 0) => wr_ptr_reg(7 downto 4),
      O(3) => wr_error_reg_i_3_n_4,
      O(2) => wr_error_reg_i_3_n_5,
      O(1) => wr_error_reg_i_3_n_6,
      O(0) => wr_error_reg_i_3_n_7,
      S(3) => wr_error_i_8_n_0,
      S(2) => wr_error_i_9_n_0,
      S(1) => wr_error_i_10_n_0,
      S(0) => wr_error_i_11_n_0
    );
wr_error_reg_i_7: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => wr_error_reg_i_7_n_0,
      CO(2) => wr_error_reg_i_7_n_1,
      CO(1) => wr_error_reg_i_7_n_2,
      CO(0) => wr_error_reg_i_7_n_3,
      CYINIT => '1',
      DI(3 downto 0) => wr_ptr_reg(3 downto 0),
      O(3) => wr_error_reg_i_7_n_4,
      O(2) => wr_error_reg_i_7_n_5,
      O(1) => wr_error_reg_i_7_n_6,
      O(0) => wr_error_reg_i_7_n_7,
      S(3) => wr_error_i_12_n_0,
      S(2) => wr_error_i_13_n_0,
      S(1) => wr_error_i_14_n_0,
      S(0) => wr_error_i_15_n_0
    );
\wr_ptr[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => full_comb,
      I1 => vid_io_in_ce,
      I2 => idf_de,
      O => \wr_ptr[0]_i_1_n_0\
    );
\wr_ptr[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wr_ptr_reg(0),
      O => \wr_ptr[0]_i_3_n_0\
    );
\wr_ptr_rd_dom[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => req_rd_dom_2,
      I1 => req_rd_dom_3,
      O => ce_wr_ptr_rd_dom
    );
\wr_ptr_rd_dom_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(0),
      Q => wr_ptr_rd_dom(0),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(10),
      Q => wr_ptr_rd_dom(10),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(11),
      Q => wr_ptr_rd_dom(11),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(1),
      Q => wr_ptr_rd_dom(1),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(2),
      Q => wr_ptr_rd_dom(2),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(3),
      Q => wr_ptr_rd_dom(3),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(4),
      Q => wr_ptr_rd_dom(4),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(5),
      Q => wr_ptr_rd_dom(5),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(6),
      Q => wr_ptr_rd_dom(6),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(7),
      Q => wr_ptr_rd_dom(7),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(8),
      Q => wr_ptr_rd_dom(8),
      R => rst_rd_2
    );
\wr_ptr_rd_dom_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => ce_wr_ptr_rd_dom,
      D => wr_ptr_sample(9),
      Q => wr_ptr_rd_dom(9),
      R => rst_rd_2
    );
\wr_ptr_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[0]_i_2_n_0\,
      Q => wr_ptr_reg(0),
      S => rst_wr_2
    );
\wr_ptr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[10]_i_1_n_0\,
      Q => \wr_ptr_reg__0\(10),
      R => rst_wr_2
    );
\wr_ptr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[11]_i_1_n_0\,
      Q => \wr_ptr_reg__0\(11),
      R => rst_wr_2
    );
\wr_ptr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[1]_i_1_n_0\,
      Q => wr_ptr_reg(1),
      R => rst_wr_2
    );
\wr_ptr_reg[1]_i_2_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wr_ptr_reg[4]_i_2_n_0\,
      CO(2) => \wr_ptr_reg[3]_i_2_n_0\,
      CO(1) => \wr_ptr_reg[2]_i_2_n_0\,
      CO(0) => \wr_ptr_reg[1]_i_2_n_0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \wr_ptr_reg[3]_i_1_n_0\,
      O(2) => \wr_ptr_reg[2]_i_1_n_0\,
      O(1) => \wr_ptr_reg[1]_i_1_n_0\,
      O(0) => \wr_ptr_reg[0]_i_2_n_0\,
      S(3 downto 1) => wr_ptr_reg(3 downto 1),
      S(0) => \wr_ptr[0]_i_3_n_0\
    );
\wr_ptr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[2]_i_1_n_0\,
      Q => wr_ptr_reg(2),
      R => rst_wr_2
    );
\wr_ptr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[3]_i_1_n_0\,
      Q => wr_ptr_reg(3),
      R => rst_wr_2
    );
\wr_ptr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[4]_i_1_n_0\,
      Q => wr_ptr_reg(4),
      R => rst_wr_2
    );
\wr_ptr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[5]_i_1_n_0\,
      Q => wr_ptr_reg(5),
      R => rst_wr_2
    );
\wr_ptr_reg[5]_i_2_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_ptr_reg[4]_i_2_n_0\,
      CO(3) => \wr_ptr_reg[8]_i_2_n_0\,
      CO(2) => \wr_ptr_reg[7]_i_2_n_0\,
      CO(1) => \wr_ptr_reg[6]_i_2_n_0\,
      CO(0) => \wr_ptr_reg[5]_i_2_n_0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \wr_ptr_reg[7]_i_1_n_0\,
      O(2) => \wr_ptr_reg[6]_i_1_n_0\,
      O(1) => \wr_ptr_reg[5]_i_1_n_0\,
      O(0) => \wr_ptr_reg[4]_i_1_n_0\,
      S(3 downto 0) => wr_ptr_reg(7 downto 4)
    );
\wr_ptr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[6]_i_1_n_0\,
      Q => wr_ptr_reg(6),
      R => rst_wr_2
    );
\wr_ptr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[7]_i_1_n_0\,
      Q => wr_ptr_reg(7),
      R => rst_wr_2
    );
\wr_ptr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[8]_i_1_n_0\,
      Q => wr_ptr_reg(8),
      R => rst_wr_2
    );
\wr_ptr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => \wr_ptr[0]_i_1_n_0\,
      D => \wr_ptr_reg[9]_i_1_n_0\,
      Q => wr_ptr_reg(9),
      R => rst_wr_2
    );
\wr_ptr_reg[9]_i_2_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_ptr_reg[8]_i_2_n_0\,
      CO(3 downto 2) => \NLW_wr_ptr_reg[9]_i_2_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \wr_ptr_reg[10]_i_2_n_0\,
      CO(0) => \wr_ptr_reg[9]_i_2_n_0\,
      CYINIT => '0',
      DI(3) => \NLW_wr_ptr_reg[9]_i_2_CARRY4_DI_UNCONNECTED\(3),
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \wr_ptr_reg[11]_i_1_n_0\,
      O(2) => \wr_ptr_reg[10]_i_1_n_0\,
      O(1) => \wr_ptr_reg[9]_i_1_n_0\,
      O(0) => \wr_ptr_reg[8]_i_1_n_0\,
      S(3 downto 2) => \wr_ptr_reg__0\(11 downto 10),
      S(1 downto 0) => wr_ptr_reg(9 downto 8)
    );
\wr_ptr_sample[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => ack_wr_dom_2,
      I1 => ack_wr_dom_3,
      O => ce_wr_ptr_sample
    );
\wr_ptr_sample_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(0),
      Q => wr_ptr_sample(0),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => \wr_ptr_reg__0\(10),
      Q => wr_ptr_sample(10),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => \wr_ptr_reg__0\(11),
      Q => wr_ptr_sample(11),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(1),
      Q => wr_ptr_sample(1),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(2),
      Q => wr_ptr_sample(2),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(3),
      Q => wr_ptr_sample(3),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(4),
      Q => wr_ptr_sample(4),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(5),
      Q => wr_ptr_sample(5),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(6),
      Q => wr_ptr_sample(6),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(7),
      Q => wr_ptr_sample(7),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(8),
      Q => wr_ptr_sample(8),
      R => rst_wr_2
    );
\wr_ptr_sample_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => ce_wr_ptr_sample,
      D => wr_ptr_reg(9),
      Q => wr_ptr_sample(9),
      R => rst_wr_2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_formatter is
  port (
    vtd_active_video : out STD_LOGIC;
    vtd_vblank : out STD_LOGIC;
    vtd_hblank : out STD_LOGIC;
    vtd_vsync : out STD_LOGIC;
    vtd_hsync : out STD_LOGIC;
    vtd_field_id : out STD_LOGIC;
    DIADI : out STD_LOGIC_VECTOR ( 18 downto 0 );
    idf_de : out STD_LOGIC;
    vid_io_in_ce : in STD_LOGIC;
    vid_active_video : in STD_LOGIC;
    vid_io_in_clk : in STD_LOGIC;
    vid_vblank : in STD_LOGIC;
    vid_hblank : in STD_LOGIC;
    vid_vsync : in STD_LOGIC;
    vid_hsync : in STD_LOGIC;
    vid_field_id : in STD_LOGIC;
    vid_data : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_formatter : entity is "v_vid_in_axi4s_v3_0_vid_in_formatter";
end v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_formatter;

architecture STRUCTURE of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_formatter is
  signal data_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal data_2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal de_2 : STD_LOGIC;
  signal eol_i_1_n_0 : STD_LOGIC;
  signal field_id_2 : STD_LOGIC;
  signal sof : STD_LOGIC;
  signal sof0 : STD_LOGIC;
  signal v_blank_sync_1 : STD_LOGIC;
  signal v_blank_sync_2 : STD_LOGIC;
  signal vert_blanking_intvl_i_1_n_0 : STD_LOGIC;
  signal vert_blanking_intvl_reg_n_0 : STD_LOGIC;
  signal \^vtd_active_video\ : STD_LOGIC;
  signal \^vtd_field_id\ : STD_LOGIC;
  signal \^vtd_vblank\ : STD_LOGIC;
  signal \^vtd_vsync\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of eol_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of sof_i_1 : label is "soft_lutpair8";
begin
  vtd_active_video <= \^vtd_active_video\;
  vtd_field_id <= \^vtd_field_id\;
  vtd_vblank <= \^vtd_vblank\;
  vtd_vsync <= \^vtd_vsync\;
\data_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(0),
      Q => data_1(0),
      R => '0'
    );
\data_1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(10),
      Q => data_1(10),
      R => '0'
    );
\data_1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(11),
      Q => data_1(11),
      R => '0'
    );
\data_1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(12),
      Q => data_1(12),
      R => '0'
    );
\data_1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(13),
      Q => data_1(13),
      R => '0'
    );
\data_1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(14),
      Q => data_1(14),
      R => '0'
    );
\data_1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(15),
      Q => data_1(15),
      R => '0'
    );
\data_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(1),
      Q => data_1(1),
      R => '0'
    );
\data_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(2),
      Q => data_1(2),
      R => '0'
    );
\data_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(3),
      Q => data_1(3),
      R => '0'
    );
\data_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(4),
      Q => data_1(4),
      R => '0'
    );
\data_1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(5),
      Q => data_1(5),
      R => '0'
    );
\data_1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(6),
      Q => data_1(6),
      R => '0'
    );
\data_1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(7),
      Q => data_1(7),
      R => '0'
    );
\data_1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(8),
      Q => data_1(8),
      R => '0'
    );
\data_1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_data(9),
      Q => data_1(9),
      R => '0'
    );
\data_2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(0),
      Q => data_2(0),
      R => '0'
    );
\data_2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(10),
      Q => data_2(10),
      R => '0'
    );
\data_2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(11),
      Q => data_2(11),
      R => '0'
    );
\data_2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(12),
      Q => data_2(12),
      R => '0'
    );
\data_2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(13),
      Q => data_2(13),
      R => '0'
    );
\data_2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(14),
      Q => data_2(14),
      R => '0'
    );
\data_2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(15),
      Q => data_2(15),
      R => '0'
    );
\data_2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(1),
      Q => data_2(1),
      R => '0'
    );
\data_2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(2),
      Q => data_2(2),
      R => '0'
    );
\data_2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(3),
      Q => data_2(3),
      R => '0'
    );
\data_2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(4),
      Q => data_2(4),
      R => '0'
    );
\data_2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(5),
      Q => data_2(5),
      R => '0'
    );
\data_2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(6),
      Q => data_2(6),
      R => '0'
    );
\data_2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(7),
      Q => data_2(7),
      R => '0'
    );
\data_2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(8),
      Q => data_2(8),
      R => '0'
    );
\data_2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_1(9),
      Q => data_2(9),
      R => '0'
    );
\data_3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(0),
      Q => DIADI(0),
      R => '0'
    );
\data_3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(10),
      Q => DIADI(10),
      R => '0'
    );
\data_3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(11),
      Q => DIADI(11),
      R => '0'
    );
\data_3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(12),
      Q => DIADI(12),
      R => '0'
    );
\data_3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(13),
      Q => DIADI(13),
      R => '0'
    );
\data_3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(14),
      Q => DIADI(14),
      R => '0'
    );
\data_3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(15),
      Q => DIADI(15),
      R => '0'
    );
\data_3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(1),
      Q => DIADI(1),
      R => '0'
    );
\data_3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(2),
      Q => DIADI(2),
      R => '0'
    );
\data_3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(3),
      Q => DIADI(3),
      R => '0'
    );
\data_3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(4),
      Q => DIADI(4),
      R => '0'
    );
\data_3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(5),
      Q => DIADI(5),
      R => '0'
    );
\data_3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(6),
      Q => DIADI(6),
      R => '0'
    );
\data_3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(7),
      Q => DIADI(7),
      R => '0'
    );
\data_3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(8),
      Q => DIADI(8),
      R => '0'
    );
\data_3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => data_2(9),
      Q => DIADI(9),
      R => '0'
    );
de_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_active_video,
      Q => \^vtd_active_video\,
      R => '0'
    );
de_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => \^vtd_active_video\,
      Q => de_2,
      R => '0'
    );
de_3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => de_2,
      Q => idf_de,
      R => '0'
    );
eol_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => de_2,
      I1 => \^vtd_active_video\,
      O => eol_i_1_n_0
    );
eol_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => eol_i_1_n_0,
      Q => DIADI(16),
      R => '0'
    );
field_id_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_field_id,
      Q => \^vtd_field_id\,
      R => '0'
    );
field_id_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => \^vtd_field_id\,
      Q => field_id_2,
      R => '0'
    );
field_id_3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => field_id_2,
      Q => DIADI(18),
      R => '0'
    );
hblank_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_hblank,
      Q => vtd_hblank,
      R => '0'
    );
hsync_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_hsync,
      Q => vtd_hsync,
      R => '0'
    );
sof_1_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => sof,
      Q => DIADI(17),
      R => '0'
    );
sof_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => de_2,
      I1 => \^vtd_active_video\,
      I2 => vert_blanking_intvl_reg_n_0,
      O => sof0
    );
sof_reg: unisim.vcomponents.FDRE
     port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => sof0,
      Q => sof,
      R => '0'
    );
v_blank_sync_2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^vtd_vblank\,
      I1 => \^vtd_vsync\,
      O => v_blank_sync_1
    );
v_blank_sync_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => v_blank_sync_1,
      Q => v_blank_sync_2,
      R => '0'
    );
vblank_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_vblank,
      Q => \^vtd_vblank\,
      R => '0'
    );
vert_blanking_intvl_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0B0F0F0FFB0F0F0"
    )
        port map (
      I0 => de_2,
      I1 => \^vtd_active_video\,
      I2 => vert_blanking_intvl_reg_n_0,
      I3 => v_blank_sync_1,
      I4 => vid_io_in_ce,
      I5 => v_blank_sync_2,
      O => vert_blanking_intvl_i_1_n_0
    );
vert_blanking_intvl_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => '1',
      D => vert_blanking_intvl_i_1_n_0,
      Q => vert_blanking_intvl_reg_n_0,
      R => '0'
    );
vsync_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => vid_io_in_clk,
      CE => vid_io_in_ce,
      D => vid_vsync,
      Q => \^vtd_vsync\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_coupler is
  port (
    locked_1 : out STD_LOGIC;
    fifo_full_1 : out STD_LOGIC;
    wr_error : out STD_LOGIC;
    empty : out STD_LOGIC;
    m_axis_video_tvalid : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 18 downto 0 );
    idf_de : in STD_LOGIC;
    vid_io_in_clk : in STD_LOGIC;
    aclk : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 18 downto 0 );
    vid_io_in_ce : in STD_LOGIC;
    aclken : in STD_LOGIC;
    axis_enable : in STD_LOGIC;
    locked_1_reg_0 : in STD_LOGIC;
    fifo_full_1_reg_0 : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    rst : in STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_coupler : entity is "v_vid_in_axi4s_v3_0_in_coupler";
end v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_coupler;

architecture STRUCTURE of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_coupler is
  signal fifo_dout : STD_LOGIC_VECTOR ( 18 downto 17 );
  signal fifo_full_2 : STD_LOGIC;
  signal first_sof_reg : STD_LOGIC;
  signal first_sof_reg_i_1_n_0 : STD_LOGIC;
  signal full : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_10 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_11 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_12 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_13 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_14 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_15 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_16 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_17 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_18 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_19 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_20 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_21 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_22 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_23 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_24 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_25 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_26 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_6 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_7 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_8 : STD_LOGIC;
  signal in_bridge_async_fifo_2_i_n_9 : STD_LOGIC;
  signal locked_2 : STD_LOGIC;
  signal \^m_axis_video_tvalid\ : STD_LOGIC;
  signal reset : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of fifo_full_1_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of fifo_full_1_reg : label is "yes";
  attribute ASYNC_REG of fifo_full_2_reg : label is std.standard.true;
  attribute KEEP of fifo_full_2_reg : label is "yes";
  attribute ASYNC_REG of locked_1_reg : label is std.standard.true;
  attribute KEEP of locked_1_reg : label is "yes";
  attribute ASYNC_REG of locked_2_reg : label is std.standard.true;
  attribute KEEP of locked_2_reg : label is "yes";
begin
  m_axis_video_tvalid <= \^m_axis_video_tvalid\;
fifo_full_1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aclken,
      D => full,
      Q => fifo_full_1,
      R => reset
    );
fifo_full_2_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => aclken,
      D => fifo_full_1_reg_0,
      Q => fifo_full_2,
      R => reset
    );
first_sof_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000F20000000000"
    )
        port map (
      I0 => fifo_dout(17),
      I1 => fifo_dout(18),
      I2 => first_sof_reg,
      I3 => locked_2,
      I4 => rst,
      I5 => aresetn,
      O => first_sof_reg_i_1_n_0
    );
first_sof_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => first_sof_reg_i_1_n_0,
      Q => first_sof_reg,
      R => '0'
    );
in_bridge_async_fifo_2_i: entity work.v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2
     port map (
      D(18) => in_bridge_async_fifo_2_i_n_7,
      D(17) => in_bridge_async_fifo_2_i_n_8,
      D(16) => in_bridge_async_fifo_2_i_n_9,
      D(15) => in_bridge_async_fifo_2_i_n_10,
      D(14) => in_bridge_async_fifo_2_i_n_11,
      D(13) => in_bridge_async_fifo_2_i_n_12,
      D(12) => in_bridge_async_fifo_2_i_n_13,
      D(11) => in_bridge_async_fifo_2_i_n_14,
      D(10) => in_bridge_async_fifo_2_i_n_15,
      D(9) => in_bridge_async_fifo_2_i_n_16,
      D(8) => in_bridge_async_fifo_2_i_n_17,
      D(7) => in_bridge_async_fifo_2_i_n_18,
      D(6) => in_bridge_async_fifo_2_i_n_19,
      D(5) => in_bridge_async_fifo_2_i_n_20,
      D(4) => in_bridge_async_fifo_2_i_n_21,
      D(3) => in_bridge_async_fifo_2_i_n_22,
      D(2) => in_bridge_async_fifo_2_i_n_23,
      D(1) => in_bridge_async_fifo_2_i_n_24,
      D(0) => in_bridge_async_fifo_2_i_n_25,
      DIADI(18 downto 0) => DIADI(18 downto 0),
      DOBDO(1 downto 0) => fifo_dout(18 downto 17),
      E(0) => in_bridge_async_fifo_2_i_n_26,
      SR(0) => reset,
      aclk => aclk,
      aclken => aclken,
      aresetn => aresetn,
      empty => empty,
      first_sof_reg => first_sof_reg,
      full => full,
      idf_de => idf_de,
      m_axis_video_tready => m_axis_video_tready,
      p_0_in6_in => locked_2,
      p_0_in_0 => fifo_full_2,
      rst => rst,
      valid_reg => in_bridge_async_fifo_2_i_n_6,
      valid_reg_0 => \^m_axis_video_tvalid\,
      vid_io_in_ce => vid_io_in_ce,
      vid_io_in_clk => vid_io_in_clk,
      wr_error => wr_error
    );
locked_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => aclken,
      D => axis_enable,
      Q => locked_1,
      R => reset
    );
locked_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => aclken,
      D => locked_1_reg_0,
      Q => locked_2,
      R => reset
    );
\rd_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_25,
      Q => Q(0),
      R => reset
    );
\rd_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_15,
      Q => Q(10),
      R => reset
    );
\rd_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_14,
      Q => Q(11),
      R => reset
    );
\rd_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_13,
      Q => Q(12),
      R => reset
    );
\rd_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_12,
      Q => Q(13),
      R => reset
    );
\rd_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_11,
      Q => Q(14),
      R => reset
    );
\rd_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_10,
      Q => Q(15),
      R => reset
    );
\rd_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_9,
      Q => Q(16),
      R => reset
    );
\rd_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_8,
      Q => Q(17),
      R => reset
    );
\rd_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_7,
      Q => Q(18),
      R => reset
    );
\rd_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_24,
      Q => Q(1),
      R => reset
    );
\rd_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_23,
      Q => Q(2),
      R => reset
    );
\rd_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_22,
      Q => Q(3),
      R => reset
    );
\rd_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_21,
      Q => Q(4),
      R => reset
    );
\rd_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_20,
      Q => Q(5),
      R => reset
    );
\rd_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_19,
      Q => Q(6),
      R => reset
    );
\rd_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_18,
      Q => Q(7),
      R => reset
    );
\rd_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_17,
      Q => Q(8),
      R => reset
    );
\rd_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => in_bridge_async_fifo_2_i_n_26,
      D => in_bridge_async_fifo_2_i_n_16,
      Q => Q(9),
      R => reset
    );
valid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => in_bridge_async_fifo_2_i_n_6,
      Q => \^m_axis_video_tvalid\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top is
  port (
    vid_io_in_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    vid_io_in_ce : in STD_LOGIC;
    vid_active_video : in STD_LOGIC;
    vid_vblank : in STD_LOGIC;
    vid_hblank : in STD_LOGIC;
    vid_vsync : in STD_LOGIC;
    vid_hsync : in STD_LOGIC;
    vid_field_id : in STD_LOGIC;
    vid_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_video_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_video_tvalid : out STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC;
    m_axis_video_tuser : out STD_LOGIC;
    m_axis_video_tlast : out STD_LOGIC;
    fid : out STD_LOGIC;
    vtd_active_video : out STD_LOGIC;
    vtd_vblank : out STD_LOGIC;
    vtd_hblank : out STD_LOGIC;
    vtd_vsync : out STD_LOGIC;
    vtd_hsync : out STD_LOGIC;
    vtd_field_id : out STD_LOGIC;
    wr_error : out STD_LOGIC;
    empty : out STD_LOGIC;
    axis_enable : in STD_LOGIC
  );
  attribute C_M_AXIS_VIDEO_DATA_WIDTH : integer;
  attribute C_M_AXIS_VIDEO_DATA_WIDTH of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top : entity is 8;
  attribute C_M_AXIS_VIDEO_FORMAT : integer;
  attribute C_M_AXIS_VIDEO_FORMAT of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top : entity is 0;
  attribute C_M_AXIS_VIDEO_TDATA_WIDTH : integer;
  attribute C_M_AXIS_VIDEO_TDATA_WIDTH of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top : entity is 16;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top : entity is "yes";
  attribute HYSTERESIS_LEVEL : integer;
  attribute HYSTERESIS_LEVEL of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top : entity is 12;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top : entity is "v_vid_in_axi4s_v3_0_vid_in_axi4s_top";
  attribute RAM_ADDR_BITS : integer;
  attribute RAM_ADDR_BITS of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top : entity is 10;
  attribute VID_IN_DATA_WIDTH : integer;
  attribute VID_IN_DATA_WIDTH of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top : entity is 16;
end v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top;

architecture STRUCTURE of v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top is
  signal fifo_full_1 : STD_LOGIC;
  signal idf_data : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal idf_de : STD_LOGIC;
  signal locked_1 : STD_LOGIC;
begin
in_coupler_i: entity work.v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_coupler
     port map (
      DIADI(18 downto 0) => idf_data(18 downto 0),
      Q(18) => fid,
      Q(17) => m_axis_video_tuser,
      Q(16) => m_axis_video_tlast,
      Q(15 downto 0) => m_axis_video_tdata(15 downto 0),
      aclk => aclk,
      aclken => aclken,
      aresetn => aresetn,
      axis_enable => axis_enable,
      empty => empty,
      fifo_full_1 => fifo_full_1,
      fifo_full_1_reg_0 => fifo_full_1,
      idf_de => idf_de,
      locked_1 => locked_1,
      locked_1_reg_0 => locked_1,
      m_axis_video_tready => m_axis_video_tready,
      m_axis_video_tvalid => m_axis_video_tvalid,
      rst => rst,
      vid_io_in_ce => vid_io_in_ce,
      vid_io_in_clk => vid_io_in_clk,
      wr_error => wr_error
    );
vid_in_formatter: entity work.v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_formatter
     port map (
      DIADI(18 downto 0) => idf_data(18 downto 0),
      idf_de => idf_de,
      vid_active_video => vid_active_video,
      vid_data(15 downto 0) => vid_data(15 downto 0),
      vid_field_id => vid_field_id,
      vid_hblank => vid_hblank,
      vid_hsync => vid_hsync,
      vid_io_in_ce => vid_io_in_ce,
      vid_io_in_clk => vid_io_in_clk,
      vid_vblank => vid_vblank,
      vid_vsync => vid_vsync,
      vtd_active_video => vtd_active_video,
      vtd_field_id => vtd_field_id,
      vtd_hblank => vtd_hblank,
      vtd_hsync => vtd_hsync,
      vtd_vblank => vtd_vblank,
      vtd_vsync => vtd_vsync
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity v_vid_in_axi4s_0 is
  port (
    vid_io_in_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    vid_io_in_ce : in STD_LOGIC;
    vid_active_video : in STD_LOGIC;
    vid_vblank : in STD_LOGIC;
    vid_hblank : in STD_LOGIC;
    vid_vsync : in STD_LOGIC;
    vid_hsync : in STD_LOGIC;
    vid_field_id : in STD_LOGIC;
    vid_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_video_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_video_tvalid : out STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC;
    m_axis_video_tuser : out STD_LOGIC;
    m_axis_video_tlast : out STD_LOGIC;
    fid : out STD_LOGIC;
    vtd_active_video : out STD_LOGIC;
    vtd_vblank : out STD_LOGIC;
    vtd_hblank : out STD_LOGIC;
    vtd_vsync : out STD_LOGIC;
    vtd_hsync : out STD_LOGIC;
    vtd_field_id : out STD_LOGIC;
    wr_error : out STD_LOGIC;
    empty : out STD_LOGIC;
    axis_enable : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of v_vid_in_axi4s_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of v_vid_in_axi4s_0 : entity is "v_vid_in_axi4s_0,v_vid_in_axi4s_v3_0_vid_in_axi4s_top,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of v_vid_in_axi4s_0 : entity is "v_vid_in_axi4s_0,v_vid_in_axi4s_v3_0_vid_in_axi4s_top,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=v_vid_in_axi4s,x_ipVersion=3.0,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_M_AXIS_VIDEO_DATA_WIDTH=8,C_M_AXIS_VIDEO_FORMAT=0,VID_IN_DATA_WIDTH=16,C_M_AXIS_VIDEO_TDATA_WIDTH=16,RAM_ADDR_BITS=10,HYSTERESIS_LEVEL=12}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of v_vid_in_axi4s_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of v_vid_in_axi4s_0 : entity is "v_vid_in_axi4s_v3_0_vid_in_axi4s_top,Vivado 2015.2";
end v_vid_in_axi4s_0;

architecture STRUCTURE of v_vid_in_axi4s_0 is
  attribute C_M_AXIS_VIDEO_DATA_WIDTH : integer;
  attribute C_M_AXIS_VIDEO_DATA_WIDTH of inst : label is 8;
  attribute C_M_AXIS_VIDEO_FORMAT : integer;
  attribute C_M_AXIS_VIDEO_FORMAT of inst : label is 0;
  attribute C_M_AXIS_VIDEO_TDATA_WIDTH : integer;
  attribute C_M_AXIS_VIDEO_TDATA_WIDTH of inst : label is 16;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute HYSTERESIS_LEVEL : integer;
  attribute HYSTERESIS_LEVEL of inst : label is 12;
  attribute RAM_ADDR_BITS : integer;
  attribute RAM_ADDR_BITS of inst : label is 10;
  attribute VID_IN_DATA_WIDTH : integer;
  attribute VID_IN_DATA_WIDTH of inst : label is 16;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of inst : label is "xilinx.com:interface:axis:1.0 video_out TDATA";
begin
inst: entity work.v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top
     port map (
      aclk => aclk,
      aclken => aclken,
      aresetn => aresetn,
      axis_enable => axis_enable,
      empty => empty,
      fid => fid,
      m_axis_video_tdata(15 downto 0) => m_axis_video_tdata(15 downto 0),
      m_axis_video_tlast => m_axis_video_tlast,
      m_axis_video_tready => m_axis_video_tready,
      m_axis_video_tuser => m_axis_video_tuser,
      m_axis_video_tvalid => m_axis_video_tvalid,
      rst => rst,
      vid_active_video => vid_active_video,
      vid_data(15 downto 0) => vid_data(15 downto 0),
      vid_field_id => vid_field_id,
      vid_hblank => vid_hblank,
      vid_hsync => vid_hsync,
      vid_io_in_ce => vid_io_in_ce,
      vid_io_in_clk => vid_io_in_clk,
      vid_vblank => vid_vblank,
      vid_vsync => vid_vsync,
      vtd_active_video => vtd_active_video,
      vtd_field_id => vtd_field_id,
      vtd_hblank => vtd_hblank,
      vtd_hsync => vtd_hsync,
      vtd_vblank => vtd_vblank,
      vtd_vsync => vtd_vsync,
      wr_error => wr_error
    );
end STRUCTURE;
