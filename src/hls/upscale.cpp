/**
 * upscale.cpp
 * @author Lukas Hunker
 * Function to upscale 640 x 980 to 1080 x 960
 */

#include "ap_axi_sdata.h"
#define w1 320
#define w2 1080

int line = 0;

void rotatedUpscale(ap_axis<16,2,5,6>vidInput[640], ap_axis<16,2,5,6>vidOutput[2160]){

	ap_int<16> data[1080];

//	int x_ratio = (int)((w1<<16)/w2) +1;
	double x_ratio = w1/(double)w2;
	int prevIndex = -1;
	ap_int<16> prevVal1 = -1;
	ap_int<16> prevVal2 = -1;
	rotatedUpscale_label1:for (int j = 0; j<1080; j++){
		int index;
		if ( j % 2 ==0 ){
			index = (int)(j*x_ratio);
			if (index != prevIndex){
				prevVal1 = vidInput[(2 * index)].data;
			}
			data[j] = prevVal1;
		}
		else{
			if(index != prevIndex){
				prevIndex = index;
				prevVal2 = vidInput[(2 * index) + 1].data;
			}
			data[j] = prevVal2;
		}
//		data[j] = vidInput[index].data;
		vidOutput[j].data = data[j];//vidInput[((j*x_ratio)>>16)].data;
		vidOutput[j].keep = 1;
		vidOutput[j].strb = 1;
		vidOutput[j].user = (line == 0 && j == 0) ? 1 : 0;
		vidOutput[j].last = (j == w2-1) ? 1 : 0;
		vidOutput[j].id = 0;
		vidOutput[j].dest = 1;
		line ++;
	}

	rotatedUpscale_label2:for(int j = 1080; j < 2160; j++){
		vidOutput[j].data = data[j - w2];
		vidOutput[j].keep = 1;
		vidOutput[j].strb = 1;
		vidOutput[j].user = line == 0 ? 1 : 0;
		vidOutput[j].last = (j == 2*w2-1) ? 1 : 0;
		vidOutput[j].id = 0;
		vidOutput[j].dest = 1;
		line++;
	}

	if (line >= 959){
		line = 0;
	}
}
