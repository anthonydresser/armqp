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
	//Basic I/O
    input clk,
    input reset,
    input [7:0] sw,
    output [7:0]LED,
   
    //Left Camera I/O
    input [7:0] vdin_Left,
    input pclk_Left,
    input vsync_Left,
    input href_Left,
    inout siod_Left,
    output sioc_Left,
    output xclk_Left,
    output reset_out_Left,
    output pwdn_Left,
    
    //Debugging Port
    //output [15:0] pmod_out,
	
   //Right Camera I/O
    input [7:0] vdin_Right,
	input pclk_Right,
	input vsync_Right,
	input href_Right,
	inout siod_Right,
	output sioc_Right,
	output xclk_Right,
	output reset_out_Right,
	output pwdn_Right,
	
	//PS Stuff
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

    //HDMI Stuff
    output hdmio_io_clk,
    output [15:0]hdmio_io_data,
    output hdmio_io_de,
    output hdmio_io_hsync,
    output hdmio_io_spdif,
    output hdmio_io_vsync,
    inout zed_hdmi_iic_scl_io,
    inout zed_hdmi_iic_sda_io
 );
	
   //Video Module Interconnects
	wire [15:0] pixel_Left;
    wire [15:0] pixel_Right;
	wire chrominance_ready_Left, chrominance_ready_Right;
	wire href_n_edge_Left, href_n_edge_Right;
   
   //Other Interconnects
	wire clk_50M;
	wire button_db;
	wire pclk_Left_Half;
	wire pclk_Right_Half;
	wire [7:0] PMOD_Debug_BD;
	
	//assign pmod_out = pixel_Left;
	
   
   clk_wiz_1 clk_Left
    (pclk_Left, pclk_Left_Half);
    
   clk_wiz_1 clk_Right
    (pclk_Right, pclk_Right_Half);
        

   debounce db1(
      clk_50M,
      reset,
      button_db
   );   

   ov7670_controller cont_Left(
      .clk(clk_50M),
      .resend(button_db),
      .sioc(sioc_Left),
      .siod(siod_Left),
      .reset(reset_out_Left),
      .xclk(xclk_Left),
      .pwdn(pwdn_Left)
   );
   
   ov7670_controller cont_Right(
      .clk(clk_50M),
      .resend(button_db),
      .sioc(sioc_Right),
      .siod(siod_Right),
      .reset(reset_out_Right),
      .xclk(xclk_Right),
      .pwdn(pwdn_Right)
   );
    
   YUV_capture capture_Left (
      .din(vdin_Left),
      .vsync(vsync_Left),
      .href(href_Left),
      .pclk(pclk_Left),
      .sw(sw),
      .pixel(pixel_Left),
      .we (chrominance_ready_Left)
   );
   
   YUV_capture capture_Right (
      .din(vdin_Right),
      .vsync(vsync_Right),
      .href(href_Right),
      .pclk(pclk_Right),
      .sw(sw),
      .pixel(pixel_Right),
      .we (chrominance_ready_Right)
   );
    
   //assign PMOD_Debug = pixel_Left; //{pixel[5], ~href, vsync, pclk, PMOD_Debug_BD[3:0]};
   edgeDetect edgeDetectorLeft(~href_Left, reset, pclk_Left_Half&&chrominance_ready_Left, href_n_edge_Left);
   edgeDetect edgeDetectorRight(~href_Right, reset, pclk_Right_Half&&chrominance_ready_Right, href_n_edge_Right);
   
   //Block Design
   design_1_wrapper wrapper(
      //Design Clock
      .clk_PS_50M(clk_50M),
      
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

      //Video Input Left
      .vid_io_in_left_active_video(href_Left),
      .vid_io_in_clk_left(pclk_Left_Half),
      .vid_io_in_left_data({8'd127,  pixel_Left[15:8]}),
      .vid_io_in_left_field(1'b0),
      .vid_io_in_left_hblank(~href_Left),
      .vid_io_in_left_hsync(href_n_edge_Left),
      .vid_io_in_left_vblank(vsync_Left),
      .vid_io_in_left_vsync(vsync_Left),
      
      //Video Input Right
      .vid_io_in_right_active_video(href_Right),
      .vid_io_in_clk_right(pclk_Right_Half),
      .vid_io_in_right_data({8'd127,  pixel_Right[15:8]}),
      .vid_io_in_right_field(1'b0),
      .vid_io_in_right_hblank(~href_Right),
      .vid_io_in_right_hsync(href_n_edge_Right),
      .vid_io_in_right_vblank(vsync_Right),
      .vid_io_in_right_vsync(vsync_Right),

      //Debugging
      .LEDS(LED),
      .PMOD_Debug(PMOD_Debug_BD)
   );
endmodule
