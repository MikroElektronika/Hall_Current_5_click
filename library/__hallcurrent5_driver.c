/*
    __hallcurrent5_driver.c

-----------------------------------------------------------------------------

  This file is part of mikroSDK.

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

#include "__hallcurrent5_driver.h"
#include "__hallcurrent5_hal.c"

/* ------------------------------------------------------------------- MACROS */



/* ---------------------------------------------------------------- VARIABLES */

#ifdef   __HALLCURRENT5_DRV_I2C__
static uint8_t _slaveAddress;
#endif

static float _resolution = 1023.0;
static uint16_t _initVolt = 316;

/* -------------------------------------------- PRIVATE FUNCTION DECLARATIONS */

const float _HALLCURRENT5_ADC_RESOLUTION_10bit = 1023.0;
const float _HALLCURRENT5_ADC_RESOLUTION_12bit = 4095.0;

/* --------------------------------------------- PRIVATE FUNCTION DEFINITIONS */



/* --------------------------------------------------------- PUBLIC FUNCTIONS */

#ifdef   __HALLCURRENT5_DRV_SPI__

void hallcurrent5_spiDriverInit(T_HALLCURRENT5_P gpioObj, T_HALLCURRENT5_P spiObj)
{
    hal_spiMap( (T_HAL_P)spiObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __HALLCURRENT5_DRV_I2C__

void hallcurrent5_i2cDriverInit(T_HALLCURRENT5_P gpioObj, T_HALLCURRENT5_P i2cObj, uint8_t slave)
{
    _slaveAddress = slave;
    hal_i2cMap( (T_HAL_P)i2cObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __HALLCURRENT5_DRV_UART__

void hallcurrent5_uartDriverInit(T_HALLCURRENT5_P gpioObj, T_HALLCURRENT5_P uartObj)
{
    hal_uartMap( (T_HAL_P)uartObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif

void hallcurrent5_gpioDriverInit(T_HALLCURRENT5_P gpioObj)
{
    hal_gpioMap( (T_HAL_P)gpioObj );
}

/* ----------------------------------------------------------- IMPLEMENTATION */

void hallcurrent5_setADCResolution(float adcRes)
{
    _resolution = adcRes;
}

float hallcurrent5_getADCVoltage(uint16_t adcValue)
{
    float voltage;

    voltage = (float)(adcValue * (float)(3300 / _resolution));
    return voltage;
}

float hallcurrent5_getCurrent(uint16_t adcValue)
{
    float voltage;
    float current;
    
    voltage = (float)(adcValue * (float)(3300 / _resolution));
    current = ((voltage - _initVolt - 12 ) / 66.0) * 1000.0;
    
    return current;
}

uint8_t hallcurrent5_getFault()
{
    return hal_gpio_intGet();
}

void hallcurrent5_setInitVoltage(uint16_t voltage)
{
    _initVolt = voltage;
}

/* -------------------------------------------------------------------------- */
/*
  __hallcurrent5_driver.c

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */