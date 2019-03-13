_hallcurrent5_adcInit:
;click_hallcurrent5_adc.h,4 :: 		void hallcurrent5_adcInit()
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;click_hallcurrent5_adc.h,6 :: 		ADC1_Init();
JAL	_ADC1_Init+0
NOP	
;click_hallcurrent5_adc.h,7 :: 		}
L_end_hallcurrent5_adcInit:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hallcurrent5_adcInit
_hallcurrent5_adcSetInputChannel:
;click_hallcurrent5_adc.h,9 :: 		void hallcurrent5_adcSetInputChannel()
;click_hallcurrent5_adc.h,12 :: 		}
L_end_hallcurrent5_adcSetInputChannel:
JR	RA
NOP	
; end of _hallcurrent5_adcSetInputChannel
_hallcurrent5_adcRead:
;click_hallcurrent5_adc.h,14 :: 		uint32_t hallcurrent5_adcRead()
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;click_hallcurrent5_adc.h,18 :: 		adcData = ADC1_Read(8);
SW	R25, 4(SP)
ORI	R25, R0, 8
JAL	_ADC1_Read+0
NOP	
; adcData start address is: 8 (R2)
ANDI	R2, R2, 65535
;click_hallcurrent5_adc.h,19 :: 		return adcData;
; adcData end address is: 8 (R2)
;click_hallcurrent5_adc.h,20 :: 		}
;click_hallcurrent5_adc.h,19 :: 		return adcData;
;click_hallcurrent5_adc.h,20 :: 		}
L_end_hallcurrent5_adcRead:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _hallcurrent5_adcRead
_systemInit:
;Click_HallCurrent5_PIC32.c,32 :: 		void systemInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Click_HallCurrent5_PIC32.c,34 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 1
ORI	R26, R0, 7
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;Click_HallCurrent5_PIC32.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
ORI	R27, R0, 1
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;Click_HallCurrent5_PIC32.c,36 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
ORI	R26, R0, 9600
ORI	R25, R0, 32
JAL	_mikrobus_logInit+0
NOP	
;Click_HallCurrent5_PIC32.c,37 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;Click_HallCurrent5_PIC32.c,38 :: 		}
L_end_systemInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _systemInit
_applicationInit:
;Click_HallCurrent5_PIC32.c,40 :: 		void applicationInit()
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Click_HallCurrent5_PIC32.c,43 :: 		hallcurrent5_gpioDriverInit( (T_HALLCURRENT5_P)&_MIKROBUS1_GPIO );
SW	R25, 4(SP)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_hallcurrent5_gpioDriverInit+0
NOP	
;Click_HallCurrent5_PIC32.c,44 :: 		hallcurrent5_setADCResolution(_HALLCURRENT5_ADC_RESOLUTION_10bit);
LUI	R25, __HALLCURRENT5_ADC_RESOLUTION_10bit+2
ORI	R25, R25, __HALLCURRENT5_ADC_RESOLUTION_10bit
JAL	_hallcurrent5_setADCResolution+0
NOP	
;Click_HallCurrent5_PIC32.c,47 :: 		hallcurrent5_adcSetInputChannel();
JAL	_hallcurrent5_adcSetInputChannel+0
NOP	
;Click_HallCurrent5_PIC32.c,48 :: 		hallcurrent5_adcInit();
JAL	_hallcurrent5_adcInit+0
NOP	
;Click_HallCurrent5_PIC32.c,49 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;Click_HallCurrent5_PIC32.c,50 :: 		}
L_end_applicationInit:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _applicationInit
_applicationTask:
;Click_HallCurrent5_PIC32.c,52 :: 		void applicationTask()
ADDIU	SP, SP, -76
SW	RA, 0(SP)
;Click_HallCurrent5_PIC32.c,55 :: 		uint32_t sumADC = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;Click_HallCurrent5_PIC32.c,60 :: 		sumADC = 0;
; sumADC start address is: 12 (R3)
MOVZ	R3, R0, R0
;Click_HallCurrent5_PIC32.c,61 :: 		for(cnt = 0; cnt < 20; cnt++)
; cnt start address is: 16 (R4)
MOVZ	R4, R0, R0
; cnt end address is: 16 (R4)
; sumADC end address is: 12 (R3)
L_applicationTask0:
; cnt start address is: 16 (R4)
; sumADC start address is: 12 (R3)
ANDI	R2, R4, 255
SLTIU	R2, R2, 20
BNE	R2, R0, L__applicationTask14
NOP	
J	L_applicationTask1
NOP	
L__applicationTask14:
;Click_HallCurrent5_PIC32.c,63 :: 		sumADC += hallcurrent5_adcRead();
SW	R3, 12(SP)
JAL	_hallcurrent5_adcRead+0
NOP	
LW	R3, 12(SP)
ADDU	R2, R3, R2
; sumADC end address is: 12 (R3)
; sumADC start address is: 20 (R5)
MOVZ	R5, R2, R0
;Click_HallCurrent5_PIC32.c,61 :: 		for(cnt = 0; cnt < 20; cnt++)
ADDIU	R2, R4, 1
; cnt end address is: 16 (R4)
; cnt start address is: 8 (R2)
;Click_HallCurrent5_PIC32.c,64 :: 		}
MOVZ	R3, R5, R0
; sumADC end address is: 20 (R5)
; cnt end address is: 8 (R2)
ANDI	R4, R2, 255
J	L_applicationTask0
NOP	
L_applicationTask1:
;Click_HallCurrent5_PIC32.c,65 :: 		ADC_value = (sumADC / 20);
; sumADC start address is: 12 (R3)
ORI	R2, R0, 20
DIVU	R3, R2
MFLO	R2
; sumADC end address is: 12 (R3)
SH	R2, 16(SP)
;Click_HallCurrent5_PIC32.c,67 :: 		current = hallcurrent5_getCurrent(ADC_value);
SEH	R25, R2
JAL	_hallcurrent5_getCurrent+0
NOP	
SW	R2, 20(SP)
;Click_HallCurrent5_PIC32.c,69 :: 		if (current < 0) current = 0;
MOVZ	R4, R0, R0
MOVZ	R6, R2, R0
JAL	__Compare_FP+0
NOP	
SLT	R2, R0, R2
BNE	R2, R0, L__applicationTask17
NOP	
J	L_applicationTask3
NOP	
L__applicationTask17:
SW	R0, 20(SP)
L_applicationTask3:
;Click_HallCurrent5_PIC32.c,70 :: 		WordToStr(ADC_value, demoText);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LH	R25, 16(SP)
JAL	_WordToStr+0
NOP	
;Click_HallCurrent5_PIC32.c,71 :: 		mikrobus_logWrite(" ADC value: ", _LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr1_Click_HallCurrent5_PIC32+0)
ORI	R25, R25, lo_addr(?lstr1_Click_HallCurrent5_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_HallCurrent5_PIC32.c,72 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADDIU	R2, SP, 24
ORI	R26, R0, 2
MOVZ	R25, R2, R0
JAL	_mikrobus_logWrite+0
NOP	
;Click_HallCurrent5_PIC32.c,74 :: 		FloatToStr(current, demoText);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_FloatToStr+0
NOP	
;Click_HallCurrent5_PIC32.c,75 :: 		mikrobus_logWrite(" Current : ", _LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr2_Click_HallCurrent5_PIC32+0)
ORI	R25, R25, lo_addr(?lstr2_Click_HallCurrent5_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_HallCurrent5_PIC32.c,76 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ADDIU	R2, SP, 24
ORI	R26, R0, 2
MOVZ	R25, R2, R0
JAL	_mikrobus_logWrite+0
NOP	
;Click_HallCurrent5_PIC32.c,78 :: 		mikrobus_logWrite("  ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr3_Click_HallCurrent5_PIC32+0)
ORI	R25, R25, lo_addr(?lstr3_Click_HallCurrent5_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_HallCurrent5_PIC32.c,79 :: 		Delay_ms( 500 );
LUI	R24, 203
ORI	R24, R24, 29524
L_applicationTask4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_applicationTask4
NOP	
NOP	
NOP	
;Click_HallCurrent5_PIC32.c,80 :: 		}
L_end_applicationTask:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _applicationTask
_main:
;Click_HallCurrent5_PIC32.c,82 :: 		void main()
;Click_HallCurrent5_PIC32.c,84 :: 		systemInit();
JAL	_systemInit+0
NOP	
;Click_HallCurrent5_PIC32.c,85 :: 		applicationInit();
JAL	_applicationInit+0
NOP	
;Click_HallCurrent5_PIC32.c,87 :: 		while (1)
L_main6:
;Click_HallCurrent5_PIC32.c,89 :: 		applicationTask();
JAL	_applicationTask+0
NOP	
;Click_HallCurrent5_PIC32.c,90 :: 		}
J	L_main6
NOP	
;Click_HallCurrent5_PIC32.c,91 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
