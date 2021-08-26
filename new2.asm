	   ORG 0000
START: MOV P2,#00  // P2.0 =0 (LED off)
	   LCALL DELAY
	   MOV P2,#0FFH // P2.0 =1 (LED ON)
	   LCALL DELAY1
       SJMP START
	   
	   
DELAY: mov r1,#64H 			;10ms*100 = 1000ms = 1SECOND
LOOP:  MOV TMOD,#01H		;Set timer work mode
	   MOV TL0,#00H			;Initial timer value
	   MOV TH0,#0DCH		;Initial timer value
	   CLR TF0				;Clear TF0 flag
	   SETB TR0				;Timer0 start run
	   DJNZ R1,LOOP
	   RET
	   
DELAY1: mov r2,#64H 			;10ms*100 = 1000ms = 1SECOND
LOOP1:  MOV TMOD,#01H		;Set timer work mode
	   MOV TL0,#00H			;Initial timer value
	   MOV TH0,#0CH		;Initial timer value
	   CLR TF0				;Clear TF0 flag
	   SETB TR0				;Timer0 start run
	   DJNZ R2,LOOP1
	   RET
	   END
		   	   