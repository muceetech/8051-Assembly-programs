
_main:
	MOV SP+0, #128
;ledblink.c,1 :: 		void main()
;ledblink.c,3 :: 		while(1)
L_main0:
;ledblink.c,5 :: 		P0 = 0x00;
	MOV P0+0, #0
;ledblink.c,6 :: 		delay_ms(1000);
	MOV R5, 8
	MOV R6, 154
	MOV R7, 124
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;ledblink.c,7 :: 		P0 = 0xFF;
	MOV P0+0, #255
;ledblink.c,8 :: 		delay_ms(1000);
	MOV R5, 8
	MOV R6, 154
	MOV R7, 124
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;ledblink.c,9 :: 		}
	SJMP L_main0
;ledblink.c,10 :: 		}
	SJMP #254
; end of _main
