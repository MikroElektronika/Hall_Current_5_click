_hallcurrent5_adcInit:
;click_hallcurrent5_adc.h,4 :: 		void hallcurrent5_adcInit()
;click_hallcurrent5_adc.h,6 :: 		ADC_Init();
CALL	_ADC_Init+0
;click_hallcurrent5_adc.h,7 :: 		}
L_end_hallcurrent5_adcInit:
RETURN	
; end of _hallcurrent5_adcInit
_hallcurrent5_adcSetInputChannel:
;click_hallcurrent5_adc.h,9 :: 		void hallcurrent5_adcSetInputChannel()
;click_hallcurrent5_adc.h,11 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_4);
LDK.L	R0, #8
CALL	_ADC_Set_Input_Channel+0
;click_hallcurrent5_adc.h,12 :: 		}
L_end_hallcurrent5_adcSetInputChannel:
RETURN	
; end of _hallcurrent5_adcSetInputChannel
_hallcurrent5_adcRead:
;click_hallcurrent5_adc.h,14 :: 		uint32_t hallcurrent5_adcRead()
;click_hallcurrent5_adc.h,18 :: 		adcData = ADC_Read(4);
LDK.L	R0, #4
CALL	_ADC_Read+0
; adcData start address is: 0 (R0)
;click_hallcurrent5_adc.h,19 :: 		return adcData;
; adcData end address is: 0 (R0)
;click_hallcurrent5_adc.h,20 :: 		}
L_end_hallcurrent5_adcRead:
RETURN	
; end of _hallcurrent5_adcRead
_systemInit:
;Click_HallCurrent5_FT90x.c,31 :: 		void systemInit()
;Click_HallCurrent5_FT90x.c,33 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
LDK.L	R2, #1
LDK.L	R1, #7
LDK.L	R0, #0
CALL	_mikrobus_gpioInit+0
;Click_HallCurrent5_FT90x.c,34 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
LDK.L	R2, #1
LDK.L	R1, #0
LDK.L	R0, #0
CALL	_mikrobus_gpioInit+0
;Click_HallCurrent5_FT90x.c,35 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
LDK.L	R1, #9600
LDK.L	R0, #16
CALL	_mikrobus_logInit+0
;Click_HallCurrent5_FT90x.c,36 :: 		Delay_100ms();
CALL	_Delay_100ms+0
;Click_HallCurrent5_FT90x.c,37 :: 		}
L_end_systemInit:
RETURN	
; end of _systemInit
_applicationInit:
;Click_HallCurrent5_FT90x.c,39 :: 		void applicationInit()
;Click_HallCurrent5_FT90x.c,42 :: 		hallcurrent5_gpioDriverInit( (T_HALLCURRENT5_P)&_MIKROBUS1_GPIO );
LDK.L	R0, #__MIKROBUS1_GPIO+0
CALL	_hallcurrent5_gpioDriverInit+0
;Click_HallCurrent5_FT90x.c,43 :: 		hallcurrent5_setADCResolution(_HALLCURRENT5_ADC_RESOLUTION_12bit);
LDK.L	R0, __HALLCURRENT5_ADC_RESOLUTION_12bit
LDL.L	R0, R0, __HALLCURRENT5_ADC_RESOLUTION_12bit
CALL	_hallcurrent5_setADCResolution+0
;Click_HallCurrent5_FT90x.c,46 :: 		hallcurrent5_adcInit();
CALL	_hallcurrent5_adcInit+0
;Click_HallCurrent5_FT90x.c,47 :: 		hallcurrent5_adcSetInputChannel();
CALL	_hallcurrent5_adcSetInputChannel+0
;Click_HallCurrent5_FT90x.c,48 :: 		Delay_100ms();
CALL	_Delay_100ms+0
;Click_HallCurrent5_FT90x.c,49 :: 		}
L_end_applicationInit:
RETURN	
; end of _applicationInit
_applicationTask:
;Click_HallCurrent5_FT90x.c,51 :: 		void applicationTask()
LINK	LR, #60
;Click_HallCurrent5_FT90x.c,54 :: 		uint32_t sumADC = 0;
;Click_HallCurrent5_FT90x.c,59 :: 		sumADC = 0;
; sumADC start address is: 40 (R10)
LDK.L	R10, #0
;Click_HallCurrent5_FT90x.c,60 :: 		for(cnt = 0; cnt < 20; cnt++)
; cnt start address is: 36 (R9)
LDK.L	R9, #0
; cnt end address is: 36 (R9)
; sumADC end address is: 40 (R10)
L_applicationTask0:
; cnt start address is: 36 (R9)
; sumADC start address is: 40 (R10)
CMP.B	R9, #20
JMPC	R30, C, #0, L_applicationTask1
;Click_HallCurrent5_FT90x.c,62 :: 		sumADC += hallcurrent5_adcRead();
CALL	_hallcurrent5_adcRead+0
ADD.L	R0, R10, R0
; sumADC end address is: 40 (R10)
; sumADC start address is: 4 (R1)
MOVE.L	R1, R0
;Click_HallCurrent5_FT90x.c,60 :: 		for(cnt = 0; cnt < 20; cnt++)
ADD.L	R0, R9, #1
; cnt end address is: 36 (R9)
; cnt start address is: 0 (R0)
;Click_HallCurrent5_FT90x.c,63 :: 		}
MOVE.L	R10, R1
; sumADC end address is: 4 (R1)
; cnt end address is: 0 (R0)
BEXTU.L	R9, R0, #256
JMP	L_applicationTask0
L_applicationTask1:
;Click_HallCurrent5_FT90x.c,64 :: 		ADC_value = (sumADC / 20);
; sumADC start address is: 40 (R10)
UDIV.L	R0, R10, #20
; sumADC end address is: 40 (R10)
STI.S	SP, #0, R0
;Click_HallCurrent5_FT90x.c,66 :: 		current = hallcurrent5_getCurrent(ADC_value);
BEXTU.L	R0, R0, #0
CALL	_hallcurrent5_getCurrent+0
STI.L	SP, #4, R0
;Click_HallCurrent5_FT90x.c,68 :: 		if (current < 0) current = 0;
LDK.L	R6, #0
MOVE.L	R4, R0
CALL	__Compare_FP+0
LDK.L	R0, #0
JMPC	R30, GTE, #1, L__applicationTask14
LDK.L	R0, #1
L__applicationTask14:
CMP.L	R0, #0
JMPC	R30, Z, #1, L_applicationTask3
LDK.L	R0, #0
STI.L	SP, #4, R0
L_applicationTask3:
;Click_HallCurrent5_FT90x.c,69 :: 		WordToStr(ADC_value, demoText);
ADD.L	R1, SP, #8
LDI.S	R0, SP, #0
CALL	_WordToStr+0
;Click_HallCurrent5_FT90x.c,70 :: 		mikrobus_logWrite(" ADC value: ", _LOG_TEXT);
LDK.L	R0, #?lstr1_Click_HallCurrent5_FT90x+0
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_HallCurrent5_FT90x.c,71 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADD.L	R0, SP, #8
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_HallCurrent5_FT90x.c,73 :: 		FloatToStr(current, demoText);
ADD.L	R1, SP, #8
LDI.L	R0, SP, #4
CALL	_FloatToStr+0
;Click_HallCurrent5_FT90x.c,74 :: 		mikrobus_logWrite(" Current : ", _LOG_TEXT);
LDK.L	R0, #?lstr2_Click_HallCurrent5_FT90x+0
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_HallCurrent5_FT90x.c,75 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADD.L	R0, SP, #8
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_HallCurrent5_FT90x.c,77 :: 		mikrobus_logWrite("  ", _LOG_LINE);
LDK.L	R0, #?lstr3_Click_HallCurrent5_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_HallCurrent5_FT90x.c,78 :: 		Delay_ms( 500 );
LPM.L	R28, #16666665
NOP	
L_applicationTask4:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_applicationTask4
JMP	$+8
	#16666665
;Click_HallCurrent5_FT90x.c,79 :: 		}
L_end_applicationTask:
UNLINK	LR
RETURN	
; end of _applicationTask
_main:
;Click_HallCurrent5_FT90x.c,81 :: 		void main()
LDK.L	SP, #43605
;Click_HallCurrent5_FT90x.c,83 :: 		systemInit();
CALL	_systemInit+0
;Click_HallCurrent5_FT90x.c,84 :: 		applicationInit();
CALL	_applicationInit+0
;Click_HallCurrent5_FT90x.c,86 :: 		while (1)
L_main6:
;Click_HallCurrent5_FT90x.c,88 :: 		applicationTask();
CALL	_applicationTask+0
;Click_HallCurrent5_FT90x.c,89 :: 		}
JMP	L_main6
;Click_HallCurrent5_FT90x.c,90 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
