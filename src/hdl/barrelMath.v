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

module barrelMath(
    output reg [31:0] tIn_tdata,
    output reg tIn_tvalid,
    input tIn_tready,
    input [31:0] tOut_tdata,
    input tOut_tvalid,
    output reg tOut_tready,
    output reg [31:0] rCin_tdata,
    output reg rCin_tvalid,
    output reg [15:0] rPin_tdata,
    output reg rPin_tvalid,
    input rCin_tready,
    input rPin_tready,
    input [31:0] rOut_tdata,
    input rOut_tvalid,
    output rOut_tready,
    output reg [11:0] xOut,
    output reg [11:0] yOut,
    input mem_ready,
    input clk,
    input reset,
    output reg addr_vld
    );


//Input Coordinate register
reg signed [12:0] xIn = 13'sd0 - 13'sd540;
reg signed [12:0] yIn = 13'sd480;
wire rIn_ready;
assign rIn_ready = rPin_tready & rCin_tready;
reg [13:0] math_vld;

//Math valid daisy chain
always @(posedge clk)
	begin
		if(reset) begin
			math_vld <= 0;
		end
		else if (tOut_tvalid && rCin_tready) begin
			if(tOut_tvalid)
				math_vld[0] <= 1'b1;
			else 
				math_vld[0] <= 1'b0;
			if(math_vld[0])
				math_vld[1] <= 1'b1;
			else 
				math_vld[1] <= 1'b0;
			if(math_vld[1])
				math_vld[2] <= 1'b1;
			else 
				math_vld[2] <= 1'b0;
			if(math_vld[2])
				math_vld[3] <= 1'b1;
			else 
				math_vld[3] <= 1'b0;
			if(math_vld[3])
				math_vld[4] <= 1'b1;
			else 
				math_vld[4] <= 1'b0;
			if(math_vld[4])
				math_vld[5] <= 1'b1;
			else 
				math_vld[5] <= 1'b0;
			if(math_vld[5])
				math_vld[6] <= 1'b1;
			else 
				math_vld[6] <= 1'b0;
			if(math_vld[6])
				math_vld[7] <= 1'b1;
			else 
				math_vld[7] <= 1'b0;
			if(math_vld[7])
				math_vld[8] <= 1'b1;
			else 
				math_vld[8] <= 1'b0;
			if(math_vld[8])
				math_vld[9] <= 1'b1;
			else 
				math_vld[9] <= 1'b0;
			if(math_vld[9])
				math_vld[10] <= 1'b1;
			else 
				math_vld[10] <= 1'b0;
			if(math_vld[10])
				math_vld[11] <= 1'b1;
			else 
				math_vld[11] <= 1'b0;
			if(math_vld[11])
				math_vld[12] <= 1'b1;
			else 
				math_vld[12] <= 1'b0;
			if(math_vld[12])
				math_vld[13] <= 1'b1;
			else 
				math_vld[13] <= 1'b0;
			if(math_vld[13])begin
					rPin_tvalid <= 1'b1;
					rCin_tvalid <= 1'b1;
				end
			else begin
				rPin_tvalid <= 1'b0;
				rCin_tvalid <= 1'b0;
				end
		end
		else begin
			rPin_tvalid <= 1'b0;
			rCin_tvalid <= 1'b0;
			math_vld <= math_vld;
			rPin_tvalid <= 0;
			rCin_tvalid <= 0;
		end
	end

//Output x,y and increment
always @(posedge clk)
    begin
        if(reset) begin
            xIn <= -12'sd540;
            yIn <= 12'sd480;
            tIn_tvalid <= 0;
            tIn_tdata <= 32'b0;
        end
        else begin
            if(tIn_tready)
                begin
                    tIn_tdata <= {yIn, 3'b0,  xIn, 3'b0};
                    tIn_tvalid <= 1;
                    //xIn <= xIn + 1'b1;
                    if (xIn >= 539)
                        begin
                            xIn <= -13'sd540;
                            if (yIn <= -13'sd479)
                                yIn <= 13'sd480;
                            else
                                yIn <= yIn - 1'b1;
                       end
                   else
                        xIn <= xIn + 1'b1;
                 end
            else
                tIn_tvalid <= 0;
        end
    end

//Do Math
reg [15:0] phase;
reg [15:0] radius;

//Get output
//s1
always @(posedge clk)
    begin
        if(reset) begin
            tOut_tready = 1'b0; 
            phase <= 0;
            radius <=0;
        end
        else
            if(tOut_tvalid & rIn_ready)
                begin
                    tOut_tready <= 1'b1;
                    phase <= tOut_tdata[31:16];
                    radius <= tOut_tdata[15:0];   //Q3 2's comp
                end 
           else begin
                tOut_tready = 1'b0; 
                phase <= 0;
                radius <=0;
           end          
    end
    
//ALL fixed point using Q4 unless otherwise noted

//calc rsq
//s2
reg [31:0] rsq1, ph1, ra1;
always @(posedge clk )
    begin
        if(reset) begin
            rsq1 <= 0;
            ph1 <= 0;
            ra1 <= 0;
        end
        else
            if(tOut_tvalid  & rIn_ready)begin
                rsq1 <= (10 * radius * radius);   //Q6
                ph1 <= phase;
                ra1 <= radius;
            end
    end
    
//s3
reg [31:0] rsq2, ph2, ra2;
always @(posedge clk)
        begin
            if(reset) begin
                rsq2 <= 0;
                ph2 <= 0;
                ra2 <= 0;
            end
            else
                if(tOut_tvalid  & rIn_ready)begin
                    rsq2 <= rsq1 / 32'd522000;	//Q6
                    ph2 <= ph1;
                    ra2 <= ra1;
                end
        end

//s4		
reg [31:0] floor;
reg [31:0] rsq3, ph3, ra3;
always @(posedge clk)
    begin
        if (reset) begin
            floor <= 0;
            rsq3 <= 0;
            ph3 <= 0;
            ra3 <= 0;
        end
        else
            if(tOut_tvalid  & rIn_ready)
            begin
                floor <= {rsq2[31:6], 6'b0};	//Q6
                rsq3 <= rsq2;	//Q6
                ph3 <= ph2;
                ra3 <= ra2;
            end
    end

//s4
reg [31:0] floor2;
reg [31:0] rsq4,  ph4, ra4;
always @(posedge clk)
    begin
        if (reset) begin
            floor2 <= 0;
            rsq4 <= 0;
            ph4 <= 0;
            ra4 <= 0;
        end
        else
            if(tOut_tvalid  & rIn_ready)
            begin
                floor2 <= (floor > 16'd640)? 16'd640 : floor;	//Q6
                rsq4 <= rsq3;	//Q6
                ph4 <= ph3;
                ra4 <= ra3;
            end
    end

//s5
reg [31:0] floor3;
reg [31:0] rsq5, ph5, ra5;
always @(posedge clk)
    begin
        if (reset) begin
            floor3 <= 0;
            rsq5 <= 0;
            ph5 <= 0;
            ra5 <= 0;
        end
        else
            if(tOut_tvalid  & rIn_ready)
            begin
                floor3 <= floor2;	//Q6
                rsq5 <= rsq4;	//Q6
                ph5 <= ph4;
                ra5 <= ra4;
            end
    end

//s6    
reg [31:0] t;
reg [31:0] k, ph6, ra6;
always @(posedge clk)
    begin
        if (reset) begin
            t <= 0;
            k <=0;
            ph6 <= 0;
            ra6 <= 0;
        end
        else
            if(tOut_tvalid  & rIn_ready)
            begin
                t <= rsq5 - floor3; //Q6
                k <= floor3 >> 6;   //Q0
                ph6 <= ph5;
                ra6 <= ra5;
            end
    end
 
//s7 
//find params
reg signed [31:0] m0, m1, p0, p1,  omt;
reg[31:0] ph7, ra7, t2;
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
        if(tOut_tvalid  & rIn_ready) begin
            t2 <= t;    //Q6
            omt <= 16'b1000000 - t;   //2's comp Q6
            ph7 <= ph6;
            ra7 <= ra6;
            case (k)
               //These constants are Q10	2's comp
                    16'd0: begin
                            p0 <= 16'd1024;
                            m0 <= 16'd0-16'd705;
                            p1 <= 16'd954;
                            m1 <= 16'd0-16'd35;
                        end
                    16'd9: begin
                            p0 <= 16'd784;
                            m0 <= 16'd0-16'd11;
                            p1 <= 16'd742;
                            m1 <= 16'd0-16'd21;
                        end
                    16'd10: begin
                            p0 <= 16'd742;
                            m0 <= 16'd0-16'd21;
                            p1 <= 16'd721;
                            m1 <= 16'd0-16'd21;
                        end
                    16'd1: begin
                            p0 <= 16'd988;
                            m0 <= 16'd0-16'd35;
                            p1 <= 16'd954;
                            m1 <= 16'd0-16'd34;
                        end
                    16'd2: begin
                            p0 <= 16'd954;
                            m0 <= 16'd0-16'd34;
                            p1 <= 16'd920;
                            m1 <= 16'd0-16'd32;
                        end
                    16'd3: begin
                            p0 <= 16'd920;
                            m0 <= 16'd0-16'd32;
                            p1 <= 16'd889;
                            m1 <= 16'd0-16'd30;
                        end
                    16'd4: begin
                            p0 <= 16'd889;
                            m0 <= 16'd0-16'd30;
                            p1 <= 16'd860;
                            m1 <= 16'd0-16'd28;
                        end
                    16'd5: begin
                            p0 <= 16'd860;
                            m0 <= 16'd0-16'd28;
                            p1 <= 16'd834;
                            m1 <= 16'd0-16'd26;
                        end
                    16'd6: begin
                            p0 <= 16'd834;
                            m0 <= 16'd0-16'd26;
                            p1 <= 16'd808;
                            m1 <= 16'd0-16'd25;
                        end
                    16'd7: begin
                            p0 <= 16'd808;
                            m0 <= 16'd0-16'd25;
                            p1 <= 16'd784;
                            m1 <= 16'd0-16'd23;
                        end
                    16'd8: begin
                            p0 <= 16'd784;
                            m0 <= 16'd0-16'd23;
                            p1 <= 16'd763;
                            m1 <= 16'd0-16'd21;
                        end
                endcase
             end
    end

	//s8-14
//find res
reg[31:0] ph8, ra8, ph9, ra9, ph10, ra10, ph11, ra11, ph12, ra12, ph13, ph14;
reg [31:0] p0_1, p1_1;
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
		p1_1 <=0;
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
        if(tOut_tvalid  & rIn_ready) begin
            res1 <= 16'b1000000 + (16'd2 * t2);  //Q6
            res1_2 <= (m0 * t2); //Q16
            res1_3 <= (omt * omt) >>> 4;   //Q8
            res1_4 <= 16'b1000000 + (16'd2 * omt); //Q6	//b NOT d
            res1_5 <= (m1 * omt) >>> 2; //Q14
            res1_6 <= (t2 * t2) >>> 4; //Q8
            ph8 <= ph7;
            ra8 <= ra7;
            p0_1 <= p0;
			p1_1 <= p1;
            
            res2 <= (p0_1 * res1);  //Q16   carry p0
            res2_2 <= res1_2; //Q16
            res2_3 <= res1_3; //Q8
            res2_4 <= (res1_4 * p1_1) >>> 2;  //Q14 carry p0
            res2_5 <= res1_5;   //Q14
            res2_6 <= res1_6;    //Q8
            ph9 <= ph8;
            ra9 <= ra8;
            
            res3 <= (res2 + res2_2)>>>6; //Q10
            res3_3 <= res2_3 >>> 2;  //Q6
            res3_4 <= (res2_4 - res2_5) >>> 4;  //Q10
            res3_6 <= res2_6 >>> 2; //Q6
            ph10 <= ph9;
            ra10 <= ra9;
            
            res4 <= res3 * res3_3;   //Q16
            res4_6 <= res3_6 * res3_4;   //Q16
            ph11 <= ph10;
            ra11 <= ra10;
            
            res5 <= (res4 + res4_6)>>>2;   //Q14
            ph12 <= ph11;
            ra12 <= ra11;
            
            rad <= res5 * ra12;    //Q17
            ph13 <= ph12;
            
            rad1 <= rad >>> 13;   //Q4
            ph14 <= ph13;
        end
end

//s15 (rP/C vld)
//Output to rOut_tdata
always @(posedge clk)begin
    if(reset) begin

        rCin_tdata <= 0;
        rPin_tdata <= 0;
    end
    else begin
       if (tOut_tvalid  & rIn_ready) begin
            
            rCin_tdata <= {16'b0, rad1[15:0]};
            rPin_tdata <= ph14;
            end
       else begin
            rCin_tdata <= 0;
			rPin_tdata <= 0;
            end
   end
end

//Send rotate output


assign rOut_tready = mem_ready;

always  @(posedge clk)
    begin
        if (reset) begin
            xOut <= 0;
            yOut <= 0;
            addr_vld <= 0;
            end
        else begin
            if (rOut_tvalid && mem_ready)
                begin
                    xOut <= rOut_tdata[15:4] + 540;//(rOut_tdata[15]) ? 0 : (rOut_tdata[15:4] > 1079) ?  1079 :  rOut_tdata[15:4] ;
                    yOut <= ((rOut_tdata[31:20] * 12'b111111111111)+ 480);//(rOut_tdata[31]) ? 0 : (rOut_tdata[31:20] > 959) ? 959 : rOut_tdata[31:20] ;
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