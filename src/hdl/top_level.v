`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Anthony Dresser
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
	output clk_24M,
	output reg [7:0] LED
    );
	
	wire vid_io_in_ce, vid_active_video, clk_12M, vid_field_id;
	wire [15:0] dataW;
	
	
  clk_wiz_0 clk_gen
   (
   // Clock in ports
    .clk_in1(clk),      // input clk_in1
    // Clock out ports
    .clk_24M(clk_24M),     // output clk_24M
    // Status and control signals
    .reset(reset));      // output locked
    
    
      clk_wiz_1 clk_gen2
       (
       // Clock in ports
        .clk_in1(pclk),      // input clk_in1
        // Clock out ports
        .clk_12M(clk_12M),     // output clk_out1
        // Status and control signals
        .reset(reset));      // output locked
    
    
    v_vid_in_axi4s_0 axi_stream (
      .vid_io_in_clk(clk_12M),              // input wire vid_io_in_clk
      .rst(reset),                                  // input wire rst
      .vid_io_in_ce(vid_io_in_ce),                // input wire vid_io_in_ce
      .vid_active_video(vid_active_video),        // input wire vid_active_video
//      .vid_vblank(),                    // input wire vid_vblank
//      .vid_hblank(),                    // input wire vid_hblank
      .vid_vsync(vsync),                      // input wire vid_vsync
      .vid_hsync(href),                      // input wire vid_hsync
      .vid_field_id(vid_field_id),                // input wire vid_field_id
      .vid_data(dataW),                        // input wire [15 : 0] vid_data
      .aclk(aclk),                                // input wire aclk
      .aclken(aclken),                            // input wire aclken
      .aresetn(aresetn),                          // input wire aresetn
      .m_axis_video_tdata(m_axis_video_tdata),    // output wire [15 : 0] m_axis_video_tdata
      .m_axis_video_tvalid(m_axis_video_tvalid),  // output wire m_axis_video_tvalid
      .m_axis_video_tready(m_axis_video_tready),  // input wire m_axis_video_tready
      .m_axis_video_tuser(m_axis_video_tuser),    // output wire m_axis_video_tuser
      .m_axis_video_tlast(m_axis_video_tlast),    // output wire m_axis_video_tlast
      .fid(fid),                                  // output wire fid
      .vtd_active_video(vtd_active_video),        // output wire vtd_active_video
      .vtd_vblank(vtd_vblank),                    // output wire vtd_vblank
      .vtd_hblank(vtd_hblank),                    // output wire vtd_hblank
      .vtd_vsync(vtd_vsync),                      // output wire vtd_vsync
      .vtd_hsync(vtd_hsync),                      // output wire vtd_hsync
      .vtd_field_id(vtd_field_id),                // output wire vtd_field_id
      .wr_error(wr_error),                        // output wire wr_error
      .empty(empty),                              // output wire empty
      .axis_enable(axis_enable)                  // input wire axis_enable
    );
    
      assign vid_io_in_ce = 1'b1;
      assign vid_active_video = 1'b1;
      assign vid_field_id = 1'b0;
    
    
//    blk_mem_gen_2 your_instance_name (
//      .clka(clk_24M),    // input wire clka
//      .ena(ena),      // input wire ena
//      .wea(wea),      // input wire [0 : 0] wea
//      .addra(addrW),  // input wire [8 : 0] addra
//      .dina(dataW),    // input wire [63 : 0] dina
//      .douta(),  // output wire [63 : 0] douta
//      .clkb(clk_24M),    // input wire clkb
//      .enb(enb),      // input wire enb
//      .web(web),      // input wire [0 : 0] web
//      .addrb(addrb),  // input wire [8 : 0] addrb
//      .dinb(),    // input wire [63 : 0] dinb
//      .doutb(doutb)  // output wire [63 : 0] doutb
//    );
    
    OV7670_interface cam (
		.din(vdin),
		.vsync(vsync),
		.href(href),
		.pclk(pclk),
		.reset(reset),
		.dout(dataW)
    );
    
//    assign ena = 1'b1;
//    assign enb = 1'b1;
//    assign web = 1'b0;
        
endmodule
