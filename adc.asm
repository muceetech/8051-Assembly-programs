	
      MOV P0,#0FFh  // initiates P2 as the input port
MAIN: SETB P3.6 	// makes RD high
      CLR P3.5 		// makes WR low
      SETB P3.5 	// low to high pulse to WR for starting conversion
WAIT: JB P3.4,WAIT 	// polls until INTR=0
      CLR P3.6 		// high to low pulse to RD for reading the data from ADC
	  SETB P3.6
      MOV A,P0 		// moves the digital data to accumulator
      MOV P1,A 		// outputs the data to P0 for the LEDs
      SJMP MAIN 	// jumps back to the MAIN program
      END