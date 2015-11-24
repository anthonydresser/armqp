`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andrew Weiler, Anthony Dresser, Lukas Hunker
// 
// Create Date: 09/19/2015 04:08:09 PM
// Design Name: 
// Module Name: top_level
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_level(
	input [7:0] vdin,
	input clk,
	input pclk,
	input vsync,
	input href,
	input reset,
	inout siod,
	output sioc,
	output xclk,
	output reset_out,
	output pwdn,
	
	//From HDMI Stuff
   inout [14:0]DDR_addr,
   inout [2:0]DDR_ba,
   inout DDR_cas_n,
   inout DDR_ck_n,
   inout DDR_ck_p,
   inout DDR_cke,
   inout DDR_cs_n,
   inout [3:0]DDR_dm,
   inout [31:0]DDR_dq,
   inout [3:0]DDR_dqs_n,
   inout [3:0]DDR_dqs_p,
   inout DDR_odt,
   inout DDR_ras_n,
   inout DDR_reset_n,
   inout DDR_we_n,
   inout FIXED_IO_ddr_vrn,
   inout FIXED_IO_ddr_vrp,
   inout [53:0]FIXED_IO_mio,
   inout FIXED_IO_ps_clk,
   inout FIXED_IO_ps_porb,
   inout FIXED_IO_ps_srstb,

   output hdmio_io_clk,
   output [15:0]hdmio_io_data,
   output hdmio_io_de,
   output hdmio_io_hsync,
   output hdmio_io_spdif,
   output hdmio_io_vsync,
   inout zed_hdmi_iic_scl_io,
   inout zed_hdmi_iic_sda_io,
   output [7:0]LED,
   output [7:0]PMOD_Debug
 );
	
	wire vid_io_in_ce, clk_12M;
	wire [15:0] pixel;
	wire fifo_write;
	wire vtd_active_video, vtd_hblank, vtd_hsync, vtd_vblank, vtd_vsync;
	
	wire aclk;
	wire empty_fifo;
	wire hdmi_clk;
	wire [15:0] m_axis_video_tdata;
   wire m_axis_video_tvalid;
   wire m_axis_video_tready;
   wire m_axis_video_tuser;
   wire m_axis_video_tlast;
   
   wire zed_hdmi_iic_scl_i;
   wire zed_hdmi_iic_scl_o;
   wire zed_hdmi_iic_scl_t;
   wire zed_hdmi_iic_sda_i;
   wire zed_hdmi_iic_sda_o;
   wire zed_hdmi_iic_sda_t;
   wire clk_24;
   
	wire vcc = 1'b1;
	wire gnd = 0'b0;
	reg read_data = 1'b0;
	wire clk_100M;
	wire clk_50M;
	wire button_db;
	
	wire [7:0] PMOD_Debug_BD;
   wire href_n_edge;
	
  clk_wiz_0 clk_gen(
      .clk_in(clk),
      .clk_24M(clk_24),
      .clk_100M(clk_100M),
      .clk_50M(clk_50M),
      .reset(button_db)
   );      

   ov7670_controller cont(
      .clk(clk_50M),
      .resend(button_db),
      .sioc(sioc),
      .siod(siod),
      .reset(reset_out),
      .xclk(xclk),
      .pwdn(pwdn)
   );
    
   debounce db1(
      clk_50M,
      reset,
      button_db
   );
    
   YUV_capture capture (
      .din(vdin),
      .vsync(vsync),
      .href(href),
      .pclk(pclk),
      .pixel(pixel),
      .we (fifo_write)    //Output
   );
    
   assign PMOD_Debug = {pixel[5], ~href, vsync, pclk, PMOD_Debug_BD[3:0]};
   edgeDetect edgeDetectorInstance(~href, reset, pclk&&fifo_write, href_n_edge);
    
   //Block Design
   design_1_wrapper wrapper(
      //PS Stuff
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

      //HDMI Output
      .hdmio_io_clk(hdmio_io_clk),
      .hdmio_io_data(hdmio_io_data),
      .hdmio_io_de(hdmio_io_de),
      .hdmio_io_hsync(hdmio_io_hsync),
      .hdmio_io_spdif(hdmio_io_spdif),
      .hdmio_io_vsync(hdmio_io_vsync),
      .zed_hdmi_iic_scl_io(zed_hdmi_iic_scl_io),
      .zed_hdmi_iic_sda_io(zed_hdmi_iic_sda_io),

      //Video Input
      .vid_io_in_active_video(~href),
      .vid_io_in_clk(fifo_write),
      .vid_io_in_data(pixel),
      .vid_io_in_field(1'b0),
      .vid_io_in_hblank(~href),
      .vid_io_in_hsync(href_n_edge),
      .vid_io_in_vblank(vsync),
      .vid_io_in_vsync(vsync),

      //Debugging
      .LEDS(LED),
      .PMOD_Debug(PMOD_Debug_BD)
   );
endmodule
