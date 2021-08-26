
_counter:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;object counter.c,4 :: 		void counter() iv IVT_ADDR_EX0 ilevel 0 ics ICS_AUTO
;object counter.c,6 :: 		count++;
	MOV A, #1
	ADD A, _count+0
	MOV _count+0, A
	MOV A, #0
	ADDC A, _count+1
	MOV _count+1, A
;object counter.c,7 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _counter

_main:
	MOV SP+0, #128
;object counter.c,10 :: 		void main()
;object counter.c,12 :: 		P3 = 0x0F;
	MOV P3+0, #15
;object counter.c,13 :: 		P2 = 0x00;
	MOV P2+0, #0
;object counter.c,14 :: 		IT0_bit =1;
	SETB IT0_bit+0
;object counter.c,15 :: 		EX0_bit = 1;       // Enable external interrupt 0
	SETB EX0_bit+0
;object counter.c,16 :: 		EA_bit  = 1;       // Set global interrupt enable
	SETB EA_bit+0
;object counter.c,18 :: 		while(1)
L_main0:
;object counter.c,20 :: 		P2 = count;
	MOV P2+0, _count+0
;object counter.c,21 :: 		}
	SJMP L_main0
;object counter.c,22 :: 		}
	SJMP #254
; end of _main
