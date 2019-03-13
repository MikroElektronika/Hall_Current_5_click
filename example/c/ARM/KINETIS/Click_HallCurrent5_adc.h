#include "Click_HallCurrent5_types.h"


void hallcurrent5_adcInit()
{
    ADC0_Init();	
}

void hallcurrent5_adcSetInputChannel()
{
    ADC0_Set_Input_Channel(_ADC_CHANNEL_12);
}

uint32_t hallcurrent5_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC0_Read(12);
	return adcData;
}
