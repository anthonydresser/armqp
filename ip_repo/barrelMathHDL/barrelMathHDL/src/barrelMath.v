`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Lukas Hunker
// 
// Create Date: 02/21/2016 10:17:17 PM
// Design Name: 
// Module Name: barrelMath
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

//TODO readys
module barrelMath(
    output reg [31:0] tIn,
    output reg tIn_vld,
    input tIn_ready,
    input [31:0] tOut,
    input tOut_vld,
    output reg tOut_ready,
    output reg [31:0] rCIn,
    output reg rCIn_vld,
    output reg [15:0] rPIn,
    output reg rPIn_vld,
    input rCIn_ready,
    input rPIn_ready,
    input [31:0] rOut,
    input rOut_vld,
    output rOut_ready,
    output reg [11:0] xOut,
    output reg [11:0] yOut,
    input mem_ready,
    input clk,
    input reset,
    output reg addr_vld
    );


//Input Coordinate register
reg [10:0] xIn = 0;
reg [10:0] yIn = 0;
wire rIn_ready;
assign rIn_ready = rPIn_ready & rCIn_ready;


//Output x,y and increment
always @(posedge clk)
    begin
        if(reset) begin
            xIn <= 0;
            yIn <= 0;
            tIn_vld <= 0;
            tIn <= 32'b0;
        end
        else begin
            if(tIn_ready)
                begin
                    tIn <= {yIn, 4'b0, xIn, 4'b0};
                    tIn_vld <= 1;
                    //xIn <= xIn + 1'b1;
                    if (xIn >= 1079)
                        begin
                            xIn <= 0;
                            if (yIn >= 959)
                                yIn <= 0;
                            else
                                yIn <= yIn + 1'b1;
                       end
                   else
                        xIn <= xIn + 1'b1;
                 end
            else
                tIn_vld <= 0;
        end
    end

//Do Math
reg [15:0] phase;
reg [15:0] radius;

//Get output
always @(posedge clk)
    begin
        if(reset) begin
            tOut_ready = 1'b0; 
            phase <= 0;
            radius <=0;
        end
        else
            if(tOut_vld & rIn_ready)
                begin
                    tOut_ready <= 1'b1;
                    phase <= tOut[31:16];
                    radius <= tOut[15:0];
                end 
           else begin
                tOut_ready = 1'b0; 
                phase <= 0;
                radius <=0;
           end          
    end
    
//ALL fixed point using Q4 unless otherwise noted

//calc rsq
reg [15:0] rsq1, ph1, ra1;
always @(posedge clk )
    begin
        if(reset) begin
            rsq1 <= 0;
            ph1 <= 0;
            ra1 <= 0;
        end
        else
            if(tOut_vld  & rIn_ready)begin
                rsq1 <= 10 * radius * radius;
                ph1 <= phase;
                ra1 <= radius;
            end
    end
    
reg [15:0] rsq2, ph2, ra2;
always @(posedge clk)
        begin
            if(reset) begin
                rsq2 <= 0;
                ph2 <= 0;
                ra2 <= 0;
            end
            else
                if(tOut_vld  & rIn_ready)begin
                    rsq2 <= rsq1 / 16'd8352000;
                    ph2 <= ph1;
                    ra2 <= ra1;
                end
        end
        
reg [15:0] floor;
reg [15:0] rsq3, ph3, ra3;
always @(posedge clk)
    begin
        if (reset) begin
            floor <= 0;
            rsq3 <= 0;
            ph3 <= 0;
            ra3 <= 0;
        end
        else
            if(tOut_vld  & rIn_ready)
            begin
                floor <= {rsq2[15:4], 4'b0};
                rsq3 <= rsq2;
                ph3 <= ph2;
                ra3 <= ra2;
            end
    end

reg [15:0] floor2;
reg [15:0] rsq4,  ph4, ra4;
always @(posedge clk)
    begin
        if (reset) begin
            floor2 <= 0;
            rsq4 <= 0;
            ph4 <= 0;
            ra4 <= 0;
        end
        else
            if(tOut_vld  & rIn_ready)
            begin
                floor2 <= (floor > 16'd160)? 16'd160 : floor;
                rsq4 <= rsq3;
                ph4 <= ph3;
                ra4 <= ra3;
            end
    end

reg [15:0] floor3;
reg [15:0] rsq5, ph5, ra5;
always @(posedge clk)
    begin
        if (reset) begin
            floor3 <= 0;
            rsq5 <= 0;
            ph5 <= 0;
            ra5 <= 0;
        end
        else
            if(tOut_vld  & rIn_ready)
            begin
                floor3 <= (floor2 < 16'd0)? 16'd0 : floor2;
                rsq5 <= rsq4;
                ph5 <= ph4;
                ra5 <= ra4;
            end
    end
    
reg [15:0] t;
reg [15:0] k, ph6, ra6;
always @(posedge clk)
    begin
        if (reset) begin
            t <= 0;
            k <=0;
            ph6 <= 0;
            ra6 <= 0;
        end
        else
            if(tOut_vld  & rIn_ready)
            begin
                t <= rsq5 - floor3;
                k <= floor3 >> 4;
                ph6 <= ph5;
                ra6 <= ra5;
            end
    end
    
//find params
reg [15:0] m0, m1, p0, p1, t2, omt;
reg[15:0] ph7, ra7;
always @(posedge clk)
    begin
    if (reset) begin
        m0 <= 0;
        m1 <= 0;
        p0 <= 0;
        p1 <= 0;
        t2 <= 0;
        omt <= 0;
        ph7 <= 0;
        ra7 <= 0;
    end
    else
        if(tOut_vld  & rIn_ready) begin
            t2 <= t;
            omt <= 16'b1 - t;
            ph7 <= ph6;
            ra7 <= ra6;
            case (t)
               //These constants are Q10	
                    16'd0: begin
                            p0 <= 1024;
                            m0 <= -705;
                            p1 <= 954;
                            m1 <= -35;
                        end
                    16'd9: begin
                            p0 <= 784;
                            m0 <= -11;
                            p1 <= 742;
                            m1 <= -21;
                        end
                    16'd10: begin
                            p0 <= 742;
                            m0 <= -21;
                            p1 <= 721;
                            m1 <= -21;
                        end
                    16'd1: begin
                            p0 <= 988;
                            m0 <= -35;
                            p1 <= 954;
                            m1 <= -34;
                        end
                    16'd2: begin
                            p0 <= 954;
                            m0 <= -34;
                            p1 <= 920;
                            m1 <= -32;
                        end
                    16'd3: begin
                            p0 <= 920;
                            m0 <= -32;
                            p1 <= 889;
                            m1 <= -30;
                        end
                    16'd4: begin
                            p0 <= 889;
                            m0 <= -30;
                            p1 <= 860;
                            m1 <= -28;
                        end
                    16'd5: begin
                            p0 <= 860;
                            m0 <= -28;
                            p1 <= 834;
                            m1 <= -26;
                        end
                    16'd6: begin
                            p0 <= 834;
                            m0 <= -26;
                            p1 <= 808;
                            m1 <= -25;
                        end
                    16'd7: begin
                            p0 <= 808;
                            m0 <= -25;
                            p1 <= 784;
                            m1 <= -23;
                        end
                    16'd8: begin
                            p0 <= 784;
                            m0 <= -23;
                            p1 <= 763;
                            m1 <= -21;
                        end
                endcase
             end
    end

//find res
reg[15:0] ph8, ra8, ph9, ra9, ph10, ra10, ph11, ra11, ph12, ra12, ph13, ph14;
reg [15:0] p0_1;
reg [31:0] res1, res1_2, res1_3, res1_4, res1_5, res1_6;
reg [31:0]  res2, res2_2, res2_3, res2_4, res2_5, res2_6;
reg [31:0] res3, res3_3, res3_4, res3_6, res4, res4_6, res5, rad, rad1;
always @(posedge clk) begin
    if (reset) begin
        ph8 <=0;
        ph9 <= 0;
        ph10 <= 0;
        ph11 <= 0;
        ph12 <=0;
        ph13 <= 0;
        ph14 <= 0;
        ra8 <= 0;
        ra9 <= 0;
        ra10 <= 0;
        ra11 <= 0;
        ra12 <= 0;
        p0_1 <= 0;
        res1 <= 0;
        res1_2 <= 0;
        res1_3 <= 0;
        res1_4 <= 0;
        res1_5 <= 0;
        res1_6 <= 0;
        res2 <= 0;
        res2_2 <= 0;
        res2_3 <= 0;
        res2_4 <= 0;
        res2_5 <= 0;
        res2_6 <= 0;
        res3 <= 0;
        res3_3 <= 0;
        res3_4 <= 0;
        res3_6 <= 0;
        res4 <= 0;
        res4_6 <= 0;
        res5 <= 0;
        rad <= 0;
        rad1 <= 0;
    end
    else
        if(tOut_vld  & rIn_ready) begin
            res1 <= 16'b1 + (16'd2 * t2);  //Q0
            res1_2 <= m0 * t2; //Q14
            res1_3 <= omt * omt;   //Q0
            res1_4 <= 16'd1 + (16'd2 * omt); //Q0
            res1_5 <= m1 * omt; //Q10
            res1_6 <= t2 * t2; //Q0
            ph8 <= ph7;
            ra8 <= ra7;
            p0_1 <= p0;
            
            res2 <= p0_1 * res1;  //Q10   carry p0
            res2_2 <= res1_2 >> 4 ; //Q10
            res2_3 <= res1_3; //Q0
            res2_4 <= res1_4 * p0_1;  //Q10 carry p0
            res2_5 <= res1_5;
            res2_6 <= res1_6;    //Q0
            ph9 <= ph8;
            ra9 <= ra8;
            
            res3 <= res2 + res2_2; //Q10
            res3_3 <= res2_3;  //Q0
            res3_4 <= res2_4 - res2_5;  //Q10
            res3_6 <= res2_6; //Q0
            ph10 <= ph9;
            ra10 <= ra9;
            
            res4 <= res3 * res3_3;   //Q10
            res4_6 <= res3_6 * res3_4;   //Q10
            ph11 <= ph10;
            ra11 <= ra10;
            
            res5 <= res4 + res4_6;   //Q10
            ph12 <= ph11;
            ra12 <= ra11;
            
            rad <= res5 * ra12;    //Q14
            ph13 <= ph12;
            
            rad1 <= rad >> 10;   //Q4
            ph14 <= ph13;
        end
end

//Output to Rout
always @(posedge clk)begin
    if(reset) begin
        rPIn_vld <= 0;
        rCIn_vld <= 0;
        rCIn <= 0;
        rPIn <= 0;
    end
    else begin
       if (tOut_vld  & rIn_ready) begin
            rPIn_vld <= 1'b1;
            rCIn_vld <= 1'b1;
            rCIn <= {16'b0, rad1[15:0]};
            rPIn <= ph14;
            end
       else begin
            rPIn_vld <= 1'b0;
            rCIn_vld <= 1'b0;
            end
   end
end

//Send rotate output


assign rOut_ready = mem_ready;

always  @(posedge clk)
    begin
        if (reset) begin
            xOut <= 0;
            yOut <= 0;
            addr_vld <= 0;
            end
        else begin
            if (rOut_vld)
                begin
                    xOut <= (rOut[15]) ? 0 : (rOut[15:4] > 959) ? 959 : rOut[15:4] ;
                    yOut <= (rOut[31]) ? 0 : (rOut[31:20] > 1079) ? 1079 : rOut[31:20] ;
                    addr_vld <= 1;
                end
           else begin
               xOut <= 0;
               yOut <= 0;
               addr_vld <= 0;
           end
       end
    end

endmodule