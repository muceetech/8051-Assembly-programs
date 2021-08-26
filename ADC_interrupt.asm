      ORG 0000H
	  LJMP MAIN

// main program
	  ORG 0030H	
MAIN: MOV IE,#10000001B 	// Set Ext. interrupt 0 enable
	  CLR TCON.1   // External interrupt is edge triggered
	  CLR P3.5 		// makes WR low
      SETB P3.5     // low to high pulse to WR for starting conversion
	  
      SJMP MAIN 	// jumps back to the MAIN program
	  
// Interrupt vector routine   
	  ORG 0003H     // interrupt vector address of INT0(External interrupt0)
	  MOV P0,#0FFh  // initiates P2 as the input port
	  CLR P3.6 		// high to low pulse to RD for reading the data from ADC
	  MOV A,P0 		// moves the digital data to accumulator
      MOV P1,A 	
	  SETB P3.6
	  RETI
	  
      END