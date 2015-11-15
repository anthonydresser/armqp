/*******************************************************************************
Vendor: Xilinx
Associated Filename: example.cpp
Purpose: AXI stream interface example for Vivado HLS using side channel data
Revision History: February 13, 2012 - initial release

*******************************************************************************
#-  (c) Copyright 2011-2015 Xilinx, Inc. All rights reserved.
#-
#-  This file contains confidential and proprietary information
#-  of Xilinx, Inc. and is protected under U.S. and
#-  international copyright and other intellectual property
#-  laws.
#-
#-  DISCLAIMER
#-  This disclaimer is not a license and does not grant any
#-  rights to the materials distributed herewith. Except as
#-  otherwise provided in a valid license issued to you by
#-  Xilinx, and to the maximum extent permitted by applicable
#-  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#-  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#-  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#-  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#-  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#-  (2) Xilinx shall not be liable (whether in contract or tort,
#-  including negligence, or under any other theory of
#-  liability) for any loss or damage of any kind or nature
#-  related to, arising under or in connection with these
#-  materials, including for any direct, or any indirect,
#-  special, incidental, or consequential loss or damage
#-  (including loss of data, profits, goodwill, or any type of
#-  loss or damage suffered as a result of any action brought
#-  by a third party) even if such damage or loss was
#-  reasonably foreseeable or Xilinx had been advised of the
#-  possibility of the same.
#-
#-  CRITICAL APPLICATIONS
#-  Xilinx products are not designed or intended to be fail-
#-  safe, or for use in any application requiring fail-safe
#-  performance, such as life-support or safety devices or
#-  systems, Class III medical devices, nuclear facilities,
#-  applications related to the deployment of airbags, or any
#-  other applications that could lead to death, personal
#-  injury, or severe property or environmental damage
#-  (individually and collectively, "Critical
#-  Applications"). Customer assumes the sole risk and
#-  liability of any use of Xilinx products in Critical
#-  Applications, subject only to applicable laws and
#-  regulations governing limitations on product liability.
#-
#-  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#-  PART OF THIS FILE AT ALL TIMES.
#- ************************************************************************


This file contains confidential and proprietary information of Xilinx, Inc. and
is protected under U.S. and international copyright and other intellectual
property laws.

DISCLAIMER
This disclaimer is not a license and does not grant any rights to the materials
distributed herewith. Except as otherwise provided in a valid license issued to
you by Xilinx, and to the maximum extent permitted by applicable law:
(1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX
HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR
FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether
in contract or tort, including negligence, or under any other theory of
liability) for any loss or damage of any kind or nature related to, arising under
or in connection with these materials, including for any direct, or any indirect,
special, incidental, or consequential loss or damage (including loss of data,
profits, goodwill, or any type of loss or damage suffered as a result of any
action brought by a third party) even if such damage or loss was reasonably
foreseeable or Xilinx had been advised of the possibility of the same.

CRITICAL APPLICATIONS
Xilinx products are not designed or intended to be fail-safe, or for use in any
application requiring fail-safe performance, such as life-support or safety
devices or systems, Class III medical devices, nuclear facilities, applications
related to the deployment of airbags, or any other applications that could lead
to death, personal injury, or severe property or environmental damage
(individually and collectively, "Critical Applications"). Customer assumes the
sole risk and liability of any use of Xilinx products in Critical Applications,
subject only to applicable laws and regulations governing limitations on product
liability.

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT
ALL TIMES.

*******************************************************************************/
#include "ap_axi_sdata.h"
#define INWIDTH 640
#define INHEIGHT 480
#define OUTWIDTH 1920
#define OUTHEIGHT 1080
int linenum = 0;

void simpleUpscale(ap_axis<16,2,5,6> videoIn[INWIDTH], ap_axis<16,2,5,6> videoOut[OUTWIDTH]){
#pragma HLS INTERFACE axis port=videoIn
#pragma HLS INTERFACE axis port=videoOut

  int i;

  if (linenum < INHEIGHT){
	  for(i = 0; i < INWIDTH; i++){
	      videoOut[i].data = videoIn[i].data;
	      videoOut[i].keep = videoIn[i].keep;
	      videoOut[i].strb = videoIn[i].strb;
	      videoOut[i].user = videoIn[i].user;
	      videoOut[i].last = 0;
	      videoOut[i].id = videoIn[i].id;
	      videoOut[i].dest = videoIn[i].dest;
	    }

	  //Add blank
	  for_horzblank:
	  	  for(; i < OUTWIDTH; i++){
	  		 videoOut[i].data = 0;
	  		 videoOut[i].keep = 1;
	  		 videoOut[i].strb = 1;
	  		 videoOut[i].user = 1;
	  		 videoOut[i].last = i == OUTWIDTH-1 ? 1 : 0;
	  		 videoOut[i].id = 0;
	  		 videoOut[i].dest = 1;
	  	  }
  }else{
	  //Print blanks
	  for_allblank:for (i = 0; i < OUTWIDTH; i++){
		  videoOut[i].data = 0;
		  videoOut[i].keep = 1;
		  videoOut[i].strb = 1;
		  videoOut[i].user = 1;
		  videoOut[i].last = i == OUTWIDTH-1 ? 1 : 0;
		  videoOut[i].id = 0;
		  videoOut[i].dest = 1;
	  }
  }

  //increment linenum
  linenum++;
  if(linenum >= OUTHEIGHT){
	  linenum = 0;
  }
}