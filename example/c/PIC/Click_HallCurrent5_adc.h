#include "Click_HallCurrent5_types.h"


void hallcurrent5_adcInit()
{
    //ADC1_Init();	
}

void hallcurrent5_adcSetInputChannel()
{
    //ADC_Set_Input_Channel(_ADC_CHANNEL_4);
}

uint32_t hallcurrent5_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC_Read(0);
	return adcData;
}
