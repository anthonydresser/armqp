//
//  median_filter.c
//  
//
//  Created by Anthony Dresser on 11/22/15.
//
//

#include <stdio.h>
#include "xaxivdma_hw.h"
#include "xparameters.h"
#include "xgpio.h"

//#define BEGINREADMEMORY  0 // beginning of frame being read
//#define BEGINWRITEMEMORY	0 //
//#define BEGINWRITEMEMORY  0 // beginning of frame being written
#define VWIDTH	1920 // video width
#define VHEIGHT	1080 // video height
#define APP 2   // addresses per pixel
#define OFFSET  0
#define FRAMEONE	0
#define FRAMETWO	1
#define	FRAMETHREE	2
#define uBaseAddr	0

void free(void *);

unsigned short median(unsigned short (*ptrA)[8], int size);
void swap(unsigned short (*ptrA)[8], int a, int b);

XGpio Gpio;
XGpio Gpio1;

int median_filter(void)
{
    unsigned short *READFRAMEONEADDRESS =  (unsigned short *) *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+0));
    unsigned short *READFRAMETWOADDRESS =  (unsigned short *) *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+4));
    unsigned short *READFRAMETHREEADDRESS = (unsigned short *) *((volatile int *)(uBaseAddr+XAXIVDMA_S2MM_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+8));
    unsigned short *WRITEFRAMEONEADDRESS = (unsigned short *) *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+0));
    unsigned short *WRITEFRAMETWOADDRESS = (unsigned short *) *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+4));
    unsigned short *WRITEFRAMETHREEADDRESS = (unsigned short *) *((volatile int *)(uBaseAddr+XAXIVDMA_MM2S_ADDR_OFFSET+XAXIVDMA_START_ADDR_OFFSET+8));
    unsigned short *ptrRM; // = (unsigned short *) BEGINREADMEMORY;
    unsigned short *ptrWM; // = (unsigned short *) BEGINWRITEMEMORY;
    unsigned short (*ptrA)[8] = malloc(sizeof(unsigned short)*8);
    unsigned short curMedian;
    unsigned char currentFrame = FRAMEONE;
	int Status, i, j;

    Status = XGpio_Initialize(&Gpio, XPAR_GPIO_0_AXI_GPIO_0_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XGpio_Initialize(&Gpio1, XPAR_GPIO_1_AXI_GPIO_0_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XGpio_SetDataDirection(&Gpio, 1, 0xFC0);

	XGpio_SetDataDirection(&Gpio, 2, 0xFC0);

	XGpio_SetDataDirection(&Gpio1, 1, 0xFC0);

	XGpio_SetDataDirection(&Gpio1, 2, 0xFC0);


	while(1){

		XGpio_DiscreteWrite(&Gpio, 1, currentFrame);
		XGpio_DiscreteWrite(&Gpio, 2, currentFrame);

		XGpio_DiscreteWrite(&Gpio1, 1, currentFrame);
		XGpio_DiscreteWrite(&Gpio1, 2, currentFrame);

		switch(currentFrame){
		case FRAMEONE:
			ptrRM = READFRAMEONEADDRESS;
			ptrWM = WRITEFRAMEONEADDRESS;
			break;
		case FRAMETWO:
			ptrRM = READFRAMETWOADDRESS;
			ptrWM = WRITEFRAMETWOADDRESS;
			break;
		case FRAMETHREE:
			ptrRM = READFRAMETHREEADDRESS;
			ptrWM = WRITEFRAMETHREEADDRESS;
			break;
		}

		if(++currentFrame > FRAMETHREE){
			currentFrame = FRAMEONE;
		}

//		for (i = 0; i < VHEIGHT; i++) {
//			for (j = 0; j < VWIDTH; j++) {
//				memset(ptrA, 0, sizeof(unsigned short)*8); // reset holder array
//
//				// top row
//				if(i == 0){
//
//					// top row, left most column, 1
//					if (j == 0) {
//						(*ptrA)[0] = *(ptrRM + APP*((i)*VWIDTH + (j+1)) + OFFSET); // j + 1, i = 2
//						(*ptrA)[1] = *(ptrRM + APP*((i+1)*VWIDTH + (j+1)) + OFFSET); // j+1, i+1 = 9
//						(*ptrA)[2] = *(ptrRM + APP*((i+1)*VWIDTH + j) + OFFSET); // i+1, j = 8
//						curMedian = median(ptrA, 3);
//						*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//
//					// top row, right more column, 3
//					} else if(j == VWIDTH - 1){
//						(*ptrA)[0] = *(ptrRM + APP*((i+1)*VWIDTH + j) + OFFSET); // i+1, j = 4
//						(*ptrA)[1] = *(ptrRM + APP*((i)*VWIDTH + (j-1)) + OFFSET); // j-1, i = 2
//						(*ptrA)[2] = *(ptrRM + APP*((i+1)*VWIDTH + (j-1)) + OFFSET); // j-1, i+1 = 9
//						curMedian = median(ptrA, 3);
//						*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//
//					// top row, but middle columns, 2
//					} else {
//						(*ptrA)[0] = *(ptrRM + APP*((i)*VWIDTH + (j-1)) + OFFSET); // j-1, i = 1
//						(*ptrA)[1] = *(ptrRM + APP*((i)*VWIDTH + (j+1)) + OFFSET); // j+1, i = 3
//						(*ptrA)[2] = *(ptrRM + APP*((i+1)*VWIDTH + (j-1)) + OFFSET); // j-1, i+1 = 8
//						(*ptrA)[3] = *(ptrRM + APP*((i+1)*VWIDTH + j) + OFFSET); // i+1, j = 9
//						(*ptrA)[4] = *(ptrRM + APP*((i+1)*VWIDTH + (j+1)) + OFFSET); // j+1, i+1 = 4
//						curMedian = median(ptrA, 5);
//						*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//					}
//
//				// bottom row
//				} else if(i == VHEIGHT - 1){
//
//					// bottom row, left most column, 7
//					if (j == 0) {
//						(*ptrA)[0] = *(ptrRM + APP*((i-1)*VWIDTH) + OFFSET); // i-1 = 8
//						(*ptrA)[1] = *(ptrRM + APP*((i-1)*VWIDTH + (j+1)) + OFFSET); // j+1, i-1 = 9
//						(*ptrA)[2] = *(ptrRM + APP*(j+1) + OFFSET); // j+1 = 6
//						curMedian = median(ptrA, 3);
//						*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//
//					// bottom row, right most column, 5
//					} else if(j == VWIDTH - 1){
//						(*ptrA)[0] = *(ptrRM + APP*((i-1)*VWIDTH + j) + OFFSET); // i-1, j = 4
//						(*ptrA)[1] = *(ptrRM + APP*((i)*VWIDTH + (j-1)) + OFFSET); // j-1, i = 6
//						(*ptrA)[2] = *(ptrRM + APP*((i-1)*VWIDTH + (j-1)) + OFFSET); // i-1, j-1 = 9
//						curMedian = median(ptrA, 3);
//						*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//
//					// bottom row, but middle column, 6
//					} else {
//						(*ptrA)[0] = *(ptrRM + APP*((i)*VWIDTH + (j-1)) + OFFSET); // j-1, i = 7
//						(*ptrA)[1] = *(ptrRM + APP*((i-1)*VWIDTH + (j-1)) + OFFSET); // i-1, j-1 = 8
//						(*ptrA)[2] = *(ptrRM + APP*((i-1)*VWIDTH + j) + OFFSET); // i-1, j = 9
//						(*ptrA)[3] = *(ptrRM + APP*((i-1)*VWIDTH + (j+1)) + OFFSET); // j+1, i-1 = 4
//						(*ptrA)[4] = *(ptrRM + APP*((i)*VWIDTH + (j+1)) + OFFSET); // j+1, i = 5
//						curMedian = median(ptrA, 5);
//						*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//					}
//
//				//  left most column, but middle rows, 8
//				} else if(j == 0){
//					(*ptrA)[0] = *(ptrRM + APP*((i-1)*VWIDTH + j) + OFFSET); // i-1, j = 1
//					(*ptrA)[1] = *(ptrRM + APP*((i-1)*VWIDTH + (j+1)) + OFFSET); // i-1, j+1 = 2
//					(*ptrA)[2] = *(ptrRM + APP*((i)*VWIDTH + (j+1)) + OFFSET); // i, j+1 = 9
//					(*ptrA)[3] = *(ptrRM + APP*((i+1)*VWIDTH + (j+1)) + OFFSET); // i+1, j+1 = 6
//					(*ptrA)[4] = *(ptrRM + APP*((i+1)*VWIDTH + j) + OFFSET); // i+1, j = 7
//					curMedian = median(ptrA, 5);
//					*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//
//				// right most column, but middle rows, 4
//				} else if(j == VWIDTH - 1){
//					(*ptrA)[0] = *(ptrRM + APP*((i-1)*VWIDTH + j) + OFFSET); // i-1, j = 3
//					(*ptrA)[1] = *(ptrRM + APP*((i-1)*VWIDTH + (j-1)) + OFFSET); // i-1, j-1 = 2
//					(*ptrA)[2] = *(ptrRM + APP*((i)*VWIDTH + (j-1)) + OFFSET); // i, j-1 = 9
//					(*ptrA)[3] = *(ptrRM + APP*((i+1)*VWIDTH + (j-1)) + OFFSET); // i+1, j-1 = 6
//					(*ptrA)[4] = *(ptrRM + APP*((i+1)*VWIDTH + j) + OFFSET); // i+1, j = 5
//					curMedian = median(ptrA, 5);
//					*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//
//				// middle row, middle column 9
//				} else {
//					(*ptrA)[0] = *(ptrRM + APP*((i-1)*VWIDTH + (j-1)) + OFFSET); // i-1, j-1 = 1
//					(*ptrA)[1] = *(ptrRM + APP*((i-1)*VWIDTH + j) + OFFSET); // i-1, j = 2
//					(*ptrA)[2] = *(ptrRM + APP*((i-1)*VWIDTH + (j+1)) + OFFSET); // i-1, j+1 = 3
//					(*ptrA)[3] = *(ptrRM + APP*((i)*VWIDTH + (j+1)) + OFFSET); // i, j+1 = 4
//					(*ptrA)[4] = *(ptrRM + APP*((i+1)*VWIDTH + (j+1)) + OFFSET); // i+1, j+1 = 5
//					(*ptrA)[5] = *(ptrRM + APP*((i+1)*VWIDTH + j) + OFFSET); // i+1, j = 6
//					(*ptrA)[6] = *(ptrRM + APP*((i+1)*VWIDTH + (j-1)) + OFFSET); // i+1, j-1 = 7
//					(*ptrA)[7] = *(ptrRM + APP*((i)*VWIDTH + (j-1)) + OFFSET); // i, j-1 = 8
//					curMedian = median(ptrA, 8);
//					*(ptrWM + APP*(i*VWIDTH + j) + OFFSET) = curMedian;
//				}
//			}
//		}
	}
    free(ptrA);
    return 0;
}

unsigned short median(unsigned short (*ptrA)[8], int size){
    
    int minIndex;
    unsigned short minValue;
    int k = size/2, i, j;
    
    for (i = 0; i < k; i++) {
        minIndex = i;
        minValue = (*ptrA)[i];
        for (j = i+1; j < size; j++) {
            if ((*ptrA)[j] < minValue) {
                minIndex = j;
                minValue = (*ptrA)[j];
            }
        }
        swap(ptrA, i, minIndex);
    }
    
    return (*ptrA)[k];
}

void swap(unsigned short (*ptrA)[8], int a, int b){
    unsigned short temp;
    temp = (*ptrA)[a];
    (*ptrA)[a] = (*ptrA)[b];
    (*ptrA)[b] = temp;
    return;
}
