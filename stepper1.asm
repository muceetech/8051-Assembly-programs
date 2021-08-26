
_main:
	MOV SP+0, #128
;stepper1.c,3 :: 		void main()
;stepper1.c,5 :: 		P2 = 0x00;
	MOV P2+0, #0
;stepper1.c,6 :: 		while(1)
L_main0:
;stepper1.c,8 :: 		for(i=0;i<8;i++)
	MOV _i+0, #0
	MOV _i+1, #0
L_main2:
	CLR C
	MOV A, _i+0
	SUBB A, #8
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, _i+1
	XRL A, #128
	SUBB A, R0
	JNC L_main3
;stepper1.c,10 :: 		P2 = stepseq[i];
	MOV A, #_stepseq+0
	ADD A, _i+0
	MOV R0, A
	MOV P2+0, @R0
;stepper1.c,11 :: 		delay_ms(300);
	MOV R5, 3
	MOV R6, 72
	MOV R7, 163
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;stepper1.c,8 :: 		for(i=0;i<8;i++)
	MOV A, #1
	ADD A, _i+0
	MOV _i+0, A
	MOV A, #0
	ADDC A, _i+1
	MOV _i+1, A
;stepper1.c,12 :: 		}
	SJMP L_main2
L_main3:
;stepper1.c,13 :: 		}
	SJMP L_main0
;stepper1.c,14 :: 		}
	SJMP #254
; end of _main
