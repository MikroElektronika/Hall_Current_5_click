#include "Click_HallCurrent5_types.h"


void hallcurrent5_adcInit()
{
    ADC1_Init();	
}

void hallcurrent5_adcSetInputChannel()
{
    ADC1_Set_Input_Channel(0x01);
}

uint32_t hallcurrent5_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC1_Read(1);
	return adcData;
}
