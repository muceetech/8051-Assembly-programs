
_main:
	MOV SP+0, #128
;led_8051.c,1 :: 		void main()
;led_8051.c,3 :: 		while(1) // unending loop
L_main0:
;led_8051.c,5 :: 		P2 = 0x00 ; //Port2 is connected to LED .so initially switch off all leds
	MOV P2+0, #0
;led_8051.c,6 :: 		delay_ms(1000);
	MOV R5, 8
	MOV R6, 1
	MOV R7, 245
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;led_8051.c,7 :: 		P2 = 0xFF ; //Port2 is connected to LED .switch ON all leds
	MOV P2+0, #255
;led_8051.c,8 :: 		delay_ms(1000);
	MOV R5, 8
	MOV R6, 1
	MOV R7, 245
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;led_8051.c,9 :: 		}
	SJMP L_main0
;led_8051.c,10 :: 		}
	SJMP #254
; end of _main
