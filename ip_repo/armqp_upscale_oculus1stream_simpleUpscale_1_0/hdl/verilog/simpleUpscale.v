// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.2
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="simpleUpscale,hls_ip_2015_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=6.700000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=4.089000,HLS_SYN_LAT=1083,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=188,HLS_SYN_LUT=226}" *)

module simpleUpscale (
        ap_clk,
        ap_rst_n,
        videoIn_TDATA,
        videoIn_TVALID,
        videoIn_TREADY,
        videoIn_TKEEP,
        videoIn_TSTRB,
        videoIn_TUSER,
        videoIn_TLAST,
        videoIn_TID,
        videoIn_TDEST,
        videoOut_TDATA,
        videoOut_TVALID,
        videoOut_TREADY,
        videoOut_TKEEP,
        videoOut_TSTRB,
        videoOut_TUSER,
        videoOut_TLAST,
        videoOut_TID,
        videoOut_TDEST
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 5'b1;
parameter    ap_ST_st2_fsm_1 = 5'b10;
parameter    ap_ST_st3_fsm_2 = 5'b100;
parameter    ap_ST_st4_fsm_3 = 5'b1000;
parameter    ap_ST_st5_fsm_4 = 5'b10000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv11_0 = 11'b00000000000;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv16_0 = 16'b0000000000000000;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_const_lv5_0 = 5'b00000;
parameter    ap_const_lv6_1 = 6'b1;
parameter    ap_const_lv32_3C0 = 32'b1111000000;
parameter    ap_const_lv11_438 = 11'b10000111000;
parameter    ap_const_lv11_1 = 11'b1;
parameter    ap_const_lv11_437 = 11'b10000110111;
parameter    ap_const_lv32_77F = 32'b11101111111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst_n;
input  [15:0] videoIn_TDATA;
input   videoIn_TVALID;
output   videoIn_TREADY;
input  [1:0] videoIn_TKEEP;
input  [1:0] videoIn_TSTRB;
input  [1:0] videoIn_TUSER;
input  [0:0] videoIn_TLAST;
input  [4:0] videoIn_TID;
input  [5:0] videoIn_TDEST;
output  [15:0] videoOut_TDATA;
output   videoOut_TVALID;
input   videoOut_TREADY;
output  [1:0] videoOut_TKEEP;
output  [1:0] videoOut_TSTRB;
output  [1:0] videoOut_TUSER;
output  [0:0] videoOut_TLAST;
output  [4:0] videoOut_TID;
output  [5:0] videoOut_TDEST;

reg videoIn_TREADY;
reg[15:0] videoOut_TDATA;
reg videoOut_TVALID;
reg[1:0] videoOut_TKEEP;
reg[1:0] videoOut_TSTRB;
reg[1:0] videoOut_TUSER;
reg[0:0] videoOut_TLAST;
reg[4:0] videoOut_TID;
reg[5:0] videoOut_TDEST;
reg    ap_rst_n_inv;
reg   [31:0] linenum = 32'b00000000000000000000000000000000;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm = 5'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_41;
wire   [10:0] i_1_fu_203_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_51;
wire   [0:0] exitcond_fu_197_p2;
reg    ap_sig_ioackin_videoOut_TREADY;
wire   [10:0] tmp_5_fu_227_p2;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_bdd_70;
wire   [0:0] exitcond1_fu_221_p2;
reg    ap_sig_bdd_76;
wire   [31:0] tmp_s_fu_270_p2;
reg   [31:0] tmp_s_reg_329;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_bdd_90;
reg   [31:0] linenum_load_3_reg_128;
wire   [0:0] tmp_fu_191_p2;
reg   [10:0] i_2_reg_138;
reg   [31:0] linenum_load_s_reg_149;
reg   [10:0] i_reg_159;
reg   [31:0] linenum_load_4_reg_170;
wire   [31:0] p_s_fu_281_p3;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_bdd_120;
wire   [1:0] tmp_8_fu_209_p1;
wire   [1:0] tmp_3_fu_258_p1;
wire   [0:0] tmp_9_fu_214_p2;
wire   [0:0] tmp_4_fu_263_p2;
reg    ap_reg_ioackin_videoOut_TREADY = 1'b0;
wire   [0:0] grp_fu_185_p2;
wire   [0:0] tmp_1_fu_276_p2;
reg   [4:0] ap_NS_fsm;




/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_reg_ioackin_videoOut_TREADY assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ioackin_videoOut_TREADY
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_videoOut_TREADY <= ap_const_logic_0;
    end else begin
        if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0) & ~((exitcond_fu_197_p2 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY))) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~(ap_sig_bdd_76 | ((ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY) & (ap_const_lv1_0 == exitcond1_fu_221_p2)))))) begin
            ap_reg_ioackin_videoOut_TREADY <= ap_const_logic_0;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0) & (ap_const_logic_1 == videoOut_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76 & (ap_const_logic_1 == videoOut_TREADY)))) begin
            ap_reg_ioackin_videoOut_TREADY <= ap_const_logic_1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & (ap_const_lv1_0 == tmp_fu_191_p2))) begin
        i_2_reg_138 <= ap_const_lv11_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0) & ~((exitcond_fu_197_p2 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY)))) begin
        i_2_reg_138 <= i_1_fu_203_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_const_lv1_0 == tmp_fu_191_p2))) begin
        i_reg_159 <= ap_const_lv11_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~(ap_sig_bdd_76 | ((ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY) & (ap_const_lv1_0 == exitcond1_fu_221_p2))))) begin
        i_reg_159 <= tmp_5_fu_227_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & ~(ap_sig_bdd_76 | ((ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY) & (ap_const_lv1_0 == exitcond1_fu_221_p2))) & ~(ap_const_lv1_0 == exitcond1_fu_221_p2))) begin
        linenum_load_4_reg_170 <= linenum_load_s_reg_149;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~((exitcond_fu_197_p2 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY)) & ~(exitcond_fu_197_p2 == ap_const_lv1_0))) begin
        linenum_load_4_reg_170 <= linenum_load_3_reg_128;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        linenum <= p_s_fu_281_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0) & ~((exitcond_fu_197_p2 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY))) | ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & (ap_const_lv1_0 == tmp_fu_191_p2)))) begin
        linenum_load_3_reg_128 <= linenum;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~(ap_sig_bdd_76 | ((ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY) & (ap_const_lv1_0 == exitcond1_fu_221_p2)))) | ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_const_lv1_0 == tmp_fu_191_p2)))) begin
        linenum_load_s_reg_149 <= linenum;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        tmp_s_reg_329 <= tmp_s_fu_270_p2;
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_41)
begin
    if (ap_sig_bdd_41) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st2_fsm_1 assign process. ///
always @ (ap_sig_bdd_51)
begin
    if (ap_sig_bdd_51) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st3_fsm_2 assign process. ///
always @ (ap_sig_bdd_70)
begin
    if (ap_sig_bdd_70) begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st4_fsm_3 assign process. ///
always @ (ap_sig_bdd_90)
begin
    if (ap_sig_bdd_90) begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st5_fsm_4 assign process. ///
always @ (ap_sig_bdd_120)
begin
    if (ap_sig_bdd_120) begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_0;
    end
end

/// ap_sig_ioackin_videoOut_TREADY assign process. ///
always @ (videoOut_TREADY or ap_reg_ioackin_videoOut_TREADY)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_videoOut_TREADY)) begin
        ap_sig_ioackin_videoOut_TREADY = videoOut_TREADY;
    end else begin
        ap_sig_ioackin_videoOut_TREADY = ap_const_logic_1;
    end
end

/// videoIn_TREADY assign process. ///
always @ (ap_sig_ioackin_videoOut_TREADY or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~(ap_sig_bdd_76 | ((ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY) & (ap_const_lv1_0 == exitcond1_fu_221_p2))))) begin
        videoIn_TREADY = ap_const_logic_1;
    end else begin
        videoIn_TREADY = ap_const_logic_0;
    end
end

/// videoOut_TDATA assign process. ///
always @ (videoIn_TDATA or ap_sig_cseq_ST_st2_fsm_1 or exitcond_fu_197_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76)) begin
        videoOut_TDATA = videoIn_TDATA;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0))) begin
        videoOut_TDATA = ap_const_lv16_0;
    end else begin
        videoOut_TDATA = 'bx;
    end
end

/// videoOut_TDEST assign process. ///
always @ (videoIn_TDEST or ap_sig_cseq_ST_st2_fsm_1 or exitcond_fu_197_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76)) begin
        videoOut_TDEST = videoIn_TDEST;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0))) begin
        videoOut_TDEST = ap_const_lv6_1;
    end else begin
        videoOut_TDEST = 'bx;
    end
end

/// videoOut_TID assign process. ///
always @ (videoIn_TID or ap_sig_cseq_ST_st2_fsm_1 or exitcond_fu_197_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76)) begin
        videoOut_TID = videoIn_TID;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0))) begin
        videoOut_TID = ap_const_lv5_0;
    end else begin
        videoOut_TID = 'bx;
    end
end

/// videoOut_TKEEP assign process. ///
always @ (videoIn_TKEEP or ap_sig_cseq_ST_st2_fsm_1 or exitcond_fu_197_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76)) begin
        videoOut_TKEEP = videoIn_TKEEP;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0))) begin
        videoOut_TKEEP = ap_const_lv2_1;
    end else begin
        videoOut_TKEEP = 'bx;
    end
end

/// videoOut_TLAST assign process. ///
always @ (ap_sig_cseq_ST_st2_fsm_1 or exitcond_fu_197_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76 or tmp_9_fu_214_p2 or tmp_4_fu_263_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76)) begin
        videoOut_TLAST = tmp_4_fu_263_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0))) begin
        videoOut_TLAST = tmp_9_fu_214_p2;
    end else begin
        videoOut_TLAST = 'bx;
    end
end

/// videoOut_TSTRB assign process. ///
always @ (videoIn_TSTRB or ap_sig_cseq_ST_st2_fsm_1 or exitcond_fu_197_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76)) begin
        videoOut_TSTRB = videoIn_TSTRB;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0))) begin
        videoOut_TSTRB = ap_const_lv2_1;
    end else begin
        videoOut_TSTRB = 'bx;
    end
end

/// videoOut_TUSER assign process. ///
always @ (ap_sig_cseq_ST_st2_fsm_1 or exitcond_fu_197_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76 or tmp_8_fu_209_p1 or tmp_3_fu_258_p1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76)) begin
        videoOut_TUSER = tmp_3_fu_258_p1;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0))) begin
        videoOut_TUSER = tmp_8_fu_209_p1;
    end else begin
        videoOut_TUSER = 'bx;
    end
end

/// videoOut_TVALID assign process. ///
always @ (ap_sig_cseq_ST_st2_fsm_1 or exitcond_fu_197_p2 or ap_sig_cseq_ST_st3_fsm_2 or exitcond1_fu_221_p2 or ap_sig_bdd_76 or ap_reg_ioackin_videoOut_TREADY)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond_fu_197_p2 == ap_const_lv1_0) & (ap_const_logic_0 == ap_reg_ioackin_videoOut_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_221_p2) & ~ap_sig_bdd_76 & (ap_const_logic_0 == ap_reg_ioackin_videoOut_TREADY)))) begin
        videoOut_TVALID = ap_const_logic_1;
    end else begin
        videoOut_TVALID = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_CS_fsm or exitcond_fu_197_p2 or ap_sig_ioackin_videoOut_TREADY or exitcond1_fu_221_p2 or ap_sig_bdd_76 or tmp_fu_191_p2)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_const_lv1_0 == tmp_fu_191_p2)) begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (((exitcond_fu_197_p2 == ap_const_lv1_0) & ~((exitcond_fu_197_p2 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY)))) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else if ((~((exitcond_fu_197_p2 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY)) & ~(exitcond_fu_197_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        ap_ST_st3_fsm_2 : 
        begin
            if (((ap_const_lv1_0 == exitcond1_fu_221_p2) & ~(ap_sig_bdd_76 | ((ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY) & (ap_const_lv1_0 == exitcond1_fu_221_p2))))) begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end else if ((~(ap_sig_bdd_76 | ((ap_const_logic_0 == ap_sig_ioackin_videoOut_TREADY) & (ap_const_lv1_0 == exitcond1_fu_221_p2))) & ~(ap_const_lv1_0 == exitcond1_fu_221_p2))) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        ap_ST_st5_fsm_4 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end


/// ap_rst_n_inv assign process. ///
always @ (ap_rst_n)
begin
    ap_rst_n_inv = ~ap_rst_n;
end

/// ap_sig_bdd_120 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_120 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_4]);
end

/// ap_sig_bdd_41 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_41 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_51 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_51 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_70 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_70 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end

/// ap_sig_bdd_76 assign process. ///
always @ (videoIn_TVALID or exitcond1_fu_221_p2)
begin
    ap_sig_bdd_76 = ((videoIn_TVALID == ap_const_logic_0) & (ap_const_lv1_0 == exitcond1_fu_221_p2));
end

/// ap_sig_bdd_90 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_90 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end
assign exitcond1_fu_221_p2 = (i_reg_159 == ap_const_lv11_438? 1'b1: 1'b0);
assign exitcond_fu_197_p2 = (i_2_reg_138 == ap_const_lv11_438? 1'b1: 1'b0);
assign grp_fu_185_p2 = (linenum == ap_const_lv32_0? 1'b1: 1'b0);
assign i_1_fu_203_p2 = (i_2_reg_138 + ap_const_lv11_1);
assign p_s_fu_281_p3 = ((tmp_1_fu_276_p2[0:0]===1'b1)? ap_const_lv32_0: tmp_s_reg_329);
assign tmp_1_fu_276_p2 = ($signed(tmp_s_reg_329) > $signed(32'b11101111111)? 1'b1: 1'b0);
assign tmp_3_fu_258_p1 = grp_fu_185_p2;
assign tmp_4_fu_263_p2 = (i_reg_159 == ap_const_lv11_437? 1'b1: 1'b0);
assign tmp_5_fu_227_p2 = (i_reg_159 + ap_const_lv11_1);
assign tmp_8_fu_209_p1 = grp_fu_185_p2;
assign tmp_9_fu_214_p2 = (i_2_reg_138 == ap_const_lv11_437? 1'b1: 1'b0);
assign tmp_fu_191_p2 = ($signed(linenum) < $signed(32'b1111000000)? 1'b1: 1'b0);
assign tmp_s_fu_270_p2 = (linenum_load_4_reg_170 + ap_const_lv32_1);


endmodule //simpleUpscale
