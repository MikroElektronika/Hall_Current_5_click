#line 1 "D:/Clicks_git/H/Hall_current_5_click/SW/example/c/FT90x/Click_HallCurrent5_FT90x.c"
#line 1 "d:/clicks_git/h/hall_current_5_click/sw/example/c/ft90x/click_hallcurrent5_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/clicks_git/h/hall_current_5_click/sw/example/c/ft90x/click_hallcurrent5_config.h"
#line 1 "d:/clicks_git/h/hall_current_5_click/sw/example/c/ft90x/click_hallcurrent5_types.h"
#line 1 "d:/clicks_git/h/hall_current_5_click/sw/example/c/ft90x/click_hallcurrent5_adc.h"
#line 1 "d:/clicks_git/h/hall_current_5_click/sw/example/c/ft90x/click_hallcurrent5_types.h"
#line 4 "d:/clicks_git/h/hall_current_5_click/sw/example/c/ft90x/click_hallcurrent5_adc.h"
void hallcurrent5_adcInit()
{
 ADC_Init();
}

void hallcurrent5_adcSetInputChannel()
{
 ADC_Set_Input_Channel(_ADC_CHANNEL_4);
}

uint32_t hallcurrent5_adcRead()
{
 uint32_t adcData;

 adcData = ADC_Read(4);
 return adcData;
}
#line 1 "d:/clicks_git/h/hall_current_5_click/sw/library/__hallcurrent5_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stdint.h"
#line 56 "d:/clicks_git/h/hall_current_5_click/sw/library/__hallcurrent5_driver.h"
extern const float _HALLCURRENT5_ADC_RESOLUTION_10bit ;
extern const float _HALLCURRENT5_ADC_RESOLUTION_12bit ;
#line 77 "d:/clicks_git/h/hall_current_5_click/sw/library/__hallcurrent5_driver.h"
void hallcurrent5_gpioDriverInit( const uint8_t*  gpioObj);



void hallcurrent5_setADCResolution(float adcRes);
#line 88 "d:/clicks_git/h/hall_current_5_click/sw/library/__hallcurrent5_driver.h"
float hallcurrent5_getADCVoltage(uint16_t adcValue);
#line 97 "d:/clicks_git/h/hall_current_5_click/sw/library/__hallcurrent5_driver.h"
float hallcurrent5_getCurrent(uint16_t adcValue);
#line 102 "d:/clicks_git/h/hall_current_5_click/sw/library/__hallcurrent5_driver.h"
uint8_t hallcurrent5_getFault();
#line 31 "D:/Clicks_git/H/Hall_current_5_click/SW/example/c/FT90x/Click_HallCurrent5_FT90x.c"
void systemInit()
{
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
 mikrobus_logInit( _LOG_USBUART, 9600 );
 Delay_100ms();
}

void applicationInit()
{

 hallcurrent5_gpioDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO );
 hallcurrent5_setADCResolution(_HALLCURRENT5_ADC_RESOLUTION_12bit);


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
