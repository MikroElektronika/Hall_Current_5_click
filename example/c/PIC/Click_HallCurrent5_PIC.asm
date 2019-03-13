
_hallcurrent5_adcInit:

;click_hallcurrent5_adc.h,4 :: 		void hallcurrent5_adcInit()
;click_hallcurrent5_adc.h,7 :: 		}
L_end_hallcurrent5_adcInit:
	RETURN      0
; end of _hallcurrent5_adcInit

_hallcurrent5_adcSetInputChannel:

;click_hallcurrent5_adc.h,9 :: 		void hallcurrent5_adcSetInputChannel()
;click_hallcurrent5_adc.h,12 :: 		}
L_end_hallcurrent5_adcSetInputChannel:
	RETURN      0
; end of _hallcurrent5_adcSetInputChannel

_hallcurrent5_adcRead:

;click_hallcurrent5_adc.h,14 :: 		uint32_t hallcurrent5_adcRead()
;click_hallcurrent5_adc.h,18 :: 		adcData = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       hallcurrent5_adcRead_adcData_L0+0 
	MOVF        R1, 0 
	MOVWF       hallcurrent5_adcRead_adcData_L0+1 
	MOVLW       0
	MOVWF       hallcurrent5_adcRead_adcData_L0+2 
	MOVWF       hallcurrent5_adcRead_adcData_L0+3 
;click_hallcurrent5_adc.h,19 :: 		return adcData;
	MOVF        hallcurrent5_adcRead_adcData_L0+0, 0 
	MOVWF       R0 
	MOVF        hallcurrent5_adcRead_adcData_L0+1, 0 
	MOVWF       R1 
	MOVF        hallcurrent5_adcRead_adcData_L0+2, 0 
	MOVWF       R2 
	MOVF        hallcurrent5_adcRead_adcData_L0+3, 0 
	MOVWF       R3 
;click_hallcurrent5_adc.h,20 :: 		}
L_end_hallcurrent5_adcRead:
	RETURN      0
; end of _hallcurrent5_adcRead

_systemInit:

;Click_HallCurrent5_PIC.c,31 :: 		void systemInit()
;Click_HallCurrent5_PIC.c,33 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
	CLRF        FARG_mikrobus_gpioInit_bus+0 
	MOVLW       7
	MOVWF       FARG_mikrobus_gpioInit_pin+0 
	MOVLW       1
	MOVWF       FARG_mikrobus_gpioInit_direction+0 
	CALL        _mikrobus_gpioInit+0, 0
;Click_HallCurrent5_PIC.c,34 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_INPUT );
	CLRF        FARG_mikrobus_gpioInit_bus+0 
	CLRF        FARG_mikrobus_gpioInit_pin+0 
	MOVLW       1
	MOVWF       FARG_mikrobus_gpioInit_direction+0 
	CALL        _mikrobus_gpioInit+0, 0
;Click_HallCurrent5_PIC.c,35 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	MOVLW       16
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       128
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       37
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Click_HallCurrent5_PIC.c,36 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;Click_HallCurrent5_PIC.c,37 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_applicationInit:

;Click_HallCurrent5_PIC.c,39 :: 		void applicationInit()
;Click_HallCurrent5_PIC.c,42 :: 		hallcurrent5_gpioDriverInit( (T_HALLCURRENT5_P)&_MIKROBUS1_GPIO );
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_hallcurrent5_gpioDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_hallcurrent5_gpioDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_hallcurrent5_gpioDriverInit_gpioObj+2 
	CALL        _hallcurrent5_gpioDriverInit+0, 0
;Click_HallCurrent5_PIC.c,43 :: 		hallcurrent5_setADCResolution(_HALLCURRENT5_ADC_RESOLUTION_12bit);
	MOVLW       __HALLCURRENT5_ADC_RESOLUTION_12bit
	MOVWF       FARG_hallcurrent5_setADCResolution_adcRes+0 
	MOVLW       __HALLCURRENT5_ADC_RESOLUTION_12bit+1
	MOVWF       FARG_hallcurrent5_setADCResolution_adcRes+1 
	MOVLW       __HALLCURRENT5_ADC_RESOLUTION_12bit+2
	MOVWF       FARG_hallcurrent5_setADCResolution_adcRes+2 
	MOVLW       __HALLCURRENT5_ADC_RESOLUTION_12bit+3
	MOVWF       FARG_hallcurrent5_setADCResolution_adcRes+3 
	CALL        _hallcurrent5_setADCResolution+0, 0
;Click_HallCurrent5_PIC.c,46 :: 		hallcurrent5_adcSetInputChannel();
	CALL        _hallcurrent5_adcSetInputChannel+0, 0
;Click_HallCurrent5_PIC.c,47 :: 		hallcurrent5_adcInit();
	CALL        _hallcurrent5_adcInit+0, 0
;Click_HallCurrent5_PIC.c,48 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;Click_HallCurrent5_PIC.c,49 :: 		}
L_end_applicationInit:
	RETURN      0
; end of _applicationInit

_applicationTask:

;Click_HallCurrent5_PIC.c,51 :: 		void applicationTask()
;Click_HallCurrent5_PIC.c,54 :: 		uint32_t sumADC = 0;
	CLRF        applicationTask_sumADC_L0+0 
	CLRF        applicationTask_sumADC_L0+1 
	CLRF        applicationTask_sumADC_L0+2 
	CLRF        applicationTask_sumADC_L0+3 
;Click_HallCurrent5_PIC.c,59 :: 		sumADC = 0;
	CLRF        applicationTask_sumADC_L0+0 
	CLRF        applicationTask_sumADC_L0+1 
	CLRF        applicationTask_sumADC_L0+2 
	CLRF        applicationTask_sumADC_L0+3 
;Click_HallCurrent5_PIC.c,60 :: 		for(cnt = 0; cnt < 20; cnt++)
	CLRF        applicationTask_cnt_L0+0 
L_applicationTask0:
	MOVLW       20
	SUBWF       applicationTask_cnt_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_applicationTask1
;Click_HallCurrent5_PIC.c,62 :: 		sumADC += hallcurrent5_adcRead();
	CALL        _hallcurrent5_adcRead+0, 0
	MOVF        R0, 0 
	ADDWF       applicationTask_sumADC_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      applicationTask_sumADC_L0+1, 1 
	MOVF        R2, 0 
	ADDWFC      applicationTask_sumADC_L0+2, 1 
	MOVF        R3, 0 
	ADDWFC      applicationTask_sumADC_L0+3, 1 
;Click_HallCurrent5_PIC.c,60 :: 		for(cnt = 0; cnt < 20; cnt++)
	INCF        applicationTask_cnt_L0+0, 1 
;Click_HallCurrent5_PIC.c,63 :: 		}
	GOTO        L_applicationTask0
L_applicationTask1:
;Click_HallCurrent5_PIC.c,64 :: 		ADC_value = (sumADC / 20);
	MOVLW       20
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        applicationTask_sumADC_L0+0, 0 
	MOVWF       R0 
	MOVF        applicationTask_sumADC_L0+1, 0 
	MOVWF       R1 
	MOVF        applicationTask_sumADC_L0+2, 0 
	MOVWF       R2 
	MOVF        applicationTask_sumADC_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       applicationTask_ADC_value_L0+0 
	MOVF        R1, 0 
	MOVWF       applicationTask_ADC_value_L0+1 
;Click_HallCurrent5_PIC.c,66 :: 		current = hallcurrent5_getCurrent(ADC_value);
	MOVF        R0, 0 
	MOVWF       FARG_hallcurrent5_getCurrent_adcValue+0 
	MOVF        R1, 0 
	MOVWF       FARG_hallcurrent5_getCurrent_adcValue+1 
	CALL        _hallcurrent5_getCurrent+0, 0
	MOVF        R0, 0 
	MOVWF       applicationTask_current_L0+0 
	MOVF        R1, 0 
	MOVWF       applicationTask_current_L0+1 
	MOVF        R2, 0 
	MOVWF       applicationTask_current_L0+2 
	MOVF        R3, 0 
	MOVWF       applicationTask_current_L0+3 
;Click_HallCurrent5_PIC.c,68 :: 		if (current < 0) current = 0;
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask3
	CLRF        applicationTask_current_L0+0 
	CLRF        applicationTask_current_L0+1 
	CLRF        applicationTask_current_L0+2 
	CLRF        applicationTask_current_L0+3 
L_applicationTask3:
;Click_HallCurrent5_PIC.c,69 :: 		WordToStr(ADC_value, demoText);
	MOVF        applicationTask_ADC_value_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        applicationTask_ADC_value_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       applicationTask_demoText_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(applicationTask_demoText_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Click_HallCurrent5_PIC.c,70 :: 		mikrobus_logWrite(" ADC value: ", _LOG_TEXT);
	MOVLW       ?lstr1_Click_HallCurrent5_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr1_Click_HallCurrent5_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_HallCurrent5_PIC.c,71 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVLW       applicationTask_demoText_L0+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(applicationTask_demoText_L0+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_HallCurrent5_PIC.c,73 :: 		FloatToStr(current, demoText);
	MOVF        applicationTask_current_L0+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        applicationTask_current_L0+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        applicationTask_current_L0+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        applicationTask_current_L0+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       applicationTask_demoText_L0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(applicationTask_demoText_L0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Click_HallCurrent5_PIC.c,74 :: 		mikrobus_logWrite(" Current : ", _LOG_TEXT);
	MOVLW       ?lstr2_Click_HallCurrent5_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr2_Click_HallCurrent5_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_HallCurrent5_PIC.c,75 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVLW       applicationTask_demoText_L0+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(applicationTask_demoText_L0+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_HallCurrent5_PIC.c,77 :: 		mikrobus_logWrite("  ", _LOG_LINE);
	MOVLW       ?lstr3_Click_HallCurrent5_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr3_Click_HallCurrent5_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_HallCurrent5_PIC.c,78 :: 		Delay_ms( 500 );
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_applicationTask4:
	DECFSZ      R13, 1, 1
	BRA         L_applicationTask4
	DECFSZ      R12, 1, 1
	BRA         L_applicationTask4
	DECFSZ      R11, 1, 1
	BRA         L_applicationTask4
;Click_HallCurrent5_PIC.c,79 :: 		}
L_end_applicationTask:
	RETURN      0
; end of _applicationTask

_main:

;Click_HallCurrent5_PIC.c,81 :: 		void main()
;Click_HallCurrent5_PIC.c,83 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_HallCurrent5_PIC.c,84 :: 		applicationInit();
	CALL        _applicationInit+0, 0
;Click_HallCurrent5_PIC.c,86 :: 		while (1)
L_main5:
;Click_HallCurrent5_PIC.c,88 :: 		applicationTask();
	CALL        _applicationTask+0, 0
;Click_HallCurrent5_PIC.c,89 :: 		}
	GOTO        L_main5
;Click_HallCurrent5_PIC.c,90 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
