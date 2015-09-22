// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue Sep 22 18:28:10 2015
// Host        : Windows running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Anthony/armqp/ip_repo/v_vid_in_axi4s_0/v_vid_in_axi4s_0_funcsim.v
// Design      : v_vid_in_axi4s_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "v_vid_in_axi4s_0,v_vid_in_axi4s_v3_0_vid_in_axi4s_top,{}" *) (* CORE_GENERATION_INFO = "v_vid_in_axi4s_0,v_vid_in_axi4s_v3_0_vid_in_axi4s_top,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=v_vid_in_axi4s,x_ipVersion=3.0,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_M_AXIS_VIDEO_DATA_WIDTH=8,C_M_AXIS_VIDEO_FORMAT=0,VID_IN_DATA_WIDTH=16,C_M_AXIS_VIDEO_TDATA_WIDTH=16,RAM_ADDR_BITS=10,HYSTERESIS_LEVEL=12}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* X_CORE_INFO = "v_vid_in_axi4s_v3_0_vid_in_axi4s_top,Vivado 2015.2" *) 
(* NotValidForBitStream *)
module v_vid_in_axi4s_0
   (vid_io_in_clk,
    rst,
    vid_io_in_ce,
    vid_active_video,
    vid_vblank,
    vid_hblank,
    vid_vsync,
    vid_hsync,
    vid_field_id,
    vid_data,
    aclk,
    aclken,
    aresetn,
    m_axis_video_tdata,
    m_axis_video_tvalid,
    m_axis_video_tready,
    m_axis_video_tuser,
    m_axis_video_tlast,
    fid,
    vtd_active_video,
    vtd_vblank,
    vtd_hblank,
    vtd_vsync,
    vtd_hsync,
    vtd_field_id,
    wr_error,
    empty,
    axis_enable);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 vid_io_in_clk_intf CLK" *) input vid_io_in_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_intf RST" *) input rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 vid_io_in_ce_intf CE" *) input vid_io_in_ce;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in ACTIVE_VIDEO" *) input vid_active_video;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in VBLANK" *) input vid_vblank;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in HBLANK" *) input vid_hblank;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in VSYNC" *) input vid_vsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in HSYNC" *) input vid_hsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in FIELD" *) input vid_field_id;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 vid_io_in DATA" *) input [15:0]vid_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 aclken_intf CE" *) input aclken;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn_intf RST" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TDATA" *) output [15:0]m_axis_video_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TVALID" *) output m_axis_video_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TREADY" *) input m_axis_video_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TUSER" *) output m_axis_video_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TLAST" *) output m_axis_video_tlast;
  output fid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:video_timing:2.0 vtiming_out ACTIVE_VIDEO" *) output vtd_active_video;
  (* X_INTERFACE_INFO = "xilinx.com:interface:video_timing:2.0 vtiming_out VBLANK" *) output vtd_vblank;
  (* X_INTERFACE_INFO = "xilinx.com:interface:video_timing:2.0 vtiming_out HBLANK" *) output vtd_hblank;
  (* X_INTERFACE_INFO = "xilinx.com:interface:video_timing:2.0 vtiming_out VSYNC" *) output vtd_vsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:video_timing:2.0 vtiming_out HSYNC" *) output vtd_hsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:video_timing:2.0 vtiming_out FIELD" *) output vtd_field_id;
  output wr_error;
  output empty;
  input axis_enable;

  wire aclk;
  wire aclken;
  wire aresetn;
  wire axis_enable;
  wire empty;
  wire fid;
  wire [15:0]m_axis_video_tdata;
  wire m_axis_video_tlast;
  wire m_axis_video_tready;
  wire m_axis_video_tuser;
  wire m_axis_video_tvalid;
  wire rst;
  wire vid_active_video;
  wire [15:0]vid_data;
  wire vid_field_id;
  wire vid_hblank;
  wire vid_hsync;
  wire vid_io_in_ce;
  wire vid_io_in_clk;
  wire vid_vblank;
  wire vid_vsync;
  wire vtd_active_video;
  wire vtd_field_id;
  wire vtd_hblank;
  wire vtd_hsync;
  wire vtd_vblank;
  wire vtd_vsync;
  wire wr_error;

  (* C_M_AXIS_VIDEO_DATA_WIDTH = "8" *) 
  (* C_M_AXIS_VIDEO_FORMAT = "0" *) 
  (* C_M_AXIS_VIDEO_TDATA_WIDTH = "16" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* HYSTERESIS_LEVEL = "12" *) 
  (* RAM_ADDR_BITS = "10" *) 
  (* VID_IN_DATA_WIDTH = "16" *) 
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 video_out TDATA" *) 
  v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top inst
       (.aclk(aclk),
        .aclken(aclken),
        .aresetn(aresetn),
        .axis_enable(axis_enable),
        .empty(empty),
        .fid(fid),
        .m_axis_video_tdata(m_axis_video_tdata),
        .m_axis_video_tlast(m_axis_video_tlast),
        .m_axis_video_tready(m_axis_video_tready),
        .m_axis_video_tuser(m_axis_video_tuser),
        .m_axis_video_tvalid(m_axis_video_tvalid),
        .rst(rst),
        .vid_active_video(vid_active_video),
        .vid_data(vid_data),
        .vid_field_id(vid_field_id),
        .vid_hblank(vid_hblank),
        .vid_hsync(vid_hsync),
        .vid_io_in_ce(vid_io_in_ce),
        .vid_io_in_clk(vid_io_in_clk),
        .vid_vblank(vid_vblank),
        .vid_vsync(vid_vsync),
        .vtd_active_video(vtd_active_video),
        .vtd_field_id(vtd_field_id),
        .vtd_hblank(vtd_hblank),
        .vtd_hsync(vtd_hsync),
        .vtd_vblank(vtd_vblank),
        .vtd_vsync(vtd_vsync),
        .wr_error(wr_error));
endmodule

(* ORIG_REF_NAME = "v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2" *) 
module v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2
   (SR,
    DOBDO,
    wr_error,
    full,
    empty,
    valid_reg,
    D,
    E,
    idf_de,
    vid_io_in_clk,
    aclk,
    DIADI,
    vid_io_in_ce,
    first_sof_reg,
    aresetn,
    rst,
    valid_reg_0,
    aclken,
    p_0_in6_in,
    m_axis_video_tready,
    p_0_in_0);
  output [0:0]SR;
  output [1:0]DOBDO;
  output wr_error;
  output full;
  output empty;
  output valid_reg;
  output [18:0]D;
  output [0:0]E;
  input idf_de;
  input vid_io_in_clk;
  input aclk;
  input [18:0]DIADI;
  input vid_io_in_ce;
  input first_sof_reg;
  input aresetn;
  input rst;
  input valid_reg_0;
  input aclken;
  input p_0_in6_in;
  input m_axis_video_tready;
  input p_0_in_0;

  wire [18:0]D;
  wire [18:0]DIADI;
  wire [1:0]DOBDO;
  wire [0:0]E;
  wire [0:0]SR;
  wire ack_rd_dom_1;
  wire ack_rd_dom_2;
  wire ack_rd_dom_3;
  wire ack_wr_dom_1;
  wire ack_wr_dom_2;
  wire ack_wr_dom_3;
  wire aclk;
  wire aclken;
  wire aresetn;
  wire ce_rd_ptr_sample;
  wire ce_rd_ptr_wr_dom;
  wire ce_wr_ptr_rd_dom;
  wire ce_wr_ptr_sample;
  wire empty;
  wire empty0;
  wire empty_i_2_n_0;
  wire [16:0]fifo_dout;
  wire fifo_empty;
  wire fifo_ram_reg_i_1_n_0;
  wire first_sof_reg;
  wire full;
  wire full_comb;
  wire idf_de;
  wire [9:2]level_rd;
  wire m_axis_video_tready;
  wire [0:0]p_0_in;
  wire p_0_in6_in;
  wire p_0_in_0;
  wire \ptr_diff_rd_dom[3]_i_2_n_0 ;
  wire \ptr_diff_rd_dom[3]_i_3_n_0 ;
  wire \ptr_diff_rd_dom[3]_i_4_n_0 ;
  wire \ptr_diff_rd_dom[3]_i_5_n_0 ;
  wire \ptr_diff_rd_dom[7]_i_2_n_0 ;
  wire \ptr_diff_rd_dom[7]_i_3_n_0 ;
  wire \ptr_diff_rd_dom[7]_i_4_n_0 ;
  wire \ptr_diff_rd_dom[7]_i_5_n_0 ;
  wire \ptr_diff_rd_dom[9]_i_2_n_0 ;
  wire \ptr_diff_rd_dom[9]_i_3_n_0 ;
  wire \ptr_diff_rd_dom[9]_i_4_n_0 ;
  wire \ptr_diff_rd_dom[9]_i_5_n_0 ;
  wire [11:0]ptr_diff_rd_dom_comb0_out;
  wire \ptr_diff_rd_dom_reg[3]_i_1_n_0 ;
  wire \ptr_diff_rd_dom_reg[3]_i_1_n_1 ;
  wire \ptr_diff_rd_dom_reg[3]_i_1_n_2 ;
  wire \ptr_diff_rd_dom_reg[3]_i_1_n_3 ;
  wire \ptr_diff_rd_dom_reg[7]_i_1_n_0 ;
  wire \ptr_diff_rd_dom_reg[7]_i_1_n_1 ;
  wire \ptr_diff_rd_dom_reg[7]_i_1_n_2 ;
  wire \ptr_diff_rd_dom_reg[7]_i_1_n_3 ;
  wire \ptr_diff_rd_dom_reg[9]_i_1_n_1 ;
  wire \ptr_diff_rd_dom_reg[9]_i_1_n_2 ;
  wire \ptr_diff_rd_dom_reg[9]_i_1_n_3 ;
  wire ram_out_rd_error;
  wire ram_out_rd_error_i_1_n_0;
  wire ram_out_rd_error_i_2_n_0;
  wire \rd_data[15]_i_4_n_0 ;
  wire rd_error_i_1_n_0;
  wire rd_error_i_2_n_0;
  wire rd_error_i_3_n_0;
  wire rd_error_i_4_n_0;
  wire rd_error_i_5_n_0;
  wire rd_error_i_6_n_0;
  wire rd_error_i_7_n_0;
  wire [11:0]rd_ptr_reg;
  wire \rd_ptr_reg[0]_i_1_n_0 ;
  wire \rd_ptr_reg[10]_i_1_n_0 ;
  wire \rd_ptr_reg[10]_i_2_n_0 ;
  wire \rd_ptr_reg[11]_i_1_n_0 ;
  wire \rd_ptr_reg[1]_i_1_n_0 ;
  wire \rd_ptr_reg[1]_i_2_n_0 ;
  wire \rd_ptr_reg[2]_i_1_n_0 ;
  wire \rd_ptr_reg[2]_i_2_n_0 ;
  wire \rd_ptr_reg[3]_i_1_n_0 ;
  wire \rd_ptr_reg[3]_i_2_n_0 ;
  wire \rd_ptr_reg[4]_i_1_n_0 ;
  wire \rd_ptr_reg[4]_i_2_n_0 ;
  wire \rd_ptr_reg[5]_i_1_n_0 ;
  wire \rd_ptr_reg[5]_i_2_n_0 ;
  wire \rd_ptr_reg[6]_i_1_n_0 ;
  wire \rd_ptr_reg[6]_i_2_n_0 ;
  wire \rd_ptr_reg[7]_i_1_n_0 ;
  wire \rd_ptr_reg[7]_i_2_n_0 ;
  wire \rd_ptr_reg[8]_i_1_n_0 ;
  wire \rd_ptr_reg[8]_i_2_n_0 ;
  wire \rd_ptr_reg[9]_i_1_n_0 ;
  wire \rd_ptr_reg[9]_i_2_n_0 ;
  wire \rd_ptr_reg_rep[3]_i_1_n_0 ;
  wire \rd_ptr_reg_rep[3]_i_1_n_1 ;
  wire \rd_ptr_reg_rep[3]_i_1_n_2 ;
  wire \rd_ptr_reg_rep[3]_i_1_n_3 ;
  wire \rd_ptr_reg_rep[3]_i_1_n_4 ;
  wire \rd_ptr_reg_rep[3]_i_1_n_5 ;
  wire \rd_ptr_reg_rep[3]_i_1_n_6 ;
  wire \rd_ptr_reg_rep[3]_i_1_n_7 ;
  wire \rd_ptr_reg_rep[7]_i_1_n_0 ;
  wire \rd_ptr_reg_rep[7]_i_1_n_1 ;
  wire \rd_ptr_reg_rep[7]_i_1_n_2 ;
  wire \rd_ptr_reg_rep[7]_i_1_n_3 ;
  wire \rd_ptr_reg_rep[7]_i_1_n_4 ;
  wire \rd_ptr_reg_rep[7]_i_1_n_5 ;
  wire \rd_ptr_reg_rep[7]_i_1_n_6 ;
  wire \rd_ptr_reg_rep[7]_i_1_n_7 ;
  wire \rd_ptr_reg_rep[9]_i_2_n_1 ;
  wire \rd_ptr_reg_rep[9]_i_2_n_2 ;
  wire \rd_ptr_reg_rep[9]_i_2_n_3 ;
  wire \rd_ptr_reg_rep[9]_i_2_n_4 ;
  wire \rd_ptr_reg_rep[9]_i_2_n_5 ;
  wire \rd_ptr_reg_rep[9]_i_2_n_6 ;
  wire \rd_ptr_reg_rep[9]_i_2_n_7 ;
  wire \rd_ptr_reg_rep_n_0_[0] ;
  wire \rd_ptr_reg_rep_n_0_[1] ;
  wire \rd_ptr_reg_rep_n_0_[2] ;
  wire \rd_ptr_reg_rep_n_0_[3] ;
  wire \rd_ptr_reg_rep_n_0_[4] ;
  wire \rd_ptr_reg_rep_n_0_[5] ;
  wire \rd_ptr_reg_rep_n_0_[6] ;
  wire \rd_ptr_reg_rep_n_0_[7] ;
  wire \rd_ptr_reg_rep_n_0_[8] ;
  wire \rd_ptr_reg_rep_n_0_[9] ;
  wire \rd_ptr_rep[3]_i_2_n_0 ;
  wire \rd_ptr_rep[3]_i_3_n_0 ;
  wire \rd_ptr_rep[3]_i_4_n_0 ;
  wire \rd_ptr_rep[3]_i_5_n_0 ;
  wire \rd_ptr_rep[7]_i_2_n_0 ;
  wire \rd_ptr_rep[7]_i_3_n_0 ;
  wire \rd_ptr_rep[7]_i_4_n_0 ;
  wire \rd_ptr_rep[7]_i_5_n_0 ;
  wire \rd_ptr_rep[9]_i_10_n_0 ;
  wire \rd_ptr_rep[9]_i_1_n_0 ;
  wire \rd_ptr_rep[9]_i_3_n_0 ;
  wire \rd_ptr_rep[9]_i_4_n_0 ;
  wire \rd_ptr_rep[9]_i_5_n_0 ;
  wire \rd_ptr_rep[9]_i_6_n_0 ;
  wire \rd_ptr_rep[9]_i_7_n_0 ;
  wire \rd_ptr_rep[9]_i_8_n_0 ;
  wire \rd_ptr_rep[9]_i_9_n_0 ;
  wire [10:0]rd_ptr_sample;
  wire \rd_ptr_wr_dom_reg_n_0_[0] ;
  wire \rd_ptr_wr_dom_reg_n_0_[10] ;
  wire \rd_ptr_wr_dom_reg_n_0_[1] ;
  wire \rd_ptr_wr_dom_reg_n_0_[2] ;
  wire \rd_ptr_wr_dom_reg_n_0_[3] ;
  wire \rd_ptr_wr_dom_reg_n_0_[4] ;
  wire \rd_ptr_wr_dom_reg_n_0_[5] ;
  wire \rd_ptr_wr_dom_reg_n_0_[6] ;
  wire \rd_ptr_wr_dom_reg_n_0_[7] ;
  wire \rd_ptr_wr_dom_reg_n_0_[8] ;
  wire \rd_ptr_wr_dom_reg_n_0_[9] ;
  wire rd_to_wr_req;
  wire req_rd_dom_1;
  wire req_rd_dom_2;
  wire req_rd_dom_3;
  wire req_wr_dom_1;
  wire req_wr_dom_2;
  wire req_wr_dom_3;
  wire rst;
  wire rst_rd_1;
  wire rst_rd_2;
  wire rst_wr_1;
  wire rst_wr_2;
  wire valid_i_2_n_0;
  wire valid_i_3_n_0;
  wire valid_i_4_n_0;
  wire valid_reg;
  wire valid_reg_0;
  wire vid_io_in_ce;
  wire vid_io_in_clk;
  wire wr_error;
  wire wr_error_i_10_n_0;
  wire wr_error_i_11_n_0;
  wire wr_error_i_12_n_0;
  wire wr_error_i_13_n_0;
  wire wr_error_i_14_n_0;
  wire wr_error_i_15_n_0;
  wire wr_error_i_1_n_0;
  wire wr_error_i_4_n_0;
  wire wr_error_i_5_n_0;
  wire wr_error_i_6_n_0;
  wire wr_error_i_8_n_0;
  wire wr_error_i_9_n_0;
  wire wr_error_reg_i_2_n_2;
  wire wr_error_reg_i_2_n_3;
  wire wr_error_reg_i_2_n_6;
  wire wr_error_reg_i_2_n_7;
  wire wr_error_reg_i_3_n_0;
  wire wr_error_reg_i_3_n_1;
  wire wr_error_reg_i_3_n_2;
  wire wr_error_reg_i_3_n_3;
  wire wr_error_reg_i_3_n_4;
  wire wr_error_reg_i_3_n_5;
  wire wr_error_reg_i_3_n_6;
  wire wr_error_reg_i_3_n_7;
  wire wr_error_reg_i_7_n_0;
  wire wr_error_reg_i_7_n_1;
  wire wr_error_reg_i_7_n_2;
  wire wr_error_reg_i_7_n_3;
  wire wr_error_reg_i_7_n_4;
  wire wr_error_reg_i_7_n_5;
  wire wr_error_reg_i_7_n_6;
  wire wr_error_reg_i_7_n_7;
  wire \wr_ptr[0]_i_1_n_0 ;
  wire \wr_ptr[0]_i_3_n_0 ;
  wire [11:0]wr_ptr_rd_dom;
  wire [9:0]wr_ptr_reg;
  wire \wr_ptr_reg[0]_i_2_n_0 ;
  wire \wr_ptr_reg[10]_i_1_n_0 ;
  wire \wr_ptr_reg[10]_i_2_n_0 ;
  wire \wr_ptr_reg[11]_i_1_n_0 ;
  wire \wr_ptr_reg[1]_i_1_n_0 ;
  wire \wr_ptr_reg[1]_i_2_n_0 ;
  wire \wr_ptr_reg[2]_i_1_n_0 ;
  wire \wr_ptr_reg[2]_i_2_n_0 ;
  wire \wr_ptr_reg[3]_i_1_n_0 ;
  wire \wr_ptr_reg[3]_i_2_n_0 ;
  wire \wr_ptr_reg[4]_i_1_n_0 ;
  wire \wr_ptr_reg[4]_i_2_n_0 ;
  wire \wr_ptr_reg[5]_i_1_n_0 ;
  wire \wr_ptr_reg[5]_i_2_n_0 ;
  wire \wr_ptr_reg[6]_i_1_n_0 ;
  wire \wr_ptr_reg[6]_i_2_n_0 ;
  wire \wr_ptr_reg[7]_i_1_n_0 ;
  wire \wr_ptr_reg[7]_i_2_n_0 ;
  wire \wr_ptr_reg[8]_i_1_n_0 ;
  wire \wr_ptr_reg[8]_i_2_n_0 ;
  wire \wr_ptr_reg[9]_i_1_n_0 ;
  wire \wr_ptr_reg[9]_i_2_n_0 ;
  wire [11:10]wr_ptr_reg__0;
  wire [11:0]wr_ptr_sample;
  wire wr_to_rd_req;
  wire NLW_fifo_ram_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_fifo_ram_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_fifo_ram_reg_DBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_fifo_ram_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_fifo_ram_reg_DOADO_UNCONNECTED;
  wire [31:19]NLW_fifo_ram_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_fifo_ram_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_fifo_ram_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_fifo_ram_reg_RDADDRECC_UNCONNECTED;
  wire [3:3]\NLW_ptr_diff_rd_dom_reg[9]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_rd_ptr_reg[9]_i_2_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_rd_ptr_reg[9]_i_2_CARRY4_DI_UNCONNECTED ;
  wire [3:3]\NLW_rd_ptr_reg_rep[9]_i_2_CO_UNCONNECTED ;
  wire [3:2]NLW_wr_error_reg_i_2_CO_UNCONNECTED;
  wire [3:3]NLW_wr_error_reg_i_2_O_UNCONNECTED;
  wire [3:2]\NLW_wr_ptr_reg[9]_i_2_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_wr_ptr_reg[9]_i_2_CARRY4_DI_UNCONNECTED ;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE ack_rd_dom_1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(req_wr_dom_3),
        .Q(ack_rd_dom_1),
        .R(rst_rd_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE ack_rd_dom_2_reg
       (.C(aclk),
        .CE(1'b1),
        .D(ack_rd_dom_1),
        .Q(ack_rd_dom_2),
        .R(rst_rd_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE ack_rd_dom_3_reg
       (.C(aclk),
        .CE(1'b1),
        .D(ack_rd_dom_2),
        .Q(ack_rd_dom_3),
        .R(rst_rd_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE ack_wr_dom_1_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(req_rd_dom_3),
        .Q(ack_wr_dom_1),
        .R(rst_wr_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE ack_wr_dom_2_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(ack_wr_dom_1),
        .Q(ack_wr_dom_2),
        .R(rst_wr_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE ack_wr_dom_3_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(ack_wr_dom_2),
        .Q(ack_wr_dom_3),
        .R(rst_wr_2));
  LUT6 #(
    .INIT(64'h00000000EFFFEFAA)) 
    empty_i_1
       (.I0(fifo_empty),
        .I1(m_axis_video_tready),
        .I2(valid_reg_0),
        .I3(valid_i_2_n_0),
        .I4(empty_i_2_n_0),
        .I5(\rd_ptr_rep[9]_i_3_n_0 ),
        .O(empty0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFEA)) 
    empty_i_2
       (.I0(level_rd[4]),
        .I1(level_rd[2]),
        .I2(level_rd[3]),
        .I3(rd_error_i_7_n_0),
        .O(empty_i_2_n_0));
  FDSE empty_reg
       (.C(aclk),
        .CE(1'b1),
        .D(empty0),
        .Q(fifo_empty),
        .S(rst_rd_2));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19456" *) 
  (* RTL_RAM_NAME = "fifo_ram" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "35" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    fifo_ram_reg
       (.ADDRARDADDR({1'b1,wr_ptr_reg,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\rd_ptr_reg_rep_n_0_[9] ,\rd_ptr_reg_rep_n_0_[8] ,\rd_ptr_reg_rep_n_0_[7] ,\rd_ptr_reg_rep_n_0_[6] ,\rd_ptr_reg_rep_n_0_[5] ,\rd_ptr_reg_rep_n_0_[4] ,\rd_ptr_reg_rep_n_0_[3] ,\rd_ptr_reg_rep_n_0_[2] ,\rd_ptr_reg_rep_n_0_[1] ,\rd_ptr_reg_rep_n_0_[0] ,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_fifo_ram_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_fifo_ram_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(vid_io_in_clk),
        .CLKBWRCLK(aclk),
        .DBITERR(NLW_fifo_ram_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DIADI}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_fifo_ram_reg_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_fifo_ram_reg_DOBDO_UNCONNECTED[31:19],DOBDO,fifo_dout}),
        .DOPADOP(NLW_fifo_ram_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_fifo_ram_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_fifo_ram_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(idf_de),
        .ENBWREN(fifo_ram_reg_i_1_n_0),
        .INJECTDBITERR(NLW_fifo_ram_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_fifo_ram_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_fifo_ram_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(rst_rd_2),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_fifo_ram_reg_SBITERR_UNCONNECTED),
        .WEA({vid_io_in_ce,vid_io_in_ce,vid_io_in_ce,vid_io_in_ce}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT5 #(
    .INIT(32'hFFFFFF45)) 
    fifo_ram_reg_i_1
       (.I0(rd_error_i_2_n_0),
        .I1(first_sof_reg),
        .I2(rd_error_i_3_n_0),
        .I3(rst_rd_2),
        .I4(rd_error_i_4_n_0),
        .O(fifo_ram_reg_i_1_n_0));
  FDRE full_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(full_comb),
        .Q(full),
        .R(rst_wr_2));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[3]_i_2 
       (.I0(wr_ptr_rd_dom[3]),
        .I1(rd_ptr_reg[3]),
        .O(\ptr_diff_rd_dom[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[3]_i_3 
       (.I0(wr_ptr_rd_dom[2]),
        .I1(rd_ptr_reg[2]),
        .O(\ptr_diff_rd_dom[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[3]_i_4 
       (.I0(wr_ptr_rd_dom[1]),
        .I1(rd_ptr_reg[1]),
        .O(\ptr_diff_rd_dom[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[3]_i_5 
       (.I0(wr_ptr_rd_dom[0]),
        .I1(rd_ptr_reg[0]),
        .O(\ptr_diff_rd_dom[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[7]_i_2 
       (.I0(wr_ptr_rd_dom[7]),
        .I1(rd_ptr_reg[7]),
        .O(\ptr_diff_rd_dom[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[7]_i_3 
       (.I0(wr_ptr_rd_dom[6]),
        .I1(rd_ptr_reg[6]),
        .O(\ptr_diff_rd_dom[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[7]_i_4 
       (.I0(wr_ptr_rd_dom[5]),
        .I1(rd_ptr_reg[5]),
        .O(\ptr_diff_rd_dom[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[7]_i_5 
       (.I0(wr_ptr_rd_dom[4]),
        .I1(rd_ptr_reg[4]),
        .O(\ptr_diff_rd_dom[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[9]_i_2 
       (.I0(wr_ptr_rd_dom[11]),
        .I1(rd_ptr_reg[11]),
        .O(\ptr_diff_rd_dom[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[9]_i_3 
       (.I0(wr_ptr_rd_dom[10]),
        .I1(rd_ptr_reg[10]),
        .O(\ptr_diff_rd_dom[9]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[9]_i_4 
       (.I0(wr_ptr_rd_dom[9]),
        .I1(rd_ptr_reg[9]),
        .O(\ptr_diff_rd_dom[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \ptr_diff_rd_dom[9]_i_5 
       (.I0(wr_ptr_rd_dom[8]),
        .I1(rd_ptr_reg[8]),
        .O(\ptr_diff_rd_dom[9]_i_5_n_0 ));
  FDRE \ptr_diff_rd_dom_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(ptr_diff_rd_dom_comb0_out[2]),
        .Q(level_rd[2]),
        .R(rst_rd_2));
  FDRE \ptr_diff_rd_dom_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(ptr_diff_rd_dom_comb0_out[3]),
        .Q(level_rd[3]),
        .R(rst_rd_2));
  CARRY4 \ptr_diff_rd_dom_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\ptr_diff_rd_dom_reg[3]_i_1_n_0 ,\ptr_diff_rd_dom_reg[3]_i_1_n_1 ,\ptr_diff_rd_dom_reg[3]_i_1_n_2 ,\ptr_diff_rd_dom_reg[3]_i_1_n_3 }),
        .CYINIT(1'b1),
        .DI(wr_ptr_rd_dom[3:0]),
        .O(ptr_diff_rd_dom_comb0_out[3:0]),
        .S({\ptr_diff_rd_dom[3]_i_2_n_0 ,\ptr_diff_rd_dom[3]_i_3_n_0 ,\ptr_diff_rd_dom[3]_i_4_n_0 ,\ptr_diff_rd_dom[3]_i_5_n_0 }));
  FDRE \ptr_diff_rd_dom_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(ptr_diff_rd_dom_comb0_out[4]),
        .Q(level_rd[4]),
        .R(rst_rd_2));
  FDRE \ptr_diff_rd_dom_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(ptr_diff_rd_dom_comb0_out[5]),
        .Q(level_rd[5]),
        .R(rst_rd_2));
  FDRE \ptr_diff_rd_dom_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(ptr_diff_rd_dom_comb0_out[6]),
        .Q(level_rd[6]),
        .R(rst_rd_2));
  FDRE \ptr_diff_rd_dom_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(ptr_diff_rd_dom_comb0_out[7]),
        .Q(level_rd[7]),
        .R(rst_rd_2));
  CARRY4 \ptr_diff_rd_dom_reg[7]_i_1 
       (.CI(\ptr_diff_rd_dom_reg[3]_i_1_n_0 ),
        .CO({\ptr_diff_rd_dom_reg[7]_i_1_n_0 ,\ptr_diff_rd_dom_reg[7]_i_1_n_1 ,\ptr_diff_rd_dom_reg[7]_i_1_n_2 ,\ptr_diff_rd_dom_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(wr_ptr_rd_dom[7:4]),
        .O(ptr_diff_rd_dom_comb0_out[7:4]),
        .S({\ptr_diff_rd_dom[7]_i_2_n_0 ,\ptr_diff_rd_dom[7]_i_3_n_0 ,\ptr_diff_rd_dom[7]_i_4_n_0 ,\ptr_diff_rd_dom[7]_i_5_n_0 }));
  FDRE \ptr_diff_rd_dom_reg[8] 
       (.C(aclk),
        .CE(1'b1),
        .D(ptr_diff_rd_dom_comb0_out[8]),
        .Q(level_rd[8]),
        .R(rst_rd_2));
  FDRE \ptr_diff_rd_dom_reg[9] 
       (.C(aclk),
        .CE(1'b1),
        .D(ptr_diff_rd_dom_comb0_out[9]),
        .Q(level_rd[9]),
        .R(rst_rd_2));
  CARRY4 \ptr_diff_rd_dom_reg[9]_i_1 
       (.CI(\ptr_diff_rd_dom_reg[7]_i_1_n_0 ),
        .CO({\NLW_ptr_diff_rd_dom_reg[9]_i_1_CO_UNCONNECTED [3],\ptr_diff_rd_dom_reg[9]_i_1_n_1 ,\ptr_diff_rd_dom_reg[9]_i_1_n_2 ,\ptr_diff_rd_dom_reg[9]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,wr_ptr_rd_dom[10:8]}),
        .O(ptr_diff_rd_dom_comb0_out[11:8]),
        .S({\ptr_diff_rd_dom[9]_i_2_n_0 ,\ptr_diff_rd_dom[9]_i_3_n_0 ,\ptr_diff_rd_dom[9]_i_4_n_0 ,\ptr_diff_rd_dom[9]_i_5_n_0 }));
  LUT5 #(
    .INIT(32'hFF570054)) 
    ram_out_rd_error_i_1
       (.I0(\rd_ptr_rep[9]_i_3_n_0 ),
        .I1(rd_error_i_4_n_0),
        .I2(ram_out_rd_error_i_2_n_0),
        .I3(rst_rd_2),
        .I4(ram_out_rd_error),
        .O(ram_out_rd_error_i_1_n_0));
  LUT6 #(
    .INIT(64'hB000B0000000B000)) 
    ram_out_rd_error_i_2
       (.I0(m_axis_video_tready),
        .I1(valid_reg_0),
        .I2(valid_i_2_n_0),
        .I3(aclken),
        .I4(fifo_empty),
        .I5(fifo_dout[16]),
        .O(ram_out_rd_error_i_2_n_0));
  FDRE ram_out_rd_error_reg
       (.C(aclk),
        .CE(1'b1),
        .D(ram_out_rd_error_i_1_n_0),
        .Q(ram_out_rd_error),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[0]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[0]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[10]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[10]),
        .O(D[10]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[11]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[12]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[12]),
        .O(D[12]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[13]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[13]),
        .O(D[13]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[14]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[14]),
        .O(D[14]));
  LUT2 #(
    .INIT(4'hB)) 
    \rd_data[15]_i_1 
       (.I0(rst),
        .I1(aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFFBB0B0000)) 
    \rd_data[15]_i_2 
       (.I0(fifo_dout[16]),
        .I1(fifo_empty),
        .I2(valid_reg_0),
        .I3(m_axis_video_tready),
        .I4(aclken),
        .I5(\rd_data[15]_i_4_n_0 ),
        .O(E));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[15]_i_3 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[15]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000DF00)) 
    \rd_data[15]_i_4 
       (.I0(DOBDO[0]),
        .I1(DOBDO[1]),
        .I2(p_0_in6_in),
        .I3(aclken),
        .I4(first_sof_reg),
        .O(\rd_data[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[16]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[16]),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8C88)) 
    \rd_data[17]_i_1 
       (.I0(first_sof_reg),
        .I1(DOBDO[0]),
        .I2(DOBDO[1]),
        .I3(p_0_in6_in),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rd_data[18]_i_1 
       (.I0(first_sof_reg),
        .I1(DOBDO[1]),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[1]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[1]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[2]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[2]),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[3]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[3]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[4]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[5]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[5]),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[6]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[6]),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[7]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[7]),
        .O(D[7]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[8]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[8]),
        .O(D[8]));
  LUT5 #(
    .INIT(32'hFF200000)) 
    \rd_data[9]_i_1 
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .I3(first_sof_reg),
        .I4(fifo_dout[9]),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hAAAAEFEEAAAA2022)) 
    rd_error_i_1
       (.I0(ram_out_rd_error),
        .I1(rd_error_i_2_n_0),
        .I2(first_sof_reg),
        .I3(rd_error_i_3_n_0),
        .I4(rd_error_i_4_n_0),
        .I5(empty),
        .O(rd_error_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h4FFF4F4F)) 
    rd_error_i_2
       (.I0(fifo_dout[16]),
        .I1(fifo_empty),
        .I2(aclken),
        .I3(m_axis_video_tready),
        .I4(valid_reg_0),
        .O(rd_error_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    rd_error_i_3
       (.I0(p_0_in6_in),
        .I1(DOBDO[1]),
        .I2(DOBDO[0]),
        .O(rd_error_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000DDD000000000)) 
    rd_error_i_4
       (.I0(DOBDO[0]),
        .I1(rd_error_i_5_n_0),
        .I2(rd_error_i_6_n_0),
        .I3(rd_error_i_7_n_0),
        .I4(first_sof_reg),
        .I5(aclken),
        .O(rd_error_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    rd_error_i_5
       (.I0(DOBDO[1]),
        .I1(p_0_in6_in),
        .O(rd_error_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    rd_error_i_6
       (.I0(level_rd[3]),
        .I1(level_rd[2]),
        .I2(level_rd[4]),
        .O(rd_error_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    rd_error_i_7
       (.I0(level_rd[9]),
        .I1(level_rd[5]),
        .I2(level_rd[6]),
        .I3(p_0_in_0),
        .I4(level_rd[7]),
        .I5(level_rd[8]),
        .O(rd_error_i_7_n_0));
  FDRE rd_error_reg
       (.C(aclk),
        .CE(1'b1),
        .D(rd_error_i_1_n_0),
        .Q(empty),
        .R(rst_rd_2));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_ptr[0]_i_2 
       (.I0(rd_ptr_reg[0]),
        .O(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[0] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[0]_i_1_n_0 ),
        .Q(rd_ptr_reg[0]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[10] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[10]_i_1_n_0 ),
        .Q(rd_ptr_reg[10]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[11] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[11]_i_1_n_0 ),
        .Q(rd_ptr_reg[11]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[1] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[1]_i_1_n_0 ),
        .Q(rd_ptr_reg[1]),
        .R(rst_rd_2));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY4 \rd_ptr_reg[1]_i_2_CARRY4 
       (.CI(1'b0),
        .CO({\rd_ptr_reg[4]_i_2_n_0 ,\rd_ptr_reg[3]_i_2_n_0 ,\rd_ptr_reg[2]_i_2_n_0 ,\rd_ptr_reg[1]_i_2_n_0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\rd_ptr_reg[3]_i_1_n_0 ,\rd_ptr_reg[2]_i_1_n_0 ,\rd_ptr_reg[1]_i_1_n_0 ,\rd_ptr_reg[0]_i_1_n_0 }),
        .S({rd_ptr_reg[3:1],p_0_in}));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[2] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[2]_i_1_n_0 ),
        .Q(rd_ptr_reg[2]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[3] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[3]_i_1_n_0 ),
        .Q(rd_ptr_reg[3]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[4] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[4]_i_1_n_0 ),
        .Q(rd_ptr_reg[4]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[5] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[5]_i_1_n_0 ),
        .Q(rd_ptr_reg[5]),
        .R(rst_rd_2));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY4 \rd_ptr_reg[5]_i_2_CARRY4 
       (.CI(\rd_ptr_reg[4]_i_2_n_0 ),
        .CO({\rd_ptr_reg[8]_i_2_n_0 ,\rd_ptr_reg[7]_i_2_n_0 ,\rd_ptr_reg[6]_i_2_n_0 ,\rd_ptr_reg[5]_i_2_n_0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg[7]_i_1_n_0 ,\rd_ptr_reg[6]_i_1_n_0 ,\rd_ptr_reg[5]_i_1_n_0 ,\rd_ptr_reg[4]_i_1_n_0 }),
        .S(rd_ptr_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[6] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[6]_i_1_n_0 ),
        .Q(rd_ptr_reg[6]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[7] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[7]_i_1_n_0 ),
        .Q(rd_ptr_reg[7]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[8] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[8]_i_1_n_0 ),
        .Q(rd_ptr_reg[8]),
        .R(rst_rd_2));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[9] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg[9]_i_1_n_0 ),
        .Q(rd_ptr_reg[9]),
        .R(rst_rd_2));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY4 \rd_ptr_reg[9]_i_2_CARRY4 
       (.CI(\rd_ptr_reg[8]_i_2_n_0 ),
        .CO({\NLW_rd_ptr_reg[9]_i_2_CARRY4_CO_UNCONNECTED [3:2],\rd_ptr_reg[10]_i_2_n_0 ,\rd_ptr_reg[9]_i_2_n_0 }),
        .CYINIT(1'b0),
        .DI({\NLW_rd_ptr_reg[9]_i_2_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg[11]_i_1_n_0 ,\rd_ptr_reg[10]_i_1_n_0 ,\rd_ptr_reg[9]_i_1_n_0 ,\rd_ptr_reg[8]_i_1_n_0 }),
        .S(rd_ptr_reg[11:8]));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[0] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[3]_i_1_n_7 ),
        .Q(\rd_ptr_reg_rep_n_0_[0] ),
        .R(rst_rd_2));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[1] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[3]_i_1_n_6 ),
        .Q(\rd_ptr_reg_rep_n_0_[1] ),
        .R(rst_rd_2));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[2] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[3]_i_1_n_5 ),
        .Q(\rd_ptr_reg_rep_n_0_[2] ),
        .R(rst_rd_2));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[3] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[3]_i_1_n_4 ),
        .Q(\rd_ptr_reg_rep_n_0_[3] ),
        .R(rst_rd_2));
  CARRY4 \rd_ptr_reg_rep[3]_i_1 
       (.CI(1'b0),
        .CO({\rd_ptr_reg_rep[3]_i_1_n_0 ,\rd_ptr_reg_rep[3]_i_1_n_1 ,\rd_ptr_reg_rep[3]_i_1_n_2 ,\rd_ptr_reg_rep[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,rd_ptr_reg[0]}),
        .O({\rd_ptr_reg_rep[3]_i_1_n_4 ,\rd_ptr_reg_rep[3]_i_1_n_5 ,\rd_ptr_reg_rep[3]_i_1_n_6 ,\rd_ptr_reg_rep[3]_i_1_n_7 }),
        .S({\rd_ptr_rep[3]_i_2_n_0 ,\rd_ptr_rep[3]_i_3_n_0 ,\rd_ptr_rep[3]_i_4_n_0 ,\rd_ptr_rep[3]_i_5_n_0 }));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[4] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[7]_i_1_n_7 ),
        .Q(\rd_ptr_reg_rep_n_0_[4] ),
        .R(rst_rd_2));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[5] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[7]_i_1_n_6 ),
        .Q(\rd_ptr_reg_rep_n_0_[5] ),
        .R(rst_rd_2));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[6] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[7]_i_1_n_5 ),
        .Q(\rd_ptr_reg_rep_n_0_[6] ),
        .R(rst_rd_2));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[7] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[7]_i_1_n_4 ),
        .Q(\rd_ptr_reg_rep_n_0_[7] ),
        .R(rst_rd_2));
  CARRY4 \rd_ptr_reg_rep[7]_i_1 
       (.CI(\rd_ptr_reg_rep[3]_i_1_n_0 ),
        .CO({\rd_ptr_reg_rep[7]_i_1_n_0 ,\rd_ptr_reg_rep[7]_i_1_n_1 ,\rd_ptr_reg_rep[7]_i_1_n_2 ,\rd_ptr_reg_rep[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg_rep[7]_i_1_n_4 ,\rd_ptr_reg_rep[7]_i_1_n_5 ,\rd_ptr_reg_rep[7]_i_1_n_6 ,\rd_ptr_reg_rep[7]_i_1_n_7 }),
        .S({\rd_ptr_rep[7]_i_2_n_0 ,\rd_ptr_rep[7]_i_3_n_0 ,\rd_ptr_rep[7]_i_4_n_0 ,\rd_ptr_rep[7]_i_5_n_0 }));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[8] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[9]_i_2_n_7 ),
        .Q(\rd_ptr_reg_rep_n_0_[8] ),
        .R(rst_rd_2));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_rep[9] 
       (.C(aclk),
        .CE(\rd_ptr_rep[9]_i_1_n_0 ),
        .D(\rd_ptr_reg_rep[9]_i_2_n_6 ),
        .Q(\rd_ptr_reg_rep_n_0_[9] ),
        .R(rst_rd_2));
  CARRY4 \rd_ptr_reg_rep[9]_i_2 
       (.CI(\rd_ptr_reg_rep[7]_i_1_n_0 ),
        .CO({\NLW_rd_ptr_reg_rep[9]_i_2_CO_UNCONNECTED [3],\rd_ptr_reg_rep[9]_i_2_n_1 ,\rd_ptr_reg_rep[9]_i_2_n_2 ,\rd_ptr_reg_rep[9]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rd_ptr_reg_rep[9]_i_2_n_4 ,\rd_ptr_reg_rep[9]_i_2_n_5 ,\rd_ptr_reg_rep[9]_i_2_n_6 ,\rd_ptr_reg_rep[9]_i_2_n_7 }),
        .S({\rd_ptr_rep[9]_i_6_n_0 ,\rd_ptr_rep[9]_i_7_n_0 ,\rd_ptr_rep[9]_i_8_n_0 ,\rd_ptr_rep[9]_i_9_n_0 }));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[3]_i_2 
       (.I0(rd_ptr_reg[3]),
        .O(\rd_ptr_rep[3]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[3]_i_3 
       (.I0(rd_ptr_reg[2]),
        .O(\rd_ptr_rep[3]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[3]_i_4 
       (.I0(rd_ptr_reg[1]),
        .O(\rd_ptr_rep[3]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_ptr_rep[3]_i_5 
       (.I0(rd_ptr_reg[0]),
        .O(\rd_ptr_rep[3]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[7]_i_2 
       (.I0(rd_ptr_reg[7]),
        .O(\rd_ptr_rep[7]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[7]_i_3 
       (.I0(rd_ptr_reg[6]),
        .O(\rd_ptr_rep[7]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[7]_i_4 
       (.I0(rd_ptr_reg[5]),
        .O(\rd_ptr_rep[7]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[7]_i_5 
       (.I0(rd_ptr_reg[4]),
        .O(\rd_ptr_rep[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA888888888888888)) 
    \rd_ptr_rep[9]_i_1 
       (.I0(\rd_ptr_rep[9]_i_3_n_0 ),
        .I1(rd_error_i_4_n_0),
        .I2(\rd_ptr_rep[9]_i_4_n_0 ),
        .I3(valid_i_2_n_0),
        .I4(aclken),
        .I5(\rd_ptr_rep[9]_i_5_n_0 ),
        .O(\rd_ptr_rep[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \rd_ptr_rep[9]_i_10 
       (.I0(ptr_diff_rd_dom_comb0_out[5]),
        .I1(ptr_diff_rd_dom_comb0_out[7]),
        .I2(ptr_diff_rd_dom_comb0_out[3]),
        .I3(ptr_diff_rd_dom_comb0_out[1]),
        .I4(ptr_diff_rd_dom_comb0_out[4]),
        .I5(ptr_diff_rd_dom_comb0_out[2]),
        .O(\rd_ptr_rep[9]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \rd_ptr_rep[9]_i_3 
       (.I0(ptr_diff_rd_dom_comb0_out[8]),
        .I1(ptr_diff_rd_dom_comb0_out[9]),
        .I2(ptr_diff_rd_dom_comb0_out[6]),
        .I3(ptr_diff_rd_dom_comb0_out[10]),
        .I4(ptr_diff_rd_dom_comb0_out[11]),
        .I5(\rd_ptr_rep[9]_i_10_n_0 ),
        .O(\rd_ptr_rep[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \rd_ptr_rep[9]_i_4 
       (.I0(m_axis_video_tready),
        .I1(valid_reg_0),
        .O(\rd_ptr_rep[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \rd_ptr_rep[9]_i_5 
       (.I0(fifo_dout[16]),
        .I1(fifo_empty),
        .O(\rd_ptr_rep[9]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[9]_i_6 
       (.I0(rd_ptr_reg[11]),
        .O(\rd_ptr_rep[9]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[9]_i_7 
       (.I0(rd_ptr_reg[10]),
        .O(\rd_ptr_rep[9]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[9]_i_8 
       (.I0(rd_ptr_reg[9]),
        .O(\rd_ptr_rep[9]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h2)) 
    \rd_ptr_rep[9]_i_9 
       (.I0(rd_ptr_reg[8]),
        .O(\rd_ptr_rep[9]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_ptr_sample[10]_i_1 
       (.I0(ack_rd_dom_2),
        .I1(ack_rd_dom_3),
        .O(ce_rd_ptr_sample));
  FDRE \rd_ptr_sample_reg[0] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[0]),
        .Q(rd_ptr_sample[0]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[10] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[10]),
        .Q(rd_ptr_sample[10]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[1] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[1]),
        .Q(rd_ptr_sample[1]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[2] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[2]),
        .Q(rd_ptr_sample[2]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[3] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[3]),
        .Q(rd_ptr_sample[3]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[4] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[4]),
        .Q(rd_ptr_sample[4]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[5] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[5]),
        .Q(rd_ptr_sample[5]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[6] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[6]),
        .Q(rd_ptr_sample[6]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[7] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[7]),
        .Q(rd_ptr_sample[7]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[8] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[8]),
        .Q(rd_ptr_sample[8]),
        .R(rst_rd_2));
  FDRE \rd_ptr_sample_reg[9] 
       (.C(aclk),
        .CE(ce_rd_ptr_sample),
        .D(rd_ptr_reg[9]),
        .Q(rd_ptr_sample[9]),
        .R(rst_rd_2));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_ptr_wr_dom[10]_i_1 
       (.I0(req_wr_dom_2),
        .I1(req_wr_dom_3),
        .O(ce_rd_ptr_wr_dom));
  FDRE \rd_ptr_wr_dom_reg[0] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[0]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[0] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[10] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[10]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[10] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[1] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[1]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[1] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[2] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[2]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[2] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[3] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[3]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[3] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[4] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[4]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[4] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[5] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[5]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[5] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[6] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[6]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[6] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[7] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[7]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[7] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[8] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[8]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[8] ),
        .R(rst_wr_2));
  FDRE \rd_ptr_wr_dom_reg[9] 
       (.C(vid_io_in_clk),
        .CE(ce_rd_ptr_wr_dom),
        .D(rd_ptr_sample[9]),
        .Q(\rd_ptr_wr_dom_reg_n_0_[9] ),
        .R(rst_wr_2));
  LUT1 #(
    .INIT(2'h1)) 
    req_rd_dom_1_i_1
       (.I0(ack_wr_dom_3),
        .O(wr_to_rd_req));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE req_rd_dom_1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(wr_to_rd_req),
        .Q(req_rd_dom_1),
        .R(rst_rd_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE req_rd_dom_2_reg
       (.C(aclk),
        .CE(1'b1),
        .D(req_rd_dom_1),
        .Q(req_rd_dom_2),
        .R(rst_rd_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE req_rd_dom_3_reg
       (.C(aclk),
        .CE(1'b1),
        .D(req_rd_dom_2),
        .Q(req_rd_dom_3),
        .R(rst_rd_2));
  LUT1 #(
    .INIT(2'h1)) 
    req_wr_dom_1_i_1
       (.I0(ack_rd_dom_3),
        .O(rd_to_wr_req));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE req_wr_dom_1_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(rd_to_wr_req),
        .Q(req_wr_dom_1),
        .R(rst_wr_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE req_wr_dom_2_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(req_wr_dom_1),
        .Q(req_wr_dom_2),
        .R(rst_wr_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE req_wr_dom_3_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(req_wr_dom_2),
        .Q(req_wr_dom_3),
        .R(rst_wr_2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE rst_rd_1_reg
       (.C(aclk),
        .CE(1'b1),
        .D(SR),
        .Q(rst_rd_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE rst_rd_2_reg
       (.C(aclk),
        .CE(1'b1),
        .D(rst_rd_1),
        .Q(rst_rd_2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE rst_wr_1_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(SR),
        .Q(rst_wr_1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE rst_wr_2_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(rst_wr_1),
        .Q(rst_wr_2),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00008F0000008000)) 
    valid_i_1
       (.I0(valid_i_2_n_0),
        .I1(valid_i_3_n_0),
        .I2(valid_i_4_n_0),
        .I3(aresetn),
        .I4(rst),
        .I5(valid_reg_0),
        .O(valid_reg));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hAEAA)) 
    valid_i_2
       (.I0(first_sof_reg),
        .I1(DOBDO[0]),
        .I2(DOBDO[1]),
        .I3(p_0_in6_in),
        .O(valid_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h4545FF45)) 
    valid_i_3
       (.I0(empty),
        .I1(fifo_dout[16]),
        .I2(fifo_empty),
        .I3(valid_reg_0),
        .I4(m_axis_video_tready),
        .O(valid_i_3_n_0));
  LUT6 #(
    .INIT(64'hFEFFF0F0FEFEF0F0)) 
    valid_i_4
       (.I0(m_axis_video_tready),
        .I1(valid_reg_0),
        .I2(\rd_data[15]_i_4_n_0 ),
        .I3(empty),
        .I4(aclken),
        .I5(\rd_ptr_rep[9]_i_5_n_0 ),
        .O(valid_i_4_n_0));
  LUT3 #(
    .INIT(8'hBA)) 
    wr_error_i_1
       (.I0(rst_wr_2),
        .I1(idf_de),
        .I2(vid_io_in_ce),
        .O(wr_error_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_10
       (.I0(wr_ptr_reg[5]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[5] ),
        .O(wr_error_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_11
       (.I0(wr_ptr_reg[4]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[4] ),
        .O(wr_error_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_12
       (.I0(wr_ptr_reg[3]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[3] ),
        .O(wr_error_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_13
       (.I0(wr_ptr_reg[2]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[2] ),
        .O(wr_error_i_13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_14
       (.I0(wr_ptr_reg[1]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[1] ),
        .O(wr_error_i_14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_15
       (.I0(wr_ptr_reg[0]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[0] ),
        .O(wr_error_i_15_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_4
       (.I0(wr_ptr_reg__0[10]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[10] ),
        .O(wr_error_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_5
       (.I0(wr_ptr_reg[9]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[9] ),
        .O(wr_error_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_6
       (.I0(wr_ptr_reg[8]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[8] ),
        .O(wr_error_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_8
       (.I0(wr_ptr_reg[7]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[7] ),
        .O(wr_error_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_error_i_9
       (.I0(wr_ptr_reg[6]),
        .I1(\rd_ptr_wr_dom_reg_n_0_[6] ),
        .O(wr_error_i_9_n_0));
  FDRE wr_error_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(full_comb),
        .Q(wr_error),
        .R(wr_error_i_1_n_0));
  CARRY4 wr_error_reg_i_2
       (.CI(wr_error_reg_i_3_n_0),
        .CO({NLW_wr_error_reg_i_2_CO_UNCONNECTED[3:2],wr_error_reg_i_2_n_2,wr_error_reg_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,wr_ptr_reg[9:8]}),
        .O({NLW_wr_error_reg_i_2_O_UNCONNECTED[3],full_comb,wr_error_reg_i_2_n_6,wr_error_reg_i_2_n_7}),
        .S({1'b0,wr_error_i_4_n_0,wr_error_i_5_n_0,wr_error_i_6_n_0}));
  CARRY4 wr_error_reg_i_3
       (.CI(wr_error_reg_i_7_n_0),
        .CO({wr_error_reg_i_3_n_0,wr_error_reg_i_3_n_1,wr_error_reg_i_3_n_2,wr_error_reg_i_3_n_3}),
        .CYINIT(1'b0),
        .DI(wr_ptr_reg[7:4]),
        .O({wr_error_reg_i_3_n_4,wr_error_reg_i_3_n_5,wr_error_reg_i_3_n_6,wr_error_reg_i_3_n_7}),
        .S({wr_error_i_8_n_0,wr_error_i_9_n_0,wr_error_i_10_n_0,wr_error_i_11_n_0}));
  CARRY4 wr_error_reg_i_7
       (.CI(1'b0),
        .CO({wr_error_reg_i_7_n_0,wr_error_reg_i_7_n_1,wr_error_reg_i_7_n_2,wr_error_reg_i_7_n_3}),
        .CYINIT(1'b1),
        .DI(wr_ptr_reg[3:0]),
        .O({wr_error_reg_i_7_n_4,wr_error_reg_i_7_n_5,wr_error_reg_i_7_n_6,wr_error_reg_i_7_n_7}),
        .S({wr_error_i_12_n_0,wr_error_i_13_n_0,wr_error_i_14_n_0,wr_error_i_15_n_0}));
  LUT3 #(
    .INIT(8'h40)) 
    \wr_ptr[0]_i_1 
       (.I0(full_comb),
        .I1(vid_io_in_ce),
        .I2(idf_de),
        .O(\wr_ptr[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_ptr[0]_i_3 
       (.I0(wr_ptr_reg[0]),
        .O(\wr_ptr[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_ptr_rd_dom[11]_i_1 
       (.I0(req_rd_dom_2),
        .I1(req_rd_dom_3),
        .O(ce_wr_ptr_rd_dom));
  FDRE \wr_ptr_rd_dom_reg[0] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[0]),
        .Q(wr_ptr_rd_dom[0]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[10] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[10]),
        .Q(wr_ptr_rd_dom[10]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[11] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[11]),
        .Q(wr_ptr_rd_dom[11]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[1] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[1]),
        .Q(wr_ptr_rd_dom[1]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[2] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[2]),
        .Q(wr_ptr_rd_dom[2]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[3] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[3]),
        .Q(wr_ptr_rd_dom[3]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[4] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[4]),
        .Q(wr_ptr_rd_dom[4]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[5] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[5]),
        .Q(wr_ptr_rd_dom[5]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[6] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[6]),
        .Q(wr_ptr_rd_dom[6]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[7] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[7]),
        .Q(wr_ptr_rd_dom[7]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[8] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[8]),
        .Q(wr_ptr_rd_dom[8]),
        .R(rst_rd_2));
  FDRE \wr_ptr_rd_dom_reg[9] 
       (.C(aclk),
        .CE(ce_wr_ptr_rd_dom),
        .D(wr_ptr_sample[9]),
        .Q(wr_ptr_rd_dom[9]),
        .R(rst_rd_2));
  FDSE #(
    .INIT(1'b1)) 
    \wr_ptr_reg[0] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[0]_i_2_n_0 ),
        .Q(wr_ptr_reg[0]),
        .S(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[10] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[10]_i_1_n_0 ),
        .Q(wr_ptr_reg__0[10]),
        .R(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[11] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[11]_i_1_n_0 ),
        .Q(wr_ptr_reg__0[11]),
        .R(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[1] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[1]_i_1_n_0 ),
        .Q(wr_ptr_reg[1]),
        .R(rst_wr_2));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY4 \wr_ptr_reg[1]_i_2_CARRY4 
       (.CI(1'b0),
        .CO({\wr_ptr_reg[4]_i_2_n_0 ,\wr_ptr_reg[3]_i_2_n_0 ,\wr_ptr_reg[2]_i_2_n_0 ,\wr_ptr_reg[1]_i_2_n_0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\wr_ptr_reg[3]_i_1_n_0 ,\wr_ptr_reg[2]_i_1_n_0 ,\wr_ptr_reg[1]_i_1_n_0 ,\wr_ptr_reg[0]_i_2_n_0 }),
        .S({wr_ptr_reg[3:1],\wr_ptr[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[2] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[2]_i_1_n_0 ),
        .Q(wr_ptr_reg[2]),
        .R(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[3] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[3]_i_1_n_0 ),
        .Q(wr_ptr_reg[3]),
        .R(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[4] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[4]_i_1_n_0 ),
        .Q(wr_ptr_reg[4]),
        .R(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[5] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[5]_i_1_n_0 ),
        .Q(wr_ptr_reg[5]),
        .R(rst_wr_2));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY4 \wr_ptr_reg[5]_i_2_CARRY4 
       (.CI(\wr_ptr_reg[4]_i_2_n_0 ),
        .CO({\wr_ptr_reg[8]_i_2_n_0 ,\wr_ptr_reg[7]_i_2_n_0 ,\wr_ptr_reg[6]_i_2_n_0 ,\wr_ptr_reg[5]_i_2_n_0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wr_ptr_reg[7]_i_1_n_0 ,\wr_ptr_reg[6]_i_1_n_0 ,\wr_ptr_reg[5]_i_1_n_0 ,\wr_ptr_reg[4]_i_1_n_0 }),
        .S(wr_ptr_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[6] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[6]_i_1_n_0 ),
        .Q(wr_ptr_reg[6]),
        .R(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[7] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[7]_i_1_n_0 ),
        .Q(wr_ptr_reg[7]),
        .R(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[8] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[8]_i_1_n_0 ),
        .Q(wr_ptr_reg[8]),
        .R(rst_wr_2));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[9] 
       (.C(vid_io_in_clk),
        .CE(\wr_ptr[0]_i_1_n_0 ),
        .D(\wr_ptr_reg[9]_i_1_n_0 ),
        .Q(wr_ptr_reg[9]),
        .R(rst_wr_2));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* XILINX_TRANSFORM_PINMAP = "LO:O" *) 
  CARRY4 \wr_ptr_reg[9]_i_2_CARRY4 
       (.CI(\wr_ptr_reg[8]_i_2_n_0 ),
        .CO({\NLW_wr_ptr_reg[9]_i_2_CARRY4_CO_UNCONNECTED [3:2],\wr_ptr_reg[10]_i_2_n_0 ,\wr_ptr_reg[9]_i_2_n_0 }),
        .CYINIT(1'b0),
        .DI({\NLW_wr_ptr_reg[9]_i_2_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O({\wr_ptr_reg[11]_i_1_n_0 ,\wr_ptr_reg[10]_i_1_n_0 ,\wr_ptr_reg[9]_i_1_n_0 ,\wr_ptr_reg[8]_i_1_n_0 }),
        .S({wr_ptr_reg__0,wr_ptr_reg[9:8]}));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_ptr_sample[11]_i_1 
       (.I0(ack_wr_dom_2),
        .I1(ack_wr_dom_3),
        .O(ce_wr_ptr_sample));
  FDRE \wr_ptr_sample_reg[0] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[0]),
        .Q(wr_ptr_sample[0]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[10] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg__0[10]),
        .Q(wr_ptr_sample[10]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[11] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg__0[11]),
        .Q(wr_ptr_sample[11]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[1] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[1]),
        .Q(wr_ptr_sample[1]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[2] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[2]),
        .Q(wr_ptr_sample[2]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[3] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[3]),
        .Q(wr_ptr_sample[3]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[4] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[4]),
        .Q(wr_ptr_sample[4]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[5] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[5]),
        .Q(wr_ptr_sample[5]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[6] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[6]),
        .Q(wr_ptr_sample[6]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[7] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[7]),
        .Q(wr_ptr_sample[7]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[8] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[8]),
        .Q(wr_ptr_sample[8]),
        .R(rst_wr_2));
  FDRE \wr_ptr_sample_reg[9] 
       (.C(vid_io_in_clk),
        .CE(ce_wr_ptr_sample),
        .D(wr_ptr_reg[9]),
        .Q(wr_ptr_sample[9]),
        .R(rst_wr_2));
endmodule

(* ORIG_REF_NAME = "v_vid_in_axi4s_v3_0_in_coupler" *) 
module v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_coupler
   (locked_1,
    fifo_full_1,
    wr_error,
    empty,
    m_axis_video_tvalid,
    Q,
    idf_de,
    vid_io_in_clk,
    aclk,
    DIADI,
    vid_io_in_ce,
    aclken,
    axis_enable,
    locked_1_reg_0,
    fifo_full_1_reg_0,
    aresetn,
    rst,
    m_axis_video_tready);
  output locked_1;
  output fifo_full_1;
  output wr_error;
  output empty;
  output m_axis_video_tvalid;
  output [18:0]Q;
  input idf_de;
  input vid_io_in_clk;
  input aclk;
  input [18:0]DIADI;
  input vid_io_in_ce;
  input aclken;
  input axis_enable;
  input locked_1_reg_0;
  input fifo_full_1_reg_0;
  input aresetn;
  input rst;
  input m_axis_video_tready;

  wire [18:0]DIADI;
  wire [18:0]Q;
  wire aclk;
  wire aclken;
  wire aresetn;
  wire axis_enable;
  wire empty;
  wire [18:17]fifo_dout;
  wire fifo_full_1;
  wire fifo_full_1_reg_0;
  wire fifo_full_2;
  wire first_sof_reg;
  wire first_sof_reg_i_1_n_0;
  wire full;
  wire idf_de;
  wire in_bridge_async_fifo_2_i_n_10;
  wire in_bridge_async_fifo_2_i_n_11;
  wire in_bridge_async_fifo_2_i_n_12;
  wire in_bridge_async_fifo_2_i_n_13;
  wire in_bridge_async_fifo_2_i_n_14;
  wire in_bridge_async_fifo_2_i_n_15;
  wire in_bridge_async_fifo_2_i_n_16;
  wire in_bridge_async_fifo_2_i_n_17;
  wire in_bridge_async_fifo_2_i_n_18;
  wire in_bridge_async_fifo_2_i_n_19;
  wire in_bridge_async_fifo_2_i_n_20;
  wire in_bridge_async_fifo_2_i_n_21;
  wire in_bridge_async_fifo_2_i_n_22;
  wire in_bridge_async_fifo_2_i_n_23;
  wire in_bridge_async_fifo_2_i_n_24;
  wire in_bridge_async_fifo_2_i_n_25;
  wire in_bridge_async_fifo_2_i_n_26;
  wire in_bridge_async_fifo_2_i_n_6;
  wire in_bridge_async_fifo_2_i_n_7;
  wire in_bridge_async_fifo_2_i_n_8;
  wire in_bridge_async_fifo_2_i_n_9;
  wire locked_1;
  wire locked_1_reg_0;
  wire locked_2;
  wire m_axis_video_tready;
  wire m_axis_video_tvalid;
  wire reset;
  wire rst;
  wire vid_io_in_ce;
  wire vid_io_in_clk;
  wire wr_error;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE fifo_full_1_reg
       (.C(aclk),
        .CE(aclken),
        .D(full),
        .Q(fifo_full_1),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE fifo_full_2_reg
       (.C(aclk),
        .CE(aclken),
        .D(fifo_full_1_reg_0),
        .Q(fifo_full_2),
        .R(reset));
  LUT6 #(
    .INIT(64'h0000F20000000000)) 
    first_sof_reg_i_1
       (.I0(fifo_dout[17]),
        .I1(fifo_dout[18]),
        .I2(first_sof_reg),
        .I3(locked_2),
        .I4(rst),
        .I5(aresetn),
        .O(first_sof_reg_i_1_n_0));
  FDRE first_sof_reg_reg
       (.C(aclk),
        .CE(1'b1),
        .D(first_sof_reg_i_1_n_0),
        .Q(first_sof_reg),
        .R(1'b0));
  v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_bridge_async_fifo_2 in_bridge_async_fifo_2_i
       (.D({in_bridge_async_fifo_2_i_n_7,in_bridge_async_fifo_2_i_n_8,in_bridge_async_fifo_2_i_n_9,in_bridge_async_fifo_2_i_n_10,in_bridge_async_fifo_2_i_n_11,in_bridge_async_fifo_2_i_n_12,in_bridge_async_fifo_2_i_n_13,in_bridge_async_fifo_2_i_n_14,in_bridge_async_fifo_2_i_n_15,in_bridge_async_fifo_2_i_n_16,in_bridge_async_fifo_2_i_n_17,in_bridge_async_fifo_2_i_n_18,in_bridge_async_fifo_2_i_n_19,in_bridge_async_fifo_2_i_n_20,in_bridge_async_fifo_2_i_n_21,in_bridge_async_fifo_2_i_n_22,in_bridge_async_fifo_2_i_n_23,in_bridge_async_fifo_2_i_n_24,in_bridge_async_fifo_2_i_n_25}),
        .DIADI(DIADI),
        .DOBDO(fifo_dout),
        .E(in_bridge_async_fifo_2_i_n_26),
        .SR(reset),
        .aclk(aclk),
        .aclken(aclken),
        .aresetn(aresetn),
        .empty(empty),
        .first_sof_reg(first_sof_reg),
        .full(full),
        .idf_de(idf_de),
        .m_axis_video_tready(m_axis_video_tready),
        .p_0_in6_in(locked_2),
        .p_0_in_0(fifo_full_2),
        .rst(rst),
        .valid_reg(in_bridge_async_fifo_2_i_n_6),
        .valid_reg_0(m_axis_video_tvalid),
        .vid_io_in_ce(vid_io_in_ce),
        .vid_io_in_clk(vid_io_in_clk),
        .wr_error(wr_error));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    locked_1_reg
       (.C(aclk),
        .CE(aclken),
        .D(axis_enable),
        .Q(locked_1),
        .R(reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    locked_2_reg
       (.C(aclk),
        .CE(aclken),
        .D(locked_1_reg_0),
        .Q(locked_2),
        .R(reset));
  FDRE \rd_data_reg[0] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_25),
        .Q(Q[0]),
        .R(reset));
  FDRE \rd_data_reg[10] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_15),
        .Q(Q[10]),
        .R(reset));
  FDRE \rd_data_reg[11] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_14),
        .Q(Q[11]),
        .R(reset));
  FDRE \rd_data_reg[12] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_13),
        .Q(Q[12]),
        .R(reset));
  FDRE \rd_data_reg[13] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_12),
        .Q(Q[13]),
        .R(reset));
  FDRE \rd_data_reg[14] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_11),
        .Q(Q[14]),
        .R(reset));
  FDRE \rd_data_reg[15] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_10),
        .Q(Q[15]),
        .R(reset));
  FDRE \rd_data_reg[16] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_9),
        .Q(Q[16]),
        .R(reset));
  FDRE \rd_data_reg[17] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_8),
        .Q(Q[17]),
        .R(reset));
  FDRE \rd_data_reg[18] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_7),
        .Q(Q[18]),
        .R(reset));
  FDRE \rd_data_reg[1] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_24),
        .Q(Q[1]),
        .R(reset));
  FDRE \rd_data_reg[2] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_23),
        .Q(Q[2]),
        .R(reset));
  FDRE \rd_data_reg[3] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_22),
        .Q(Q[3]),
        .R(reset));
  FDRE \rd_data_reg[4] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_21),
        .Q(Q[4]),
        .R(reset));
  FDRE \rd_data_reg[5] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_20),
        .Q(Q[5]),
        .R(reset));
  FDRE \rd_data_reg[6] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_19),
        .Q(Q[6]),
        .R(reset));
  FDRE \rd_data_reg[7] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_18),
        .Q(Q[7]),
        .R(reset));
  FDRE \rd_data_reg[8] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_17),
        .Q(Q[8]),
        .R(reset));
  FDRE \rd_data_reg[9] 
       (.C(aclk),
        .CE(in_bridge_async_fifo_2_i_n_26),
        .D(in_bridge_async_fifo_2_i_n_16),
        .Q(Q[9]),
        .R(reset));
  FDRE valid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(in_bridge_async_fifo_2_i_n_6),
        .Q(m_axis_video_tvalid),
        .R(1'b0));
endmodule

(* C_M_AXIS_VIDEO_DATA_WIDTH = "8" *) (* C_M_AXIS_VIDEO_FORMAT = "0" *) (* C_M_AXIS_VIDEO_TDATA_WIDTH = "16" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* HYSTERESIS_LEVEL = "12" *) (* ORIG_REF_NAME = "v_vid_in_axi4s_v3_0_vid_in_axi4s_top" *) 
(* RAM_ADDR_BITS = "10" *) (* VID_IN_DATA_WIDTH = "16" *) 
module v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_axi4s_top
   (vid_io_in_clk,
    rst,
    vid_io_in_ce,
    vid_active_video,
    vid_vblank,
    vid_hblank,
    vid_vsync,
    vid_hsync,
    vid_field_id,
    vid_data,
    aclk,
    aclken,
    aresetn,
    m_axis_video_tdata,
    m_axis_video_tvalid,
    m_axis_video_tready,
    m_axis_video_tuser,
    m_axis_video_tlast,
    fid,
    vtd_active_video,
    vtd_vblank,
    vtd_hblank,
    vtd_vsync,
    vtd_hsync,
    vtd_field_id,
    wr_error,
    empty,
    axis_enable);
  input vid_io_in_clk;
  input rst;
  input vid_io_in_ce;
  input vid_active_video;
  input vid_vblank;
  input vid_hblank;
  input vid_vsync;
  input vid_hsync;
  input vid_field_id;
  input [15:0]vid_data;
  input aclk;
  input aclken;
  input aresetn;
  output [15:0]m_axis_video_tdata;
  output m_axis_video_tvalid;
  input m_axis_video_tready;
  output m_axis_video_tuser;
  output m_axis_video_tlast;
  output fid;
  output vtd_active_video;
  output vtd_vblank;
  output vtd_hblank;
  output vtd_vsync;
  output vtd_hsync;
  output vtd_field_id;
  output wr_error;
  output empty;
  input axis_enable;

  wire aclk;
  wire aclken;
  wire aresetn;
  wire axis_enable;
  wire empty;
  wire fid;
  wire fifo_full_1;
  wire [18:0]idf_data;
  wire idf_de;
  wire locked_1;
  wire [15:0]m_axis_video_tdata;
  wire m_axis_video_tlast;
  wire m_axis_video_tready;
  wire m_axis_video_tuser;
  wire m_axis_video_tvalid;
  wire rst;
  wire vid_active_video;
  wire [15:0]vid_data;
  wire vid_field_id;
  wire vid_hblank;
  wire vid_hsync;
  wire vid_io_in_ce;
  wire vid_io_in_clk;
  wire vid_vblank;
  wire vid_vsync;
  wire vtd_active_video;
  wire vtd_field_id;
  wire vtd_hblank;
  wire vtd_hsync;
  wire vtd_vblank;
  wire vtd_vsync;
  wire wr_error;

  v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_in_coupler in_coupler_i
       (.DIADI(idf_data),
        .Q({fid,m_axis_video_tuser,m_axis_video_tlast,m_axis_video_tdata}),
        .aclk(aclk),
        .aclken(aclken),
        .aresetn(aresetn),
        .axis_enable(axis_enable),
        .empty(empty),
        .fifo_full_1(fifo_full_1),
        .fifo_full_1_reg_0(fifo_full_1),
        .idf_de(idf_de),
        .locked_1(locked_1),
        .locked_1_reg_0(locked_1),
        .m_axis_video_tready(m_axis_video_tready),
        .m_axis_video_tvalid(m_axis_video_tvalid),
        .rst(rst),
        .vid_io_in_ce(vid_io_in_ce),
        .vid_io_in_clk(vid_io_in_clk),
        .wr_error(wr_error));
  v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_formatter vid_in_formatter
       (.DIADI(idf_data),
        .idf_de(idf_de),
        .vid_active_video(vid_active_video),
        .vid_data(vid_data),
        .vid_field_id(vid_field_id),
        .vid_hblank(vid_hblank),
        .vid_hsync(vid_hsync),
        .vid_io_in_ce(vid_io_in_ce),
        .vid_io_in_clk(vid_io_in_clk),
        .vid_vblank(vid_vblank),
        .vid_vsync(vid_vsync),
        .vtd_active_video(vtd_active_video),
        .vtd_field_id(vtd_field_id),
        .vtd_hblank(vtd_hblank),
        .vtd_hsync(vtd_hsync),
        .vtd_vblank(vtd_vblank),
        .vtd_vsync(vtd_vsync));
endmodule

(* ORIG_REF_NAME = "v_vid_in_axi4s_v3_0_vid_in_formatter" *) 
module v_vid_in_axi4s_0_v_vid_in_axi4s_v3_0_vid_in_formatter
   (vtd_active_video,
    vtd_vblank,
    vtd_hblank,
    vtd_vsync,
    vtd_hsync,
    vtd_field_id,
    DIADI,
    idf_de,
    vid_io_in_ce,
    vid_active_video,
    vid_io_in_clk,
    vid_vblank,
    vid_hblank,
    vid_vsync,
    vid_hsync,
    vid_field_id,
    vid_data);
  output vtd_active_video;
  output vtd_vblank;
  output vtd_hblank;
  output vtd_vsync;
  output vtd_hsync;
  output vtd_field_id;
  output [18:0]DIADI;
  output idf_de;
  input vid_io_in_ce;
  input vid_active_video;
  input vid_io_in_clk;
  input vid_vblank;
  input vid_hblank;
  input vid_vsync;
  input vid_hsync;
  input vid_field_id;
  input [15:0]vid_data;

  wire [18:0]DIADI;
  wire [15:0]data_1;
  wire [15:0]data_2;
  wire de_2;
  wire eol_i_1_n_0;
  wire field_id_2;
  wire idf_de;
  wire sof;
  wire sof0;
  wire v_blank_sync_1;
  wire v_blank_sync_2;
  wire vert_blanking_intvl_i_1_n_0;
  wire vert_blanking_intvl_reg_n_0;
  wire vid_active_video;
  wire [15:0]vid_data;
  wire vid_field_id;
  wire vid_hblank;
  wire vid_hsync;
  wire vid_io_in_ce;
  wire vid_io_in_clk;
  wire vid_vblank;
  wire vid_vsync;
  wire vtd_active_video;
  wire vtd_field_id;
  wire vtd_hblank;
  wire vtd_hsync;
  wire vtd_vblank;
  wire vtd_vsync;

  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[0] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[0]),
        .Q(data_1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[10] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[10]),
        .Q(data_1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[11] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[11]),
        .Q(data_1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[12] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[12]),
        .Q(data_1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[13] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[13]),
        .Q(data_1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[14] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[14]),
        .Q(data_1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[15] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[15]),
        .Q(data_1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[1] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[1]),
        .Q(data_1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[2] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[2]),
        .Q(data_1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[3] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[3]),
        .Q(data_1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[4] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[4]),
        .Q(data_1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[5] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[5]),
        .Q(data_1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[6] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[6]),
        .Q(data_1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[7] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[7]),
        .Q(data_1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[8] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[8]),
        .Q(data_1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_1_reg[9] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_data[9]),
        .Q(data_1[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[0] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[0]),
        .Q(data_2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[10] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[10]),
        .Q(data_2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[11] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[11]),
        .Q(data_2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[12] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[12]),
        .Q(data_2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[13] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[13]),
        .Q(data_2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[14] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[14]),
        .Q(data_2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[15] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[15]),
        .Q(data_2[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[1] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[1]),
        .Q(data_2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[2] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[2]),
        .Q(data_2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[3] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[3]),
        .Q(data_2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[4] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[4]),
        .Q(data_2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[5] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[5]),
        .Q(data_2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[6] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[6]),
        .Q(data_2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[7] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[7]),
        .Q(data_2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[8] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[8]),
        .Q(data_2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_2_reg[9] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_1[9]),
        .Q(data_2[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[0] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[0]),
        .Q(DIADI[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[10] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[10]),
        .Q(DIADI[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[11] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[11]),
        .Q(DIADI[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[12] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[12]),
        .Q(DIADI[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[13] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[13]),
        .Q(DIADI[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[14] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[14]),
        .Q(DIADI[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[15] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[15]),
        .Q(DIADI[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[1] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[1]),
        .Q(DIADI[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[2] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[2]),
        .Q(DIADI[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[3] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[3]),
        .Q(DIADI[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[4] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[4]),
        .Q(DIADI[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[5] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[5]),
        .Q(DIADI[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[6] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[6]),
        .Q(DIADI[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[7] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[7]),
        .Q(DIADI[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[8] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[8]),
        .Q(DIADI[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_3_reg[9] 
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(data_2[9]),
        .Q(DIADI[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    de_1_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_active_video),
        .Q(vtd_active_video),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    de_2_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vtd_active_video),
        .Q(de_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    de_3_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(de_2),
        .Q(idf_de),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    eol_i_1
       (.I0(de_2),
        .I1(vtd_active_video),
        .O(eol_i_1_n_0));
  FDRE eol_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(eol_i_1_n_0),
        .Q(DIADI[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    field_id_1_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_field_id),
        .Q(vtd_field_id),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    field_id_2_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vtd_field_id),
        .Q(field_id_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    field_id_3_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(field_id_2),
        .Q(DIADI[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    hblank_1_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_hblank),
        .Q(vtd_hblank),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    hsync_1_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_hsync),
        .Q(vtd_hsync),
        .R(1'b0));
  FDRE sof_1_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(sof),
        .Q(DIADI[17]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h40)) 
    sof_i_1
       (.I0(de_2),
        .I1(vtd_active_video),
        .I2(vert_blanking_intvl_reg_n_0),
        .O(sof0));
  FDRE sof_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(sof0),
        .Q(sof),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    v_blank_sync_2_i_1
       (.I0(vtd_vblank),
        .I1(vtd_vsync),
        .O(v_blank_sync_1));
  FDRE #(
    .INIT(1'b0)) 
    v_blank_sync_2_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(v_blank_sync_1),
        .Q(v_blank_sync_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    vblank_1_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_vblank),
        .Q(vtd_vblank),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hB0B0F0F0FFB0F0F0)) 
    vert_blanking_intvl_i_1
       (.I0(de_2),
        .I1(vtd_active_video),
        .I2(vert_blanking_intvl_reg_n_0),
        .I3(v_blank_sync_1),
        .I4(vid_io_in_ce),
        .I5(v_blank_sync_2),
        .O(vert_blanking_intvl_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    vert_blanking_intvl_reg
       (.C(vid_io_in_clk),
        .CE(1'b1),
        .D(vert_blanking_intvl_i_1_n_0),
        .Q(vert_blanking_intvl_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    vsync_1_reg
       (.C(vid_io_in_clk),
        .CE(vid_io_in_ce),
        .D(vid_vsync),
        .Q(vtd_vsync),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
