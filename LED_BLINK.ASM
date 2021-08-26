start:	SETB P1.7
		ACALL DELAY
		CLR P1.7
		ACALL DELAY
		sjmp start
		
		
delay: mov r2, #05h
loop2: mov r0,#0FFh
loop1: mov r1,#0FFh
loop:  djnz r1,loop
	   djnz r0,loop1
	   djnz r2,loop2
	   ret
	   
	   end