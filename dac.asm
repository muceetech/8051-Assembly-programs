
_square:
;dac.c,10 :: 		void square()
;dac.c,12 :: 		P2 = 0x00;
	MOV P2+0, #0
;dac.c,13 :: 		delay_ms(10);
	MOV R6, 20
	MOV R7, 115
	DJNZ R7, 
	DJNZ R6, 
;dac.c,14 :: 		P2 = 0xFF;
	MOV P2+0, #255
;dac.c,15 :: 		delay_ms(10);
	MOV R6, 20
	MOV R7, 115
	DJNZ R7, 
	DJNZ R6, 
;dac.c,16 :: 		}
	RET
; end of _square

_sawtooth:
;dac.c,18 :: 		void sawtooth()
;dac.c,20 :: 		count++;
	MOV A, #1
	ADD A, _count+0
	MOV _count+0, A
	MOV A, #0
	ADDC A, _count+1
	MOV _count+1, A
;dac.c,21 :: 		P2= count;
	MOV P2+0, _count+0
;dac.c,22 :: 		delay_ms(1);
	MOV R6, 2
	MOV R7, 241
	DJNZ R7, 
	DJNZ R6, 
;dac.c,23 :: 		}
	RET
; end of _sawtooth

_sine:
;dac.c,25 :: 		void sine()
;dac.c,27 :: 		for (i=0;i<50;i++)
	MOV _i+0, #0
	MOV _i+1, #0
L_sine0:
	CLR C
	MOV A, _i+0
	SUBB A, #50
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, _i+1
	XRL A, #128
	SUBB A, R0
	JNC L_sine1
;dac.c,29 :: 		P2 = sinedata[i];
	MOV A, #_sinedata+0
	ADD A, _i+0
	MOV R0, A
	MOV P2+0, @R0
;dac.c,27 :: 		for (i=0;i<50;i++)
	MOV A, #1
	ADD A, _i+0
	MOV _i+0, A
	MOV A, #0
	ADDC A, _i+1
	MOV _i+1, A
;dac.c,30 :: 		}
	SJMP L_sine0
L_sine1:
;dac.c,31 :: 		}
	RET
; end of _sine

_main:
	MOV SP+0, #128
;dac.c,33 :: 		void main()
;dac.c,36 :: 		P2 = 0x00;
	MOV P2+0, #0
;dac.c,37 :: 		while(1)
L_main3:
;dac.c,39 :: 		sine();
	LCALL _sine+0
;dac.c,41 :: 		}
	SJMP L_main3
;dac.c,42 :: 		}
	SJMP #254
; end of _main
