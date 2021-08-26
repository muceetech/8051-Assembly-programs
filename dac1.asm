MAIN :MOV P2,#00H
	  ACALL DELAY
   
      MOV P2,#0FFH
      ACALL DELAY
   
      SJMP MAIN
	  
	  
DELAY : MOV R0,#0FH
LOOP: DJNZ R0,LOOP
	  RET 
	  
	  END