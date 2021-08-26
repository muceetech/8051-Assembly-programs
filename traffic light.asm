// P2.7 RED1
// P2.6 ORANGE1
// P2.5 GREEN1

// P2.4 RED2
// P2.3 ORANGE2
// P2.2 GREEN2

setb P2.7  //SWITCH ON RED1
clr P2.6   // ORANGE 1 OFF
clr P2.5   // GREEN1 ON
clr P2.4   // RED2 OFF
clr P2.3   // ORANGE 2 OFF
setb P2.2  // GREEN 2 ON
acall delay

setb P2.7  // red1 on
clr P2.6
clr P2.5
clr P2.4
SETB P2.3  // orange2 on
clr P2.2
acall delay

clr P2.7
clr P2.6
setb P2.5   // green1 on
setb P2.4   // red 2 on
clr P2.3
clr P2.2
acall delay

clr P2.7
clr P2.6  // orange1 on
setb P2.5   
setb P2.4   // red 2 on
clr P2.3
clr P2.2
acall delay


delay: mov r2, #05h
loop2: mov r0,#0FFh
loop1: mov r1,#0FFh
loop:  djnz r1,loop
	   djnz r0,loop1
	   djnz r2,loop2
	   ret
	   
	   end