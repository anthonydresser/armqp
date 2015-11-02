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
	inout siod,
	output sioc,
//	output clk_24M,
	output xclk,
	output reset_out,
	output pwdn,
	//output reg [7:0] LED
	
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
      output locked,
      inout zed_hdmi_iic_scl_io,
      inout zed_hdmi_iic_sda_io,
      output [7:0]LED
      
//      output Test,
//      output empty_led,
//      output full,
//      output gen_en,
//      output empty_vidout,
//      output wr_error
    );
	
	assign Test = read_data;
	wire vid_io_in_ce, vid_active_video, clk_12M, vid_field_id;
	wire [23:0] pixel;
	wire fifo_write;
	wire [15:0] fifo_out;
	wire vsync_out, href_out;
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
    wire zed_hdmi_iic_scl_io;
    wire zed_hdmi_iic_scl_o;
    wire zed_hdmi_iic_scl_t;
    wire zed_hdmi_iic_sda_i;
    wire zed_hdmi_iic_sda_io;
    wire zed_hdmi_iic_sda_o;
    wire zed_hdmi_iic_sda_t;
    wire clk_24;
//    assign clk_24M = clk_24;
	
	wire vcc = 1'b1;
	wire gnd = 0'b0;
	reg read_data = 1'b0;
	wire clk_100M;
	wire clk_50M;
	wire button_db;
	
	//TODO change to output 12 MHz clock
	//TODO FIFO logic
	//assign empty_led = empty_fifo;
//	assign LED = pixel[7:0];
//assign LED = vdin;
	
  clk_wiz_0 clk_gen
   (
   // Clock in ports
    .clk_in1(clk),      // input clk_in1
    // Clock out ports
    .clk_24M(clk_24),     // output clk_24M
    .clk_12M(clk_12M),     // output clk_12M
    .clk_100M(clk_100M),
    .clk_50M(clk_50M),
    // Status and control signals
    .reset(button_db));      // output locked
    
    fifo_generator_0 fifo
    (
    .full(full),//output
    .din({vsync, href, pixel[15:0]}), //in
    .wr_en(fifo_write), 
    .empty(empty_fifo),
    .dout({vsync_out, href_out, fifo_out}),
//    .rd_en(read_data),
    .rd_en(vcc),
    .wr_clk(pclk),
    .rd_clk(clk_12M)
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
    
    always @(posedge clk_12M)
    begin
        if (empty_fifo == 1'b0)
            read_data <= 1'b1;
        else
            read_data <= 1'b0;
    end
    
//    v_vid_in_axi4s_0 axi_stream (
//      .vid_io_in_clk(clk_12M),              // input wire vid_io_in_clk
//      .rst(button_db),                                  // input wire rst
//      .vid_io_in_ce(read_data),                // input wire vid_io_in_ce
//      .vid_active_video(vid_active_video),        // input wire vid_active_video
//      .vid_vblank(gnd),                    // input wire vid_vblank
//      .vid_hblank(gnd),                    // input wire vid_hblank
//      .vid_vsync(vsync_out),                      // input wire vid_vsync
//      .vid_hsync(href_out),                      // input wire vid_hsync
//      .vid_field_id(vid_field_id),                // input wire vid_field_id
//      .vid_data(fifo_out),                        // input wire [15 : 0] vid_data
//      .aclk(aclk),                                // input wire aclk
//      .aclken(vcc),                            // input wire aclken
//      .aresetn(vcc),                          // input wire aresetn
//      .m_axis_video_tdata(m_axis_video_tdata),    // output wire [15 : 0] m_axis_video_tdata
//      .m_axis_video_tvalid(m_axis_video_tvalid),  // output wire m_axis_video_tvalid
//      .m_axis_video_tready(m_axis_video_tready),  // input wire m_axis_video_tready
//      .m_axis_video_tuser(m_axis_video_tuser),    // output wire m_axis_video_tuser
//      .m_axis_video_tlast(m_axis_video_tlast),    // output wire m_axis_video_tlast
//      .fid(fid),                                  // output wire fid
//      .vtd_active_video(vtd_active_video),        // output wire vtd_active_video
//      .vtd_vblank(vtd_vblank),                    // output wire vtd_vblank
//      .vtd_hblank(vtd_hblank),                    // output wire vtd_hblank
//      .vtd_vsync(vtd_vsync),                      // output wire vtd_vsync
//      .vtd_hsync(vtd_hsync),                      // output wire vtd_hsync
//      .vtd_field_id(vtd_field_id),                // output wire vtd_field_id
////      .wr_error(wr_error),                        // output wire wr_error
////      .empty(empty),                              // output wire empty
//      .axis_enable(vcc)                  // input wire axis_enable
//    );
    
      assign vid_active_video = 1'b1;
      assign vid_field_id = 1'b0;
    
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


//    i2c_sender i2c (
//        .clk(aclk),
//        .resend(1'b0),
//        .sioc(zed_hdmi_iic_scl_io),
//        .siod(zed_hdmi_iic_sda_io)
//    );

//HDMI
    design_1_wrapper wrapper(
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
        .hdmio_io_clk(hdmio_io_clk),
        .hdmio_io_data(hdmio_io_data),
        .hdmio_io_de(hdmio_io_de),
        .hdmio_io_hsync(hdmio_io_hsync),
        .hdmio_io_spdif(hdmio_io_spdif),
        .hdmio_io_vsync(hdmio_io_vsync),
//        .locked(locked),
//        .video_in_tdata(m_axis_video_tdata),
//        .video_in_tlast(m_axis_video_tlast),
//        .video_in_tready(m_axis_video_tready),
//        .video_in_tuser(m_axis_video_tuser),
//        .video_in_tvalid(m_axis_video_tvalid),
//        .vtiming_in_active_video(vtd_active_video),
//        .vtiming_in_hblank(vtd_hblank),
//        .vtiming_in_hsync(vtd_hsync),
//        .vtiming_in_vblank(vtd_vblank),
//        .vtiming_in_vsync(vtd_vsync),
        .zed_hdmi_iic_scl_io(zed_hdmi_iic_scl_io),
        .zed_hdmi_iic_sda_io(zed_hdmi_iic_sda_io),
//        .gen_clk_en(gen_en),
//        .empty(empty_vidout),
//        .wr_error(wr_error),
        .rawData(fifo_out),
        .LEDS(LED));

        
endmodule
