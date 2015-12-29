// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.2
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="combineStreams,hls_ip_2015_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-2,HLS_INPUT_CLOCK=6.734007,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.426000,HLS_SYN_LAT=1082,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=163,HLS_SYN_LUT=176}" *)

module combineStreams (
        ap_clk,
        ap_rst_n,
        A_TDATA,
        A_TVALID,
        A_TREADY,
        A_TKEEP,
        A_TSTRB,
        A_TUSER,
        A_TLAST,
        A_TID,
        A_TDEST,
        B_TDATA,
        B_TVALID,
        B_TREADY,
        B_TKEEP,
        B_TSTRB,
        B_TUSER,
        B_TLAST,
        B_TID,
        B_TDEST,
        C_TDATA,
        C_TVALID,
        C_TREADY,
        C_TKEEP,
        C_TSTRB,
        C_TUSER,
        C_TLAST,
        C_TID,
        C_TDEST
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 4'b1;
parameter    ap_ST_pp0_stg0_fsm_1 = 4'b10;
parameter    ap_ST_pp1_stg0_fsm_2 = 4'b100;
parameter    ap_ST_st6_fsm_3 = 4'b1000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv11_0 = 11'b00000000000;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv32_3C0 = 32'b1111000000;
parameter    ap_const_lv11_438 = 11'b10000111000;
parameter    ap_const_lv11_1 = 11'b1;
parameter    ap_const_lv32_77E = 32'b11101111110;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst_n;
input  [15:0] A_TDATA;
input   A_TVALID;
output   A_TREADY;
input  [1:0] A_TKEEP;
input  [1:0] A_TSTRB;
input  [1:0] A_TUSER;
input  [0:0] A_TLAST;
input  [4:0] A_TID;
input  [5:0] A_TDEST;
input  [15:0] B_TDATA;
input   B_TVALID;
output   B_TREADY;
input  [1:0] B_TKEEP;
input  [1:0] B_TSTRB;
input  [1:0] B_TUSER;
input  [0:0] B_TLAST;
input  [4:0] B_TID;
input  [5:0] B_TDEST;
output  [15:0] C_TDATA;
output   C_TVALID;
input   C_TREADY;
output  [1:0] C_TKEEP;
output  [1:0] C_TSTRB;
output  [1:0] C_TUSER;
output  [0:0] C_TLAST;
output  [4:0] C_TID;
output  [5:0] C_TDEST;

reg A_TREADY;
reg B_TREADY;
reg[15:0] C_TDATA;
reg C_TVALID;
reg[1:0] C_TKEEP;
reg[1:0] C_TSTRB;
reg[1:0] C_TUSER;
reg[0:0] C_TLAST;
reg[4:0] C_TID;
reg[5:0] C_TDEST;
reg    ap_rst_n_inv;
reg   [31:0] row = 32'b00000000000000000000000000000000;
reg   [10:0] i_1_reg_156;
reg   [10:0] i_reg_167;
reg   [31:0] row_load_reg_288;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_53;
wire   [0:0] tmp_fu_182_p2;
wire   [0:0] exitcond_fu_188_p2;
reg   [0:0] exitcond_reg_298;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_1;
reg    ap_sig_bdd_65;
reg    ap_sig_bdd_71;
reg    ap_reg_ppiten_pp0_it0 = 1'b0;
reg    ap_sig_ioackin_C_TREADY;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
wire   [10:0] i_3_fu_194_p2;
reg   [15:0] B_data_V_tmp_reg_307;
reg   [1:0] B_keep_V_tmp_reg_312;
reg   [1:0] B_strb_V_tmp_reg_317;
reg   [0:0] B_last_V_tmp_reg_322;
reg   [4:0] B_id_V_tmp_reg_327;
reg   [5:0] B_dest_V_tmp_reg_332;
wire   [0:0] exitcond1_fu_224_p2;
reg   [0:0] exitcond1_reg_337;
reg    ap_sig_cseq_ST_pp1_stg0_fsm_2;
reg    ap_sig_bdd_109;
reg    ap_sig_bdd_114;
reg    ap_reg_ppiten_pp1_it0 = 1'b0;
reg    ap_reg_ppiten_pp1_it1 = 1'b0;
wire   [10:0] i_2_fu_230_p2;
reg   [15:0] A_data_V_tmp_reg_346;
reg   [1:0] A_keep_V_tmp_reg_351;
reg   [1:0] A_strb_V_tmp_reg_356;
reg   [1:0] A_user_V_tmp_reg_361;
reg   [0:0] A_last_V_tmp_reg_366;
reg   [4:0] A_id_V_tmp_reg_371;
reg   [5:0] A_dest_V_tmp_reg_376;
wire   [31:0] storemerge_fu_274_p3;
reg    ap_sig_cseq_ST_st6_fsm_3;
reg    ap_sig_bdd_166;
reg    ap_reg_ioackin_C_TREADY = 1'b0;
wire   [0:0] tmp_5_fu_264_p2;
wire   [31:0] tmp_6_fu_269_p2;
reg   [3:0] ap_NS_fsm;




/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_reg_ioackin_C_TREADY assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ioackin_C_TREADY
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_C_TREADY <= ap_const_logic_0;
    end else begin
        if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1)))))) begin
            ap_reg_ioackin_C_TREADY <= ap_const_logic_0;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) & (ap_const_logic_1 == C_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) & (ap_const_logic_1 == C_TREADY)))) begin
            ap_reg_ioackin_C_TREADY <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it0 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it0
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(exitcond_fu_188_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & (tmp_fu_182_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it1 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_fu_188_p2 == ap_const_lv1_0) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & (tmp_fu_182_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(exitcond_fu_188_p2 == ap_const_lv1_0)))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
        end
    end
end

/// ap_reg_ppiten_pp1_it0 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp1_it0
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ppiten_pp1_it0 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))) & ~(ap_const_lv1_0 == exitcond1_fu_224_p2))) begin
            ap_reg_ppiten_pp1_it0 <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(tmp_fu_182_p2 == ap_const_lv1_0))) begin
            ap_reg_ppiten_pp1_it0 <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp1_it1 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp1_it1
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ppiten_pp1_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_224_p2) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))))) begin
            ap_reg_ppiten_pp1_it1 <= ap_const_logic_1;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(tmp_fu_182_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))) & ~(ap_const_lv1_0 == exitcond1_fu_224_p2)))) begin
            ap_reg_ppiten_pp1_it1 <= ap_const_logic_0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & (tmp_fu_182_p2 == ap_const_lv1_0))) begin
        i_1_reg_156 <= ap_const_lv11_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_fu_188_p2 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        i_1_reg_156 <= i_3_fu_194_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(tmp_fu_182_p2 == ap_const_lv1_0))) begin
        i_reg_167 <= ap_const_lv11_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_224_p2) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))))) begin
        i_reg_167 <= i_2_fu_230_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_224_p2) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))))) begin
        A_data_V_tmp_reg_346 <= A_TDATA;
        A_dest_V_tmp_reg_376 <= A_TDEST;
        A_id_V_tmp_reg_371 <= A_TID;
        A_keep_V_tmp_reg_351 <= A_TKEEP;
        A_last_V_tmp_reg_366 <= A_TLAST;
        A_strb_V_tmp_reg_356 <= A_TSTRB;
        A_user_V_tmp_reg_361 <= A_TUSER;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_fu_188_p2 == ap_const_lv1_0) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        B_data_V_tmp_reg_307 <= B_TDATA;
        B_dest_V_tmp_reg_332 <= B_TDEST;
        B_id_V_tmp_reg_327 <= B_TID;
        B_keep_V_tmp_reg_312 <= B_TKEEP;
        B_last_V_tmp_reg_322 <= B_TLAST;
        B_strb_V_tmp_reg_317 <= B_TSTRB;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))))) begin
        exitcond1_reg_337 <= exitcond1_fu_224_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        exitcond_reg_298 <= exitcond_fu_188_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st6_fsm_3)) begin
        row <= storemerge_fu_274_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        row_load_reg_288 <= row;
    end
end

/// A_TREADY assign process. ///
always @ (ap_sig_ioackin_C_TREADY or exitcond1_fu_224_p2 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_fu_224_p2) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))))) begin
        A_TREADY = ap_const_logic_1;
    end else begin
        A_TREADY = ap_const_logic_0;
    end
end

/// B_TREADY assign process. ///
always @ (exitcond_fu_188_p2 or exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_sig_ioackin_C_TREADY or ap_reg_ppiten_pp0_it1)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_fu_188_p2 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        B_TREADY = ap_const_logic_1;
    end else begin
        B_TREADY = ap_const_logic_0;
    end
end

/// C_TDATA assign process. ///
always @ (exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or B_data_V_tmp_reg_307 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1 or A_data_V_tmp_reg_346)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)))) begin
        C_TDATA = A_data_V_tmp_reg_346;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)))) begin
        C_TDATA = B_data_V_tmp_reg_307;
    end else begin
        C_TDATA = 'bx;
    end
end

/// C_TDEST assign process. ///
always @ (exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or B_dest_V_tmp_reg_332 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1 or A_dest_V_tmp_reg_376)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)))) begin
        C_TDEST = A_dest_V_tmp_reg_376;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)))) begin
        C_TDEST = B_dest_V_tmp_reg_332;
    end else begin
        C_TDEST = 'bx;
    end
end

/// C_TID assign process. ///
always @ (exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or B_id_V_tmp_reg_327 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1 or A_id_V_tmp_reg_371)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)))) begin
        C_TID = A_id_V_tmp_reg_371;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)))) begin
        C_TID = B_id_V_tmp_reg_327;
    end else begin
        C_TID = 'bx;
    end
end

/// C_TKEEP assign process. ///
always @ (exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or B_keep_V_tmp_reg_312 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1 or A_keep_V_tmp_reg_351)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)))) begin
        C_TKEEP = A_keep_V_tmp_reg_351;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)))) begin
        C_TKEEP = B_keep_V_tmp_reg_312;
    end else begin
        C_TKEEP = 'bx;
    end
end

/// C_TLAST assign process. ///
always @ (exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or B_last_V_tmp_reg_322 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1 or A_last_V_tmp_reg_366)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)))) begin
        C_TLAST = A_last_V_tmp_reg_366;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)))) begin
        C_TLAST = B_last_V_tmp_reg_322;
    end else begin
        C_TLAST = 'bx;
    end
end

/// C_TSTRB assign process. ///
always @ (exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or B_strb_V_tmp_reg_317 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1 or A_strb_V_tmp_reg_356)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)))) begin
        C_TSTRB = A_strb_V_tmp_reg_356;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)))) begin
        C_TSTRB = B_strb_V_tmp_reg_317;
    end else begin
        C_TSTRB = 'bx;
    end
end

/// C_TUSER assign process. ///
always @ (exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1 or A_user_V_tmp_reg_361)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)))) begin
        C_TUSER = A_user_V_tmp_reg_361;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)))) begin
        C_TUSER = ap_const_lv2_0;
    end else begin
        C_TUSER = 'bx;
    end
end

/// C_TVALID assign process. ///
always @ (exitcond_reg_298 or ap_sig_cseq_ST_pp0_stg0_fsm_1 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or exitcond1_reg_337 or ap_sig_cseq_ST_pp1_stg0_fsm_2 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1 or ap_reg_ioackin_C_TREADY)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_1) & (exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) & (ap_const_logic_0 == ap_reg_ioackin_C_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp1_stg0_fsm_2) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1) & ~(ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) & (ap_const_logic_0 == ap_reg_ioackin_C_TREADY)))) begin
        C_TVALID = ap_const_logic_1;
    end else begin
        C_TVALID = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp0_stg0_fsm_1 assign process. ///
always @ (ap_sig_bdd_65)
begin
    if (ap_sig_bdd_65) begin
        ap_sig_cseq_ST_pp0_stg0_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_pp0_stg0_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp1_stg0_fsm_2 assign process. ///
always @ (ap_sig_bdd_109)
begin
    if (ap_sig_bdd_109) begin
        ap_sig_cseq_ST_pp1_stg0_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_pp1_stg0_fsm_2 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_53)
begin
    if (ap_sig_bdd_53) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st6_fsm_3 assign process. ///
always @ (ap_sig_bdd_166)
begin
    if (ap_sig_bdd_166) begin
        ap_sig_cseq_ST_st6_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_3 = ap_const_logic_0;
    end
end

/// ap_sig_ioackin_C_TREADY assign process. ///
always @ (C_TREADY or ap_reg_ioackin_C_TREADY)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_C_TREADY)) begin
        ap_sig_ioackin_C_TREADY = C_TREADY;
    end else begin
        ap_sig_ioackin_C_TREADY = ap_const_logic_1;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_CS_fsm or tmp_fu_182_p2 or exitcond_fu_188_p2 or exitcond_reg_298 or ap_sig_bdd_71 or ap_reg_ppiten_pp0_it0 or ap_sig_ioackin_C_TREADY or ap_reg_ppiten_pp0_it1 or exitcond1_fu_224_p2 or exitcond1_reg_337 or ap_sig_bdd_114 or ap_reg_ppiten_pp1_it0 or ap_reg_ppiten_pp1_it1)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(tmp_fu_182_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_pp1_stg0_fsm_2;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
            end
        end
        ap_ST_pp0_stg0_fsm_1 : 
        begin
            if (~((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(exitcond_fu_188_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
            end else if (((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_71 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | ((exitcond_reg_298 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(exitcond_fu_188_p2 == ap_const_lv1_0))) begin
                ap_NS_fsm = ap_ST_st6_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_1;
            end
        end
        ap_ST_pp1_stg0_fsm_2 : 
        begin
            if (~((ap_const_logic_1 == ap_reg_ppiten_pp1_it0) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))) & ~(ap_const_lv1_0 == exitcond1_fu_224_p2))) begin
                ap_NS_fsm = ap_ST_pp1_stg0_fsm_2;
            end else if (((ap_const_logic_1 == ap_reg_ppiten_pp1_it0) & ~((ap_sig_bdd_114 & (ap_const_logic_1 == ap_reg_ppiten_pp1_it0)) | ((ap_const_logic_0 == ap_sig_ioackin_C_TREADY) & (ap_const_lv1_0 == exitcond1_reg_337) & (ap_const_logic_1 == ap_reg_ppiten_pp1_it1))) & ~(ap_const_lv1_0 == exitcond1_fu_224_p2))) begin
                ap_NS_fsm = ap_ST_st6_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_pp1_stg0_fsm_2;
            end
        end
        ap_ST_st6_fsm_3 : 
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

/// ap_sig_bdd_109 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_109 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end

/// ap_sig_bdd_114 assign process. ///
always @ (A_TVALID or exitcond1_fu_224_p2)
begin
    ap_sig_bdd_114 = ((A_TVALID == ap_const_logic_0) & (ap_const_lv1_0 == exitcond1_fu_224_p2));
end

/// ap_sig_bdd_166 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_166 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end

/// ap_sig_bdd_53 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_53 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_65 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_65 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_71 assign process. ///
always @ (B_TVALID or exitcond_fu_188_p2)
begin
    ap_sig_bdd_71 = ((B_TVALID == ap_const_logic_0) & (exitcond_fu_188_p2 == ap_const_lv1_0));
end
assign exitcond1_fu_224_p2 = (i_reg_167 == ap_const_lv11_438? 1'b1: 1'b0);
assign exitcond_fu_188_p2 = (i_1_reg_156 == ap_const_lv11_438? 1'b1: 1'b0);
assign i_2_fu_230_p2 = (i_reg_167 + ap_const_lv11_1);
assign i_3_fu_194_p2 = (i_1_reg_156 + ap_const_lv11_1);
assign storemerge_fu_274_p3 = ((tmp_5_fu_264_p2[0:0]===1'b1)? ap_const_lv32_0: tmp_6_fu_269_p2);
assign tmp_5_fu_264_p2 = ($signed(row_load_reg_288) > $signed(32'b11101111110)? 1'b1: 1'b0);
assign tmp_6_fu_269_p2 = (row_load_reg_288 + ap_const_lv32_1);
assign tmp_fu_182_p2 = ($signed(row) < $signed(32'b1111000000)? 1'b1: 1'b0);


endmodule //combineStreams
