#include "Click_HallCurrent5_types.h"


void hallcurrent5_adcInit()
{
    ADC1_Init_Advanced(_ADC_12bit, _ADC_INTERNAL_VREFL | _ADC_INTERNAL_VREFH);	
}

void hallcurrent5_adcSetInputChannel()
{
    
}

uint32_t hallcurrent5_adcRead()
{
	uint32_t adcData;
	
    adcData = ADC1_Read(8);
	return adcData;
}
