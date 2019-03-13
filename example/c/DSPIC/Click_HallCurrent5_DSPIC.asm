
_hallcurrent5_adcInit:

;click_hallcurrent5_adc.h,4 :: 		void hallcurrent5_adcInit()
;click_hallcurrent5_adc.h,6 :: 		ADC1_Init_Advanced(_ADC_12bit, _ADC_INTERNAL_VREFL | _ADC_INTERNAL_VREFH);
	PUSH	W10
	PUSH	W11
	CLR	W11
	MOV	#1, W10
	CALL	_ADC1_Init_Advanced
;click_hallcurrent5_adc.h,7 :: 		}
L_end_hallcurrent5_adcInit:
	POP	W11
	POP	W10
	RETURN
; end of _hallcurrent5_adcInit

_hallcurrent5_adcSetInputChannel:

;click_hallcurrent5_adc.h,9 :: 		void hallcurrent5_adcSetInputChannel()
;click_hallcurrent5_adc.h,12 :: 		}
L_end_hallcurrent5_adcSetInputChannel:
	RETURN
; end of _hallcurrent5_adcSetInputChannel

_hallcurrent5_adcRead:

;click_hallcurrent5_adc.h,14 :: 		uint32_t hallcurrent5_adcRead()
;click_hallcurrent5_adc.h,18 :: 		adcData = ADC1_Read(8);
	PUSH	W10
	MOV	#8, W10
	CALL	_ADC1_Read
; adcData start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;click_hallcurrent5_adc.h,19 :: 		return adcData;
	MOV.D	W2, W0
; adcData end address is: 4 (W2)
;click_hallcurrent5_adc.h,20 :: 		}
;click_hallcurrent5_adc.h,19 :: 		return adcData;
;click_hallcurrent5_adc.h,20 :: 		}
L_end_hallcurrent5_adcRead:
	POP	W10
	RETURN
; end of _hallcurrent5_adcRead

_systemInit:

;Click_HallCurrent5_DSPIC.c,32 :: 		void systemInit()
;Click_HallCurrent5_DSPIC.c,34 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#1, W12
	MOV.B	#7, W11
	CLR	W10
	CALL	_mikrobus_gpioInit
;Click_HallCurrent5_DSPIC.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
	MOV.B	#1, W12
	CLR	W11
	CLR	W10
	CALL	_mikrobus_gpioInit
;Click_HallCurrent5_DSPIC.c,36 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
	MOV	#9600, W11
	MOV	#0, W12
	MOV.B	#32, W10
	CALL	_mikrobus_logInit
;Click_HallCurrent5_DSPIC.c,37 :: 		Delay_100ms();
	CALL	_Delay_100ms
;Click_HallCurrent5_DSPIC.c,38 :: 		}
L_end_systemInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _systemInit

_applicationInit:

;Click_HallCurrent5_DSPIC.c,40 :: 		void applicationInit()
;Click_HallCurrent5_DSPIC.c,43 :: 		hallcurrent5_gpioDriverInit( (T_HALLCURRENT5_P)&_MIKROBUS1_GPIO );
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(__MIKROBUS1_GPIO), W10
	CALL	_hallcurrent5_gpioDriverInit
;Click_HallCurrent5_DSPIC.c,44 :: 		hallcurrent5_setADCResolution(_HALLCURRENT5_ADC_RESOLUTION_10bit);
	MOV	#__HALLCURRENT5_ADC_RESOLUTION_10bit, W10
	MOV	#__HALLCURRENT5_ADC_RESOLUTION_10bit+2, W11
	CALL	_hallcurrent5_setADCResolution
;Click_HallCurrent5_DSPIC.c,47 :: 		hallcurrent5_adcInit();
	CALL	_hallcurrent5_adcInit
;Click_HallCurrent5_DSPIC.c,48 :: 		hallcurrent5_adcSetInputChannel();
	CALL	_hallcurrent5_adcSetInputChannel
;Click_HallCurrent5_DSPIC.c,49 :: 		Delay_100ms();
	CALL	_Delay_100ms
;Click_HallCurrent5_DSPIC.c,50 :: 		}
L_end_applicationInit:
	POP	W11
	POP	W10
	RETURN
; end of _applicationInit

_applicationTask:
	LNK	#56

;Click_HallCurrent5_DSPIC.c,52 :: 		void applicationTask()
;Click_HallCurrent5_DSPIC.c,55 :: 		uint32_t sumADC = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
;Click_HallCurrent5_DSPIC.c,60 :: 		sumADC = 0;
; sumADC start address is: 4 (W2)
	CLR	W2
	CLR	W3
;Click_HallCurrent5_DSPIC.c,61 :: 		for(cnt = 0; cnt < 20; cnt++)
; cnt start address is: 8 (W4)
	CLR	W4
; cnt end address is: 8 (W4)
; sumADC end address is: 4 (W2)
L_applicationTask0:
; cnt start address is: 8 (W4)
; sumADC start address is: 4 (W2)
	CP.B	W4, #20
	BRA LTU	L__applicationTask14
	GOTO	L_applicationTask1
L__applicationTask14:
;Click_HallCurrent5_DSPIC.c,63 :: 		sumADC += hallcurrent5_adcRead();
	PUSH.D	W2
	CALL	_hallcurrent5_adcRead
	POP.D	W2
; sumADC start address is: 10 (W5)
	ADD	W2, W0, W5
	ADDC	W3, W1, W6
; sumADC end address is: 4 (W2)
;Click_HallCurrent5_DSPIC.c,61 :: 		for(cnt = 0; cnt < 20; cnt++)
; cnt start address is: 0 (W0)
	ADD.B	W4, #1, W0
; cnt end address is: 8 (W4)
;Click_HallCurrent5_DSPIC.c,64 :: 		}
	MOV	W5, W2
	MOV	W6, W3
; sumADC end address is: 10 (W5)
; cnt end address is: 0 (W0)
	MOV.B	W0, W4
	GOTO	L_applicationTask0
L_applicationTask1:
;Click_HallCurrent5_DSPIC.c,65 :: 		ADC_value = (sumADC / 20);
; sumADC start address is: 4 (W2)
	MOV.D	W2, W0
	MOV	#20, W2
	MOV	#0, W3
	CLR	W4
	CALL	__Divide_32x32
; sumADC end address is: 4 (W2)
	MOV	W0, [W14+0]
;Click_HallCurrent5_DSPIC.c,67 :: 		current = hallcurrent5_getCurrent(ADC_value);
	MOV	W0, W10
	CALL	_hallcurrent5_getCurrent
	MOV	W0, [W14+2]
	MOV	W1, [W14+4]
;Click_HallCurrent5_DSPIC.c,69 :: 		if (current < 0) current = 0;
	CLR	W2
	CLR	W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__applicationTask15
	INC.B	W0
L__applicationTask15:
	CP0.B	W0
	BRA NZ	L__applicationTask16
	GOTO	L_applicationTask3
L__applicationTask16:
	CLR	W0
	CLR	W1
	MOV	W0, [W14+2]
	MOV	W1, [W14+4]
L_applicationTask3:
;Click_HallCurrent5_DSPIC.c,70 :: 		WordToStr(ADC_value, demoText);
	ADD	W14, #6, W0
	MOV	W0, W11
	MOV	[W14+0], W10
	CALL	_WordToStr
;Click_HallCurrent5_DSPIC.c,71 :: 		mikrobus_logWrite(" ADC value: ", _LOG_TEXT);
	MOV.B	#1, W11
	MOV	#lo_addr(?lstr1_Click_HallCurrent5_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_HallCurrent5_DSPIC.c,72 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	ADD	W14, #6, W0
	MOV.B	#2, W11
	MOV	W0, W10
	CALL	_mikrobus_logWrite
;Click_HallCurrent5_DSPIC.c,74 :: 		FloatToStr(current, demoText);
	ADD	W14, #6, W0
	MOV	W0, W12
	MOV	[W14+2], W10
	MOV	[W14+4], W11
	CALL	_FloatToStr
;Click_HallCurrent5_DSPIC.c,75 :: 		mikrobus_logWrite(" Current : ", _LOG_TEXT);
	MOV.B	#1, W11
	MOV	#lo_addr(?lstr2_Click_HallCurrent5_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_HallCurrent5_DSPIC.c,76 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	ADD	W14, #6, W0
	MOV.B	#2, W11
	MOV	W0, W10
	CALL	_mikrobus_logWrite
;Click_HallCurrent5_DSPIC.c,78 :: 		mikrobus_logWrite("  ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr3_Click_HallCurrent5_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_HallCurrent5_DSPIC.c,79 :: 		Delay_ms( 500 );
	MOV	#11, W8
	MOV	#11309, W7
L_applicationTask4:
	DEC	W7
	BRA NZ	L_applicationTask4
	DEC	W8
	BRA NZ	L_applicationTask4
;Click_HallCurrent5_DSPIC.c,80 :: 		}
L_end_applicationTask:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _applicationTask

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;Click_HallCurrent5_DSPIC.c,82 :: 		void main()
;Click_HallCurrent5_DSPIC.c,84 :: 		systemInit();
	CALL	_systemInit
;Click_HallCurrent5_DSPIC.c,85 :: 		applicationInit();
	CALL	_applicationInit
;Click_HallCurrent5_DSPIC.c,87 :: 		while (1)
L_main6:
;Click_HallCurrent5_DSPIC.c,89 :: 		applicationTask();
	CALL	_applicationTask
;Click_HallCurrent5_DSPIC.c,90 :: 		}
	GOTO	L_main6
;Click_HallCurrent5_DSPIC.c,91 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
