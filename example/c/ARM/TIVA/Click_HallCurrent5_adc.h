#include "Click_HallCurrent5_types.h"


void hallcurrent5_adcInit()
{
    ADC0_Init();	
}

void hallcurrent5_adcSetInputChannel()
{
    ADC_Set_Input_Channel(_ADC_CHANNEL_9);
}

uint32_t hallcurrent5_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC0_Get_Sample(9);
	return adcData;
}
