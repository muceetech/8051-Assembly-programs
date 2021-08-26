
_main:
	MOV SP+0, #128
;BINARY2BCD.c,2 :: 		void main()
;BINARY2BCD.c,4 :: 		while(1)
L_main0:
;BINARY2BCD.c,6 :: 		binval = P1;
	MOV _binval+0, P3+0
	CLR A
	MOV _binval+1, A
;BINARY2BCD.c,7 :: 		units = binval %10;
	MOV R4, #10
	MOV R5, #0
	MOV R0, _binval+0
	MOV R1, _binval+1
	LCALL _Div_16x16_S+0
	MOV R0, 4
	MOV R1, 5
	MOV _units+0, 0
	MOV _units+1, 1
;BINARY2BCD.c,8 :: 		tens =  binval/10 ;
	MOV R4, #10
	MOV R5, #0
	MOV R0, _binval+0
	MOV R1, _binval+1
	LCALL _Div_16x16_S+0
	MOV _tens+0, 0
	MOV _tens+1, 1
;BINARY2BCD.c,9 :: 		tens = tens %10;
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_S+0
	MOV R0, 4
	MOV R1, 5
	MOV _tens+0, 0
	MOV _tens+1, 1
;BINARY2BCD.c,10 :: 		hundreds = binval /100;
	MOV R4, #100
	MOV R5, #0
	MOV R0, _binval+0
	MOV R1, _binval+1
	LCALL _Div_16x16_S+0
	MOV _hundreds+0, 0
	MOV _hundreds+1, 1
;BINARY2BCD.c,12 :: 		P2 = (units&0x0F) + (tens<<4 &0xF0);
	MOV A, #15
	ANL A, _units+0
	MOV R4, A
	MOV R2, #4
	MOV A, _tens+0
	INC R2
	SJMP L__main2
L__main3:
	CLR C
	RLC A
L__main2:
	DJNZ R2, L__main3
	MOV R3, A
	MOV R2, #240
	MOV A, R3
	ANL 2, A
	MOV A, R4
	ADD A, R2
	MOV P2+0, A
;BINARY2BCD.c,13 :: 		P3 = hundreds;
	MOV P3+0, 0
;BINARY2BCD.c,14 :: 		}
	LJMP L_main0
;BINARY2BCD.c,15 :: 		}
	SJMP #254
; end of _main
