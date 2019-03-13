
_hallcurrent5_adcInit:

;click_hallcurrent5_adc.h,4 :: 		void hallcurrent5_adcInit()
;click_hallcurrent5_adc.h,6 :: 		ADC_Init();
	CALL       _ADC_Init+0
;click_hallcurrent5_adc.h,7 :: 		}
L_end_hallcurrent5_adcInit:
	RET
; end of _hallcurrent5_adcInit

_hallcurrent5_adcSetInputChannel:

;click_hallcurrent5_adc.h,9 :: 		void hallcurrent5_adcSetInputChannel()
;click_hallcurrent5_adc.h,12 :: 		}
L_end_hallcurrent5_adcSetInputChannel:
	RET
; end of _hallcurrent5_adcSetInputChannel

_hallcurrent5_adcRead:

;click_hallcurrent5_adc.h,14 :: 		uint32_t hallcurrent5_adcRead()
;click_hallcurrent5_adc.h,18 :: 		adcData = ADC_Read(7);
	PUSH       R2
	LDI        R27, 7
	MOV        R2, R27
	CALL       _ADC_Read+0
; adcData start address is: 20 (R20)
	MOVW       R20, R16
	LDI        R22, 0
	MOV        R23, R22
;click_hallcurrent5_adc.h,19 :: 		return adcData;
	MOVW       R16, R20
	MOVW       R18, R22
; adcData end address is: 20 (R20)
;click_hallcurrent5_adc.h,20 :: 		}
;click_hallcurrent5_adc.h,19 :: 		return adcData;
;click_hallcurrent5_adc.h,20 :: 		}
L_end_hallcurrent5_adcRead:
	POP        R2
	RET
; end of _hallcurrent5_adcRead

_systemInit:

;Click_HallCurrent5_AVR.c,31 :: 		void systemInit()
;Click_HallCurrent5_AVR.c,33 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	CLR        R4
	LDI        R27, 7
	MOV        R3, R27
	CLR        R2
	CALL       _mikrobus_gpioInit+0
;Click_HallCurrent5_AVR.c,34 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
	CLR        R4
	CLR        R3
	CLR        R2
	CALL       _mikrobus_gpioInit+0
;Click_HallCurrent5_AVR.c,35 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	LDI        R27, 128
	MOV        R3, R27
	LDI        R27, 37
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOV        R6, R27
	LDI        R27, 16
	MOV        R2, R27
	CALL       _mikrobus_logInit+0
;Click_HallCurrent5_AVR.c,36 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;Click_HallCurrent5_AVR.c,37 :: 		}
L_end_systemInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _systemInit

_applicationInit:

;Click_HallCurrent5_AVR.c,39 :: 		void applicationInit()
;Click_HallCurrent5_AVR.c,42 :: 		hallcurrent5_gpioDriverInit( (T_HALLCURRENT5_P)&_MIKROBUS1_GPIO );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, #lo_addr(__MIKROBUS1_GPIO+0)
	MOV        R2, R27
	LDI        R27, hi_addr(__MIKROBUS1_GPIO+0)
	MOV        R3, R27
	CALL       _hallcurrent5_gpioDriverInit+0
;Click_HallCurrent5_AVR.c,43 :: 		hallcurrent5_setADCResolution(_HALLCURRENT5_ADC_RESOLUTION_10bit);
	LDI        R27, __HALLCURRENT5_ADC_RESOLUTION_10bit
	MOV        R2, R27
	LDI        R27, __HALLCURRENT5_ADC_RESOLUTION_10bit+1
	MOV        R3, R27
	LDI        R27, __HALLCURRENT5_ADC_RESOLUTION_10bit+2
	MOV        R4, R27
	LDI        R27, __HALLCURRENT5_ADC_RESOLUTION_10bit+3
	MOV        R5, R27
	CALL       _hallcurrent5_setADCResolution+0
;Click_HallCurrent5_AVR.c,46 :: 		hallcurrent5_adcInit();
	CALL       _hallcurrent5_adcInit+0
;Click_HallCurrent5_AVR.c,47 :: 		hallcurrent5_adcSetInputChannel();
	CALL       _hallcurrent5_adcSetInputChannel+0
;Click_HallCurrent5_AVR.c,48 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;Click_HallCurrent5_AVR.c,49 :: 		}
L_end_applicationInit:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationInit

_applicationTask:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 56
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Click_HallCurrent5_AVR.c,51 :: 		void applicationTask()
;Click_HallCurrent5_AVR.c,54 :: 		uint32_t sumADC = 0;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
;Click_HallCurrent5_AVR.c,59 :: 		sumADC = 0;
; sumADC start address is: 21 (R21)
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	LDI        R24, 0
;Click_HallCurrent5_AVR.c,60 :: 		for(cnt = 0; cnt < 20; cnt++)
; cnt start address is: 20 (R20)
	LDI        R20, 0
; cnt end address is: 20 (R20)
; sumADC end address is: 21 (R21)
L_applicationTask0:
; cnt start address is: 20 (R20)
; sumADC start address is: 21 (R21)
	CPI        R20, 20
	BRLO       L__applicationTask14
	JMP        L_applicationTask1
L__applicationTask14:
;Click_HallCurrent5_AVR.c,62 :: 		sumADC += hallcurrent5_adcRead();
	PUSH       R24
	PUSH       R23
	PUSH       R22
	PUSH       R21
	PUSH       R20
	CALL       _hallcurrent5_adcRead+0
	POP        R20
	POP        R21
	POP        R22
	POP        R23
	POP        R24
	ADD        R16, R21
	ADC        R17, R22
	ADC        R18, R23
	ADC        R19, R24
; sumADC end address is: 21 (R21)
; sumADC start address is: 2 (R2)
	MOVW       R2, R16
	MOVW       R4, R18
;Click_HallCurrent5_AVR.c,60 :: 		for(cnt = 0; cnt < 20; cnt++)
	MOV        R16, R20
	SUBI       R16, 255
; cnt end address is: 20 (R20)
; cnt start address is: 16 (R16)
;Click_HallCurrent5_AVR.c,63 :: 		}
	MOV        R21, R2
	MOV        R22, R3
	MOV        R23, R4
	MOV        R24, R5
; sumADC end address is: 2 (R2)
; cnt end address is: 16 (R16)
	MOV        R20, R16
	JMP        L_applicationTask0
L_applicationTask1:
;Click_HallCurrent5_AVR.c,64 :: 		ADC_value = (sumADC / 20);
; sumADC start address is: 21 (R21)
	MOV        R16, R21
	MOV        R17, R22
	MOV        R18, R23
	MOV        R19, R24
	LDI        R20, 20
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _Div_32x32_U+0
	MOVW       R16, R22
	MOVW       R18, R24
; sumADC end address is: 21 (R21)
	STD        Y+0, R16
	STD        Y+1, R17
;Click_HallCurrent5_AVR.c,66 :: 		current = hallcurrent5_getCurrent(ADC_value);
	MOVW       R2, R16
	CALL       _hallcurrent5_getCurrent+0
	STD        Y+2, R16
	STD        Y+3, R17
	STD        Y+4, R18
	STD        Y+5, R19
;Click_HallCurrent5_AVR.c,68 :: 		if (current < 0) current = 0;
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _float_op_less+0
	OR         R0, R0
	LDI        R27, 0
	BREQ       L__applicationTask15
	LDI        R27, 1
L__applicationTask15:
	MOV        R16, R27
	TST        R16
	BRNE       L__applicationTask16
	JMP        L_applicationTask3
L__applicationTask16:
	LDI        R27, 0
	STD        Y+2, R27
	STD        Y+3, R27
	STD        Y+4, R27
	STD        Y+5, R27
L_applicationTask3:
;Click_HallCurrent5_AVR.c,69 :: 		WordToStr(ADC_value, demoText);
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R4, R16
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _WordToStr+0
;Click_HallCurrent5_AVR.c,70 :: 		mikrobus_logWrite(" ADC value: ", _LOG_TEXT);
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr1_Click_HallCurrent5_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_Click_HallCurrent5_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_HallCurrent5_AVR.c,71 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	LDI        R27, 2
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _mikrobus_logWrite+0
;Click_HallCurrent5_AVR.c,73 :: 		FloatToStr(current, demoText);
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	MOVW       R6, R16
	LDD        R2, Y+2
	LDD        R3, Y+3
	LDD        R4, Y+4
	LDD        R5, Y+5
	CALL       _FloatToStr+0
;Click_HallCurrent5_AVR.c,74 :: 		mikrobus_logWrite(" Current : ", _LOG_TEXT);
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr2_Click_HallCurrent5_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_Click_HallCurrent5_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_HallCurrent5_AVR.c,75 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVW       R16, R28
	SUBI       R16, 250
	SBCI       R17, 255
	LDI        R27, 2
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _mikrobus_logWrite+0
;Click_HallCurrent5_AVR.c,77 :: 		mikrobus_logWrite("  ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr3_Click_HallCurrent5_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_Click_HallCurrent5_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_HallCurrent5_AVR.c,78 :: 		Delay_ms( 500 );
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_applicationTask4:
	DEC        R16
	BRNE       L_applicationTask4
	DEC        R17
	BRNE       L_applicationTask4
	DEC        R18
	BRNE       L_applicationTask4
	NOP
;Click_HallCurrent5_AVR.c,79 :: 		}
L_end_applicationTask:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 55
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _applicationTask

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Click_HallCurrent5_AVR.c,81 :: 		void main()
;Click_HallCurrent5_AVR.c,83 :: 		systemInit();
	CALL       _systemInit+0
;Click_HallCurrent5_AVR.c,84 :: 		applicationInit();
	CALL       _applicationInit+0
;Click_HallCurrent5_AVR.c,86 :: 		while (1)
L_main6:
;Click_HallCurrent5_AVR.c,88 :: 		applicationTask();
	CALL       _applicationTask+0
;Click_HallCurrent5_AVR.c,89 :: 		}
	JMP        L_main6
;Click_HallCurrent5_AVR.c,90 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
