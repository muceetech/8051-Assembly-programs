	
start:MOV P2,#30h     //to display 1
	clr P3.1
	setb P3.0
	acall delay
	
	MOV P2,#6Dh     //to display 2
	setb P3.1
	clr P3.0
	acall delay
	
	sjmp start
	
	
delay: mov r0,#01h
loop1: mov r1,#05h
loop:  djnz r1,loop
	   djnz r0,loop1
	   ret
	
	end