
start:
clr P3.0
clr P3.1

MOV P2,#7Eh     //to display 0
acall delay

MOV P2,#30h     //to display 1
acall delay

MOV P2,#6Dh     //to display 2
acall delay

MOV P2,#79h     //to display 3
acall delay

MOV P2,#33h     //to display 4
acall delay

MOV P2,#5Bh     //to display 5
acall delay

MOV P2,#5Fh     //to display 6
acall delay

MOV P2,#70h     //to display 7
acall delay

MOV P2,#7Fh     //to display 8
acall delay

MOV P2,#7Bh     //to display 9
acall delay
sjmp start


delay: mov r2, #05h
loop2: mov r0,#0FFh
loop1: mov r1,#0FFh
loop:  djnz r1,loop
	   djnz r0,loop1
	   djnz r2,loop2
	   ret
	
	end