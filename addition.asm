		ORG 0000H
HERE:	MOV R7,#09H
LOOP:	MOV P2,R7
		ACALL DELAY
		DJNZ R7,LOOP
		SJMP HERE
	
	
	
		
DELAY : MOV R0,#0FFH
	L2:	MOV R1,#0FFH
	L1:	DJNZ R1,L1
		DJNZ R0,L2
		RET
		
		END
	