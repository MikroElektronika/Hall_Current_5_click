![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# HallCurrent5 Click

- **CIC Prefix**  : HALLCURRENT5
- **Author**      : Katarina Perendic
- **Verison**     : 1.0.0
- **Date**        : dec 2018.

---

### Software Support

We provide a library for the HallCurrent5 Click on our [LibStock](https://libstock.mikroe.com/projects/view/2699/hall-current-5-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

This library provides basic functionality for reading the current value and controlling the click board.

Key functions :

- ``` float hallcurrent5_getCurrent(uint16_t adcValue) ``` - Reads current in mA
- ``` float hallcurrent5_getADCVoltage(uint16_t adcValue) ``` - Reads voltage on the AN-pin
- ``` void hallcurrent5_setADCResolution(float adcRes) ``` - Set ADC resolution (10bit or 12bit)

**Examples Description**

The application is composed of three sections :

- System Initialization -  Sets AN pin and INT pin as INPUT
- Application Initialization - Initialization driver init and ADC Init
- Application Task - Reads current value in mA and this data logs to USBUART every 500ms.


```.c
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

    current = hallcurrent5_getCurrent(ADC_value/1.8);

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
```

- Note: Before the start of the program you have to set the starting voltage on AN pin.
        First, measure the voltage in mV on AN pin, when electronic load isn't connected to the Click board, 
        and pass that value as an input parameter of the voltage initialization function.


The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2699/hall-current-5-click) page.

Other mikroE Libraries used in the example:

- ADC
- UART

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
