      MOV P0,#0FFh  // initiates P2 as the input port

MAIN: SETB P3.7 	// makes RD high
      CLR P3.6 		// makes WR low
      
	    SETB P3.6 	// low to high pulse to WR for starting conversion

WAIT: JB P3.4,WAIT 	// polls until INTR=0
      
	    CLR P3.7 		// high to low pulse to RD for reading the data from ADC
	    SETB P3.7
      
	    MOV A,P0 		// moves the digital data to accumulator
	    ACALL CONVERT
	    MOV P1,R0
      MOV P2,R1 		// outputs the data to P0 for the LEDs
      SJMP MAIN 	// jumps back to the MAIN program
	  
	     
CONVERT: MOV B,#100
         DIV AB		// Divide ADC value by 100 to get the hundreds digit
		     MOV R0,A   // move 100s digit to R0 regsiter
		     MOV A,B    // move remainder to A
		 
		     MOV B,#10  // Divider is 10 
		     DIV AB     // Divide the remainder by 10
		     SWAP A     // Swap lower and higher nibbles in Accumulator
		     ADD A,B    // Add A and B to get the combined 10s and unit digit
		     MOV R1,A   // move the 10s and 1s digits to R1 register
		     RET

		     END
