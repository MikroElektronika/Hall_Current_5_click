#include "Click_HallCurrent5_types.h"

void hallcurrent5_adcInit()
{
    ADC1_Init();        
}

void hallcurrent5_adcSetInputChannel()
{
    ADC_Set_Input_Channel(_ADC_CHANNEL_4);
}

uint16_t hallcurrent5_adcRead()
{
    uint16_t adcData;
    adcData = ADC1_Read(4);
    return adcData;
}