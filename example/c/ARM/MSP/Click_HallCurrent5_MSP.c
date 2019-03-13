/*
Example for HallCurrent5 Click

    Date          : dec 2018.
    Author        : Katarina Perendic

Test configuration MSP :
    
    MCU              : MSP432
    Dev. Board       : Clicker 2 for MSP432
    ARM Compiler ver : v6.0.0.0

---

Description :

The application is composed of three sections :

- System Initialization -  Sets AN pin and INT pin as INPUT
- Application Initialization - Initialization driver init and ADC Init
- Application Task - Reads current value in mA and this data logs to USBUART every 500ms.

- Note: Before the start of the program you have to set the starting voltage on AN pin.
        First, measure the voltage in mV on AN pin, when electronic load isn't connected to the Click board, 
        and pass that value as an input parameter of the voltage initialization function.

*/

#include "Click_HallCurrent5_types.h"
#include "Click_HallCurrent5_config.h"
#include "Click_HallCurrent5_adc.h"

  

void systemInit()
{
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
    mikrobus_logInit( _MIKROBUS2, 9600 );
    Delay_100ms();
}

void applicationInit()
{
// CLICK INIT
    hallcurrent5_gpioDriverInit( (T_HALLCURRENT5_P)&_MIKROBUS1_GPIO );
    hallcurrent5_setADCResolution(_HALLCURRENT5_ADC_RESOLUTION_10bit);
    hallcurrent5_setInitVoltage(316);
// ADC INIT
    hallcurrent5_adcInit();
    hallcurrent5_adcSetInputChannel();
    Delay_100ms();
}

void applicationTask()
{
    int16_t ADC_value;
    uint32_t sumADC = 0;
    uint8_t cnt;
    float current;
    char demoText[ 50 ];

    sumADC = 0;
    for(cnt = 0; cnt < 20; cnt++)
    {
        sumADC += hallcurrent5_adcRead();
    }
    ADC_value = (sumADC / 20);

    current = hallcurrent5_getCurrent(ADC_value);

    if (current < 0) current = 0;
    WordToStr(ADC_value, demoText);
    mikrobus_logWrite(" ADC value: ", _LOG_TEXT);
    mikrobus_logWrite(demoText, _LOG_LINE);

    FloatToStr(current, demoText);
    mikrobus_logWrite(" Current : ", _LOG_TEXT);
    mikrobus_logWrite(demoText, _LOG_LINE);

    mikrobus_logWrite("  ", _LOG_LINE);
    Delay_ms( 500 );
}

void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
        applicationTask();
    }
}