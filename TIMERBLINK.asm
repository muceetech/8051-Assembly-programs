	   MOV TMOD,#10H		;Set timer work mode
START: MOV TL1,#0FCH			
	   MOV TH1,#0FFH		
	   CLR TF1				;Clear TF1 flag
	   SETB TR1				;Timer1 start run
LOOP:  JNB TF1,LOOP
	   CLR TR1
	   SJMP START
	   END