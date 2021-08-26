	MOV A,#38H // Use 2 lines and 5x7 matrix
	ACALL CMND
	MOV A,#0EH // LCD ON, cursor ON, cursor blinking ON
	ACALL CMND
	MOV A,#01H //Clear screen
	ACALL CMND
	MOV A,#06H //Increment cursor
	ACALL CMND
	MOV A,#82H //Cursor line one , position 2
	ACALL CMND
	MOV A,#3CH //Activate second line
	ACALL CMND
	
	MOV A,#'E'
	ACALL DISP
	MOV A,#'I'
	ACALL DISP
	MOV A,#'E'
	ACALL DISP

	MOV A,#0C1H //Jump to second line, position 1
	ACALL CMND

	MOV A,#'H'
	ACALL DISP
	MOV A,#'I'
	ACALL DISP

HERE: SJMP HERE

CMND: MOV P0,A
	  CLR P3.5  // conect RS PIN to P3.5
	  CLR P3.4  // connect R/w pin to P3.4
	  SETB P3.3 // Enable pin P3.3
	  ACALL DELY
	  CLR P3.3
	  RET

DISP:MOV P0,A
	 SETB P3.5
	 CLR P3.4
	 SETB P3.3
	 ACALL DELY
	 CLR P3.3
	 RET

DELY: mov R0,#0FFh
loop: DJNZ R0,loop
      RET

END