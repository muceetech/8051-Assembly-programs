	   MOV TMOD,#51H		;Set timer work mode
START: MOV TL1,#00H			
	   MOV TH1,#00H		
	   CLR TF1				;Clear TF0 flag
	   SETB TR1				;Timer1 start run
	   ACALL DELAY
	   CLR TR1
	   
	   MOV A,TH1
	   MOV P1,A
	   
	   MOV A,TL1
	   MOV P2,A	   
	   
	   SJMP START
	   
DELAY: MOV TL0,#0F0H			;Initial timer value
	   MOV TH0,#0D8H		    ;Initial timer value
	   CLR TF0				;Clear TF0 flag
	   SETB TR0				;Timer0 start run
LOOP:  JNB TF0,LOOP 
	   RET
	   END
		   	   