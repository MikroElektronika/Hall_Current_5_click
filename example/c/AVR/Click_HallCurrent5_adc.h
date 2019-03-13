#include "Click_HallCurrent5_types.h"


void hallcurrent5_adcInit()
{
    ADC_Init();        
}

void hallcurrent5_adcSetInputChannel()
{
   
}

uint32_t hallcurrent5_adcRead()
{
    uint32_t adcData;
        
    adcData = ADC_Read(7);
    return adcData;
}