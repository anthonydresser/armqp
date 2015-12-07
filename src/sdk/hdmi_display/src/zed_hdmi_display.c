//----------------------------------------------------------------
//      _____
//     /     \
//    /____   \____
//   / \===\   \==/
//  /___\===\___\/  AVNET
//       \======/
//        \====/
//---------------------------------------------------------------
//
// This design is the property of Avnet.  Publication of this
// design is not authorized without written consent from Avnet.
//
// Please direct any questions to:  technical.support@avnet.com
//
// Disclaimer:
//    Avnet, Inc. makes no warranty for the use of this code or design.
//    This code is provided  "As Is". Avnet, Inc assumes no responsibility for
//    any errors, which may appear in this code, nor does it make a commitment
//    to update the information contained herein. Avnet, Inc specifically
//    disclaims any implied warranties of fitness for a particular purpose.
//                     Copyright(c) 2014 Avnet, Inc.
//                             All rights reserved.
//
//----------------------------------------------------------------
//
// Create Date:         Oct 24, 2012
// Design Name:         FMC-IMAGEON HDMI Video Frame Buffer
// Module Name:         zed_hdmi_display.c
// Project Name:        FMC-IMAGEON HDMI Video Frame Buffer Program
// Target Devices:      Spartan-6, Virtex-6, Kintex-6
// Hardware Boards:     FMC-IMAGEON
// 
//
// Tool versions:       Vivado 2013.3
//
// Description:         FMC-IMAGEON HDMI Display Controller Program
//                      This application will configure the ADV7611 on the FMC-IMAGEON module
//                      - HDMI Output
//                         - ADV7511 configured for 16 bit YCbCr 4:2:2 mode
//                           with embedded syncs
//                      It will also configure the Video Timing Controller
//                      to generate the video timing.
//
// Dependencies:
//
// Revision:            Feb 26, 2014: 1.00 Initial version
//
//----------------------------------------------------------------

#include <stdio.h>

#include "zed_hdmi_display.h"


#define ADV7511_ADDR   0x72
#define CARRIER_HDMI_OUT_CONFIG_LEN  (40)

int init_hdmi_iic(zed_hdmi_display_t *pDemo);
void print_sucess(int ret, char *s);

Xuint8 carrier_hdmi_out_config[CARRIER_HDMI_OUT_CONFIG_LEN][3] =
{
	{ADV7511_ADDR>>1, 0x15, 0x01}, // Input YCbCr 4:2:2 with seperate syncs
	{ADV7511_ADDR>>1, 0x16, 0x38}, // Output format 444, Input Color Depth = 8
                                   //    R0x16[  7] = Output Video Format = 0 (444)
                                   //    R0x16[5:4] = Input Video Color Depth = 11 (8 bits/color)
                                   //    R0x16[3:2] = Input Video Style = 10 (style 1)
                                   //    R0x16[  1] = DDR Input Edge = 0 (falling edge)
                                   //    R0x16[  0] = Output Color Space = 0 (RGB)
#if 0
    // HDTV YCbCr (16to235) to RGB (0to255)
	{ADV7511_ADDR>>1, 0x18, 0xE7}, // Color Space Conversion
                                   //    R0x18[  7] = CSC enable = 1 (CSC enabled)
                                   //    R0x18[6:5] = CSC Scaling Factor = 11 (+/- 4.0, -16384 - 16380)
                                   //    R0x18[4:0] = CSC coefficient A1[12:8] = 00111
	{ADV7511_ADDR>>1, 0x19, 0x34}, //    R0x19[7:0] = CSC coefficient A1[ 7:0] =      00110100
	{ADV7511_ADDR>>1, 0x1A, 0x04}, //    R0x1A[  5] = CSC coefficient update
                                   //    R0x1A[4:0] = CSC coefficient A2[12:8] = 00100
	{ADV7511_ADDR>>1, 0x1B, 0xAD}, //    R0x1B[7:0] = CSC coefficient A2[ 7:0] =      10101101
	{ADV7511_ADDR>>1, 0x1C, 0x00}, //    R0x1C[4:0] = CSC coefficient A3[12:8] = 00000
	{ADV7511_ADDR>>1, 0x1D, 0x00}, //    R0x1D[7:0] = CSC coefficient A3[ 7:0] =      00000000
	{ADV7511_ADDR>>1, 0x1E, 0x1C}, //    R0x1E[4:0] = CSC coefficient A4[12:8] = 11100
	{ADV7511_ADDR>>1, 0x1F, 0x1B}, //    R0x1F[7:0] = CSC coefficient A4[ 7:0] =      00011011
	{ADV7511_ADDR>>1, 0x20, 0x1D}, //    R0x20[4:0] = CSC coefficient B1[12:8] = 11101
	{ADV7511_ADDR>>1, 0x21, 0xDC}, //    R0x21[7:0] = CSC coefficient B1[ 7:0] =      11011100
	{ADV7511_ADDR>>1, 0x22, 0x04}, //    R0x22[4:0] = CSC coefficient B2[12:8] = 00100
	{ADV7511_ADDR>>1, 0x23, 0xAD}, //    R0x23[7:0] = CSC coefficient B2[ 7:0] =      10101101
	{ADV7511_ADDR>>1, 0x24, 0x1F}, //    R0x24[4:0] = CSC coefficient B3[12:8] = 11111
	{ADV7511_ADDR>>1, 0x25, 0x24}, //    R0x25[7:0] = CSC coefficient B3[ 7:0] =      00100100
	{ADV7511_ADDR>>1, 0x26, 0x01}, //    R0x26[4:0] = CSC coefficient B4[12:8] = 00001
	{ADV7511_ADDR>>1, 0x27, 0x35}, //    R0x27[7:0] = CSC coefficient B4[ 7:0] =      00110101
	{ADV7511_ADDR>>1, 0x28, 0x00}, //    R0x28[4:0] = CSC coefficient C1[12:8] = 00000
	{ADV7511_ADDR>>1, 0x29, 0x00}, //    R0x29[7:0] = CSC coefficient C1[ 7:0] =      00000000
	{ADV7511_ADDR>>1, 0x2A, 0x04}, //    R0x2A[4:0] = CSC coefficient C2[12:8] = 00100
	{ADV7511_ADDR>>1, 0x2B, 0xAD}, //    R0x2B[7:0] = CSC coefficient C2[ 7:0] =      10101101
	{ADV7511_ADDR>>1, 0x2C, 0x08}, //    R0x2C[4:0] = CSC coefficient C3[12:8] = 01000
	{ADV7511_ADDR>>1, 0x2D, 0x7C}, //    R0x2D[7:0] = CSC coefficient C3[ 7:0] =      01111100
	{ADV7511_ADDR>>1, 0x2E, 0x1B}, //    R0x2E[4:0] = CSC coefficient C4[12:8] = 11011
	{ADV7511_ADDR>>1, 0x2F, 0x77}, //    R0x2F[7:0] = CSC coefficient C4[ 7:0] =      01110111
#else
	// HDTV YCbCr (16to235) to RGB (16to235)
	{ADV7511_ADDR>>1, 0x18, 0xAC},
	{ADV7511_ADDR>>1, 0x19, 0x53},
	{ADV7511_ADDR>>1, 0x1A, 0x08},
	{ADV7511_ADDR>>1, 0x1B, 0x00},
	{ADV7511_ADDR>>1, 0x1C, 0x00},
	{ADV7511_ADDR>>1, 0x1D, 0x00},
	{ADV7511_ADDR>>1, 0x1E, 0x19},
	{ADV7511_ADDR>>1, 0x1F, 0xD6},
	{ADV7511_ADDR>>1, 0x20, 0x1C},
	{ADV7511_ADDR>>1, 0x21, 0x56},
	{ADV7511_ADDR>>1, 0x22, 0x08},
	{ADV7511_ADDR>>1, 0x23, 0x00},
	{ADV7511_ADDR>>1, 0x24, 0x1E},
	{ADV7511_ADDR>>1, 0x25, 0x88},
	{ADV7511_ADDR>>1, 0x26, 0x02},
	{ADV7511_ADDR>>1, 0x27, 0x91},
	{ADV7511_ADDR>>1, 0x28, 0x1F},
	{ADV7511_ADDR>>1, 0x29, 0xFF},
	{ADV7511_ADDR>>1, 0x2A, 0x08},
	{ADV7511_ADDR>>1, 0x2B, 0x00},
	{ADV7511_ADDR>>1, 0x2C, 0x0E},
	{ADV7511_ADDR>>1, 0x2D, 0x85},
	{ADV7511_ADDR>>1, 0x2E, 0x18},
	{ADV7511_ADDR>>1, 0x2F, 0xBE},
#endif
	{ADV7511_ADDR>>1, 0x41, 0x10}, // Power down control
                                   //    R0x41[  6] = PowerDown = 0 (power-up)
	{ADV7511_ADDR>>1, 0x48, 0x08}, // Video Input Justification
                                   //    R0x48[8:7] = Video Input Justification = 01 (right justified)
	{ADV7511_ADDR>>1, 0x55, 0x00}, // Set RGB in AVinfo Frame
                                   //    R0x55[6:5] = Output Format = 00 (RGB)
	{ADV7511_ADDR>>1, 0x56, 0x28}, // Aspect Ratio
                                   //    R0x56[5:4] = Picture Aspect Ratio = 10 (16:9)
                                   //    R0x56[3:0] = Active Format Aspect Ratio = 1000 (Same as Aspect Ratio)
	{ADV7511_ADDR>>1, 0x98, 0x03}, // ADI Recommended Write
	{ADV7511_ADDR>>1, 0x9A, 0xE0}, // ADI Recommended Write
	{ADV7511_ADDR>>1, 0x9C, 0x30}, // PLL Filter R1 Value
	{ADV7511_ADDR>>1, 0x9D, 0x61}, // Set clock divide
	{ADV7511_ADDR>>1, 0xA2, 0xA4}, // ADI Recommended Write
	{ADV7511_ADDR>>1, 0xA3, 0xA4}, // ADI Recommended Write
	{ADV7511_ADDR>>1, 0xAF, 0x04}, // HDMI/DVI Modes
                                   //    R0xAF[  7] = HDCP Enable = 0 (HDCP disabled)
                                   //    R0xAF[  4] = Frame Encryption = 0 (Current frame NOT HDCP encrypted)
                                   //    R0xAF[3:2] = 01 (fixed)
                                   //    R0xAF[  1] = HDMI/DVI Mode Select = 0 (DVI Mode)
    //{ADV7511_ADDR>>1, 0xBA, 0x00}, // Programmable delay for input video clock = 000 = -1.2ns
	{ADV7511_ADDR>>1, 0xBA, 0x60}, // Programmable delay for input video clock = 011 = no delay
	{ADV7511_ADDR>>1, 0xE0, 0xD0}, // Must be set to 0xD0 for proper operation
	{ADV7511_ADDR>>1, 0xF9, 0x00}  // Fixed I2C Address (This should be set to a non-conflicting I2C address)
};


int zed_hdmi_display_init( zed_hdmi_display_t *pDemo )
{
	int ret;

	xil_printf("\n\r");
	xil_printf("------------------------------------------------------\n\r");
	xil_printf("--        ZedBoard HDMI Display Controller          --\n\r");
	xil_printf("------------------------------------------------------\n\r");
	xil_printf("\n\r");

	//Initialize HDMI
	init_hdmi_iic(pDemo);

	// Set HDMI output to 1080P60 resolution
	pDemo->hdmio_resolution = VIDEO_RESOLUTION_1080P;
	pDemo->hdmio_width  = 1920;
	pDemo->hdmio_height = 1080;

	// Set VDMA to VGA 640x480p resolution
	pDemo->dma_resolution = VIDEO_RESOLUTION_VGA;
	pDemo->dma_width  = 640;
	pDemo->dma_height = 480;

	// Initialize Left Output Side of AXI VDMA
	xil_printf( "Video Left DMA (Output Side) Initialization ...\n\r" );
	vfb_common_init(
			pDemo->uDeviceId_VDMA_Left,     // uDeviceId
			&(pDemo->vdma_left)                    // pAxiVdma
	);
	vfb_tx_init(
			&(pDemo->vdma_left),                   // pAxiVdma
			&(pDemo->vdmacfg_left_read),           // pReadCfg
			pDemo->dma_resolution,               // uVideoResolution
			pDemo->dma_resolution,               // uStorageResolution
			pDemo->uBaseAddr_MEM_LeftIn,      // uMemAddr
			pDemo->uNumFrames_HdmiDisplay          // uNumFrames
	);
	xil_printf( "Video Left DMA (Output Side) Initialization Success\n\r" );

	//Initialize Left Input Side of AXI VDMA
	xil_printf( "Video Left DMA (Input Side) Initialization ...\n\r" );
	vfb_rx_init(
				&(pDemo->vdma_left),                   // pAxiVdma
				&(pDemo->vdmacfg_left_write),           // pWriteCfg
				pDemo->dma_resolution,               // uVideoResolution
				pDemo->dma_resolution,               // uStorageResolution
				pDemo->uBaseAddr_MEM_LeftIn,      // uMemAddr
				pDemo->uNumFrames_HdmiDisplay          // uNumFrames
		);
	xil_printf( "Video Left DMA (Input Side) Initialization Success\n\r" );


	// Initialize Right Output Side of AXI VDMA
	xil_printf( "Video Right DMA (Output Side) Initialization ...\n\r" );
	vfb_common_init(
			pDemo->uDeviceId_VDMA_Right,     // uDeviceId
			&(pDemo->vdma_right)                    // pAxiVdma
	);
	vfb_tx_init(
			&(pDemo->vdma_right),                   // pAxiVdma
			&(pDemo->vdmacfg_right_read),           // pReadCfg
			pDemo->dma_resolution,               // uVideoResolution
			pDemo->dma_resolution,               // uStorageResolution
			pDemo->uBaseAddr_MEM_RightIn,      // uMemAddr
			pDemo->uNumFrames_HdmiDisplay          // uNumFrames
	);
	xil_printf( "Video Right DMA (Output Side) Initialization Success\n\r" );

	//Initialize Right Input Side of AXI VDMA
	xil_printf( "Video Right DMA (Input Side) Initialization ...\n\r" );
	vfb_rx_init(
				&(pDemo->vdma_right),                   // pAxiVdma
				&(pDemo->vdmacfg_right_write),           // pWriteCfg
				pDemo->dma_resolution,               // uVideoResolution
				pDemo->dma_resolution,               // uStorageResolution
				pDemo->uBaseAddr_MEM_RightIn,      // uMemAddr
				pDemo->uNumFrames_HdmiDisplay          // uNumFrames
		);
	xil_printf( "Video Right DMA (Input Side) Initialization Success\n\r" );

	// Configure VTC on output data path
	xil_printf( "Video Timing Controller (generator) Initialization ...\n\r" );
	vgen_init( &(pDemo->vtc_hdmio_generator), pDemo->uDeviceId_VTC_HdmioGenerator );
	vgen_config( &(pDemo->vtc_hdmio_generator), pDemo->hdmio_resolution, 2 );

	xil_printf( "\n\rLaunching DMA Activity\n\r" );
	vfb_rx_start( &(pDemo->vdma_left) );
	vfb_tx_start( &(pDemo->vdma_left) );
	vfb_dump_registers( &(pDemo->vdma_left) );

	vfb_rx_start( &(pDemo->vdma_right) );
	vfb_tx_start( &(pDemo->vdma_right) );
	vfb_dump_registers( &(pDemo->vdma_right) );


	//Debugging stuff:
	//d: debug
	//i: resend iic
	//1-3: DMA input patterns
	//4-5: DMA ouput patterns
	while (1)
	{
		xil_printf("Please type debug char:");
		ret=inbyte();
		xil_printf("%c\n\r",ret);
		switch (ret){
		case 'd' : //Dump/Error Check
			vfb_dump_registers( &(pDemo->vdma_left) );
			vfb_check_errors( &(pDemo->vdma_left), 1);
			vfb_dump_registers( &(pDemo->vdma_right) );
			vfb_check_errors( &(pDemo->vdma_right), 1);
			break;
		case 'i'://Resend I2C HDMI Config
			xil_printf("Reinitializing Monitor Link\n\r");
			init_hdmi_iic(pDemo);
			break;
		default:
			xil_printf("%c isn't a debug char, dummy!\n\r", ret);
			break;

		}
	}

	return 0;
}
int init_hdmi_iic(zed_hdmi_display_t *pDemo){
	int ret;
	xil_printf( "HDMI IIC Initialization ...\n\r" );
	ret = zed_iic_axi_init(&(pDemo->hdmi_out_iic),"ZED HDMI I2C Controller", pDemo->uBaseAddr_IIC_HdmiOut );
	if ( !ret )
	{
		xil_printf( "ERROR : Failed to initialize IIC driver\n\r" );
		return -1;
	}

	xil_printf( "HDMI Output Initialization ...\n\r" );
	{
		int i;

		for ( i = 0; i < CARRIER_HDMI_OUT_CONFIG_LEN; i++ )
		{
			//xil_printf( "[ZedBoard HDMI] IIC Write - Device = 0x%02X, Address = 0x%02X, Data = 0x%02X\n\r", carrier_hdmi_out_config[i][0]<<1, carrier_hdmi_out_config[i][1], carrier_hdmi_out_config[i][2] );
			pDemo->hdmi_out_iic.fpIicWrite( &(pDemo->hdmi_out_iic), carrier_hdmi_out_config[i][0], carrier_hdmi_out_config[i][1], &(carrier_hdmi_out_config[i][2]), 1 );
		}
	}
	xil_printf( "HDMI Output Initialization Success\n\r" );
	return 0;
}

void print_sucess(int ret, char *s){
	if (ret != XST_SUCCESS)
		{
			xil_printf( "%s initialization failed %d\n\r", s, ret);
		}else{
			xil_printf( "%s initialization success %d\n\r", s, ret);
		}
	return;
}

