//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Oct 08 20:35:50 2015
//Host        : Lukas-laptop running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target hdmi_out_wrapper.bd
//Design      : hdmi_out_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module hdmi_out_wrapper
   (ACLK,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    clk,
    clk_in,
    det_clken,
    empty,
    gen_clk_en,
    hdmio_io_clk,
    hdmio_io_data,
    hdmio_io_de,
    hdmio_io_hsync,
    hdmio_io_spdif,
    hdmio_io_vsync,
    locked,
    video_in_tdata,
    video_in_tlast,
    video_in_tready,
    video_in_tuser,
    video_in_tvalid,
    vtiming_in_active_video,
    vtiming_in_hblank,
    vtiming_in_hsync,
    vtiming_in_vblank,
    vtiming_in_vsync,
    wr_error,
    zed_hdmi_iic_scl_io,
    zed_hdmi_iic_sda_io);
  output ACLK;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output clk;
  input clk_in;
  input det_clken;
  output empty;
  output gen_clk_en;
  output hdmio_io_clk;
  output [15:0]hdmio_io_data;
  output hdmio_io_de;
  output hdmio_io_hsync;
  output hdmio_io_spdif;
  output hdmio_io_vsync;
  output locked;
  input [15:0]video_in_tdata;
  input video_in_tlast;
  output video_in_tready;
  input video_in_tuser;
  input video_in_tvalid;
  input vtiming_in_active_video;
  input vtiming_in_hblank;
  input vtiming_in_hsync;
  input vtiming_in_vblank;
  input vtiming_in_vsync;
  output wr_error;
  inout zed_hdmi_iic_scl_io;
  inout zed_hdmi_iic_sda_io;

  wire ACLK;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire clk;
  wire clk_in;
  wire det_clken;
  wire empty;
  wire gen_clk_en;
  wire hdmio_io_clk;
  wire [15:0]hdmio_io_data;
  wire hdmio_io_de;
  wire hdmio_io_hsync;
  wire hdmio_io_spdif;
  wire hdmio_io_vsync;
  wire locked;
  wire [15:0]video_in_tdata;
  wire video_in_tlast;
  wire video_in_tready;
  wire video_in_tuser;
  wire video_in_tvalid;
  wire vtiming_in_active_video;
  wire vtiming_in_hblank;
  wire vtiming_in_hsync;
  wire vtiming_in_vblank;
  wire vtiming_in_vsync;
  wire wr_error;
  wire zed_hdmi_iic_scl_i;
  wire zed_hdmi_iic_scl_io;
  wire zed_hdmi_iic_scl_o;
  wire zed_hdmi_iic_scl_t;
  wire zed_hdmi_iic_sda_i;
  wire zed_hdmi_iic_sda_io;
  wire zed_hdmi_iic_sda_o;
  wire zed_hdmi_iic_sda_t;

  hdmi_out hdmi_out_i
       (.ACLK(ACLK),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .clk(clk),
        .clk_in(clk_in),
        .det_clken(det_clken),
        .empty(empty),
        .gen_clk_en(gen_clk_en),
        .hdmio_io_clk(hdmio_io_clk),
        .hdmio_io_data(hdmio_io_data),
        .hdmio_io_de(hdmio_io_de),
        .hdmio_io_hsync(hdmio_io_hsync),
        .hdmio_io_spdif(hdmio_io_spdif),
        .hdmio_io_vsync(hdmio_io_vsync),
        .locked(locked),
        .video_in_tdata(video_in_tdata),
        .video_in_tlast(video_in_tlast),
        .video_in_tready(video_in_tready),
        .video_in_tuser(video_in_tuser),
        .video_in_tvalid(video_in_tvalid),
        .vtiming_in_active_video(vtiming_in_active_video),
        .vtiming_in_hblank(vtiming_in_hblank),
        .vtiming_in_hsync(vtiming_in_hsync),
        .vtiming_in_vblank(vtiming_in_vblank),
        .vtiming_in_vsync(vtiming_in_vsync),
        .wr_error(wr_error),
        .zed_hdmi_iic_scl_i(zed_hdmi_iic_scl_i),
        .zed_hdmi_iic_scl_o(zed_hdmi_iic_scl_o),
        .zed_hdmi_iic_scl_t(zed_hdmi_iic_scl_t),
        .zed_hdmi_iic_sda_i(zed_hdmi_iic_sda_i),
        .zed_hdmi_iic_sda_o(zed_hdmi_iic_sda_o),
        .zed_hdmi_iic_sda_t(zed_hdmi_iic_sda_t));
  IOBUF zed_hdmi_iic_scl_iobuf
       (.I(zed_hdmi_iic_scl_o),
        .IO(zed_hdmi_iic_scl_io),
        .O(zed_hdmi_iic_scl_i),
        .T(zed_hdmi_iic_scl_t));
  IOBUF zed_hdmi_iic_sda_iobuf
       (.I(zed_hdmi_iic_sda_o),
        .IO(zed_hdmi_iic_sda_io),
        .O(zed_hdmi_iic_sda_i),
        .T(zed_hdmi_iic_sda_t));
endmodule
