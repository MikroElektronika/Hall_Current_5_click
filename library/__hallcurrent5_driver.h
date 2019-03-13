/*
    __hallcurrent5_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __hallcurrent5_driver.h
@brief    HallCurrent5 Driver
@mainpage HallCurrent5 Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   HALLCURRENT5
@brief      HallCurrent5 Click Driver
@{

| Global Library Prefix | **HALLCURRENT5** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **dec 2018.**      |
| Developer             | **Katarina Perendic**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _HALLCURRENT5_H_
#define _HALLCURRENT5_H_

/** 
 * @macro T_HALLCURRENT5_P
 * @brief Driver Abstract type 
 */
#define T_HALLCURRENT5_P    const uint8_t*

/** @defgroup HALLCURRENT5_COMPILE Compilation Config */              /** @{ */

//  #define   __HALLCURRENT5_DRV_SPI__                            /**<     @macro __HALLCURRENT5_DRV_SPI__  @brief SPI driver selector */
//  #define   __HALLCURRENT5_DRV_I2C__                            /**<     @macro __HALLCURRENT5_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __HALLCURRENT5_DRV_UART__                           /**<     @macro __HALLCURRENT5_DRV_UART__ @brief UART driver selector */ 

/** @defgroup HALLCURRENT5_VAR Variables */                           /** @{ */

extern const float _HALLCURRENT5_ADC_RESOLUTION_10bit ;
extern const float _HALLCURRENT5_ADC_RESOLUTION_12bit ;

                                                                       /** @} */                                                                       /** @} */
#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup HALLCURRENT5_INIT Driver Initialization */              /** @{ */

#ifdef   __HALLCURRENT5_DRV_SPI__
void hallcurrent5_spiDriverInit(T_HALLCURRENT5_P gpioObj, T_HALLCURRENT5_P spiObj);
#endif
#ifdef   __HALLCURRENT5_DRV_I2C__
void hallcurrent5_i2cDriverInit(T_HALLCURRENT5_P gpioObj, T_HALLCURRENT5_P i2cObj, uint8_t slave);
#endif
#ifdef   __HALLCURRENT5_DRV_UART__
void hallcurrent5_uartDriverInit(T_HALLCURRENT5_P gpioObj, T_HALLCURRENT5_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void hallcurrent5_gpioDriverInit(T_HALLCURRENT5_P gpioObj);
                                                                       /** @} */
/** @defgroup HALLCURRENT5_FUNC Driver Functions */                   /** @{ */

void hallcurrent5_setADCResolution(float adcRes);
/**
 * @brief Reads voltage on the AN-pin
 *
 * @param[in] adcValue ADC value
 * @return voltage on the AN-pin which depends on the change of ADC
 */
float hallcurrent5_getADCVoltage(uint16_t adcValue);

/**
 * @brief Reads current in mA
 *
 * @param[in] adcValue ADC value
 *
 * @return current value
 */
float hallcurrent5_getCurrent(uint16_t adcValue);

/**
 * @brief Interrupt pin state (Fault state)
 */
uint8_t hallcurrent5_getFault();

/**
 * @brief Sets init Voltage on the AN pin
 *
 * @param[in] voltage    Voltage[mV] on the AN pin without load
 */
void hallcurrent5_setInitVoltage(uint16_t voltage);

                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_HallCurrent5_STM.c
    @example Click_HallCurrent5_TIVA.c
    @example Click_HallCurrent5_CEC.c
    @example Click_HallCurrent5_KINETIS.c
    @example Click_HallCurrent5_MSP.c
    @example Click_HallCurrent5_PIC.c
    @example Click_HallCurrent5_PIC32.c
    @example Click_HallCurrent5_DSPIC.c
    @example Click_HallCurrent5_AVR.c
    @example Click_HallCurrent5_FT90x.c
    @example Click_HallCurrent5_STM.mbas
    @example Click_HallCurrent5_TIVA.mbas
    @example Click_HallCurrent5_CEC.mbas
    @example Click_HallCurrent5_KINETIS.mbas
    @example Click_HallCurrent5_MSP.mbas
    @example Click_HallCurrent5_PIC.mbas
    @example Click_HallCurrent5_PIC32.mbas
    @example Click_HallCurrent5_DSPIC.mbas
    @example Click_HallCurrent5_AVR.mbas
    @example Click_HallCurrent5_FT90x.mbas
    @example Click_HallCurrent5_STM.mpas
    @example Click_HallCurrent5_TIVA.mpas
    @example Click_HallCurrent5_CEC.mpas
    @example Click_HallCurrent5_KINETIS.mpas
    @example Click_HallCurrent5_MSP.mpas
    @example Click_HallCurrent5_PIC.mpas
    @example Click_HallCurrent5_PIC32.mpas
    @example Click_HallCurrent5_DSPIC.mpas
    @example Click_HallCurrent5_AVR.mpas
    @example Click_HallCurrent5_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __hallcurrent5_driver.h

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