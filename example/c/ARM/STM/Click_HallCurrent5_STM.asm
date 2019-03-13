_hallcurrent5_adcInit:
;click_hallcurrent5_adc.h,3 :: 		void hallcurrent5_adcInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_hallcurrent5_adc.h,5 :: 		ADC1_Init();
BL	_ADC1_Init+0
;click_hallcurrent5_adc.h,6 :: 		}
L_end_hallcurrent5_adcInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hallcurrent5_adcInit
_hallcurrent5_adcSetInputChannel:
;click_hallcurrent5_adc.h,8 :: 		void hallcurrent5_adcSetInputChannel()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_hallcurrent5_adc.h,10 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_4);
MOVW	R0, #16
BL	_ADC_Set_Input_Channel+0
;click_hallcurrent5_adc.h,11 :: 		}
L_end_hallcurrent5_adcSetInputChannel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hallcurrent5_adcSetInputChannel
_hallcurrent5_adcRead:
;click_hallcurrent5_adc.h,13 :: 		uint16_t hallcurrent5_adcRead()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_hallcurrent5_adc.h,16 :: 		adcData = ADC1_Read(4);
MOVS	R0, #4
BL	_ADC1_Read+0
;click_hallcurrent5_adc.h,17 :: 		return adcData;
;click_hallcurrent5_adc.h,18 :: 		}
L_end_hallcurrent5_adcRead:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hallcurrent5_adcRead
_systemInit:
;Click_HallCurrent5_STM.c,33 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_HallCurrent5_STM.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_HallCurrent5_STM.c,36 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_HallCurrent5_STM.c,37 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
MOVW	R1, #9600
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_HallCurrent5_STM.c,38 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_HallCurrent5_STM.c,39 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_HallCurrent5_STM.c,41 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_HallCurrent5_STM.c,44 :: 		hallcurrent5_gpioDriverInit( (T_HALLCURRENT5_P)&_MIKROBUS1_GPIO );
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_hallcurrent5_gpioDriverInit+0
;Click_HallCurrent5_STM.c,45 :: 		hallcurrent5_setADCResolution(_HALLCURRENT5_ADC_RESOLUTION_12bit);
MOVW	R0, __HALLCURRENT5_ADC_RESOLUTION_12bit
MOVT	R0, __HALLCURRENT5_ADC_RESOLUTION_12bit+2
BL	_hallcurrent5_setADCResolution+0
;Click_HallCurrent5_STM.c,46 :: 		hallcurrent5_setInitVoltage(340);
MOVW	R0, #340
BL	_hallcurrent5_setInitVoltage+0
;Click_HallCurrent5_STM.c,48 :: 		hallcurrent5_adcInit();
BL	_hallcurrent5_adcInit+0
;Click_HallCurrent5_STM.c,49 :: 		hallcurrent5_adcSetInputChannel();
BL	_hallcurrent5_adcSetInputChannel+0
;Click_HallCurrent5_STM.c,50 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_HallCurrent5_STM.c,51 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_HallCurrent5_STM.c,53 :: 		void applicationTask()
SUB	SP, SP, #68
STR	LR, [SP, #0]
;Click_HallCurrent5_STM.c,56 :: 		uint32_t sumADC = 0;
;Click_HallCurrent5_STM.c,61 :: 		sumADC = 0;
; sumADC start address is: 4 (R1)
MOVS	R1, #0
;Click_HallCurrent5_STM.c,62 :: 		for(cnt = 0; cnt < 20; cnt++)
; cnt start address is: 44 (R11)
MOVW	R11, #0
; cnt end address is: 44 (R11)
; sumADC end address is: 4 (R1)
L_applicationTask0:
; cnt start address is: 44 (R11)
; sumADC start address is: 4 (R1)
CMP	R11, #20
IT	CS
BCS	L_applicationTask1
;Click_HallCurrent5_STM.c,64 :: 		sumADC += hallcurrent5_adcRead();
STR	R1, [SP, #4]
BL	_hallcurrent5_adcRead+0
LDR	R1, [SP, #4]
ADDS	R0, R1, R0
; sumADC end address is: 4 (R1)
; sumADC start address is: 8 (R2)
MOV	R2, R0
;Click_HallCurrent5_STM.c,62 :: 		for(cnt = 0; cnt < 20; cnt++)
ADD	R0, R11, #1
; cnt end address is: 44 (R11)
; cnt start address is: 0 (R0)
;Click_HallCurrent5_STM.c,65 :: 		}
MOV	R1, R2
; sumADC end address is: 8 (R2)
; cnt end address is: 0 (R0)
UXTB	R11, R0
IT	AL
BAL	L_applicationTask0
L_applicationTask1:
;Click_HallCurrent5_STM.c,66 :: 		ADC_value = (sumADC / 20);
; sumADC start address is: 4 (R1)
MOVS	R0, #20
UDIV	R0, R1, R0
; sumADC end address is: 4 (R1)
STRH	R0, [SP, #8]
;Click_HallCurrent5_STM.c,68 :: 		current = hallcurrent5_getCurrent(ADC_value/1.8);
BL	__SignedIntegralToFloat+0
MOVW	R2, #26214
MOVT	R2, #16358
BL	__Div_FP+0
BL	__FloatToUnsignedIntegral+0
UXTH	R0, R0
BL	_hallcurrent5_getCurrent+0
STR	R0, [SP, #12]
;Click_HallCurrent5_STM.c,70 :: 		if (current < 0) current = 0;
MOV	R2, #0
BL	__Compare_FP+0
MOVW	R0, #0
BGE	L__applicationTask14
MOVS	R0, #1
L__applicationTask14:
CMP	R0, #0
IT	EQ
BEQ	L_applicationTask3
MOV	R0, #0
STR	R0, [SP, #12]
L_applicationTask3:
;Click_HallCurrent5_STM.c,71 :: 		WordToStr(ADC_value, demoText);
ADD	R0, SP, #16
MOV	R1, R0
LDRSH	R0, [SP, #8]
BL	_WordToStr+0
;Click_HallCurrent5_STM.c,72 :: 		mikrobus_logWrite(" ADC value: ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr1_Click_HallCurrent5_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_HallCurrent5_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_HallCurrent5_STM.c,73 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADD	R0, SP, #16
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_HallCurrent5_STM.c,75 :: 		FloatToStr(current, demoText);
ADD	R0, SP, #16
MOV	R1, R0
LDR	R0, [SP, #12]
BL	_FloatToStr+0
;Click_HallCurrent5_STM.c,76 :: 		mikrobus_logWrite(" Current : ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr2_Click_HallCurrent5_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_HallCurrent5_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_HallCurrent5_STM.c,77 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADD	R0, SP, #16
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_HallCurrent5_STM.c,79 :: 		mikrobus_logWrite("  ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr3_Click_HallCurrent5_STM+0)
MOVT	R0, #hi_addr(?lstr3_Click_HallCurrent5_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_HallCurrent5_STM.c,80 :: 		Delay_ms( 500 );
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_applicationTask4:
SUBS	R7, R7, #1
BNE	L_applicationTask4
NOP
NOP
NOP
;Click_HallCurrent5_STM.c,81 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #68
BX	LR
; end of _applicationTask
_main:
;Click_HallCurrent5_STM.c,83 :: 		void main()
;Click_HallCurrent5_STM.c,85 :: 		systemInit();
BL	_systemInit+0
;Click_HallCurrent5_STM.c,86 :: 		applicationInit();
BL	_applicationInit+0
;Click_HallCurrent5_STM.c,88 :: 		while (1)
L_main6:
;Click_HallCurrent5_STM.c,90 :: 		applicationTask();
BL	_applicationTask+0
;Click_HallCurrent5_STM.c,91 :: 		}
IT	AL
BAL	L_main6
;Click_HallCurrent5_STM.c,92 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
