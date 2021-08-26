 //  R1 o1 g1 R2 O2 G2  x x
 //   1  0  0  0  0  1  0  0 
 start:
  mov P2,#10000100b
  acall delay
  
  mov P2,#10001000b
  acall delay
  
  mov P2,#00110000b
  acall delay
  
  mov P2,#01010000b
  acall delay
  
  sjmp start

delay: mov r2, #0Fh
loop2: mov r0,#0FFh
loop1: mov r1,#0FFh
loop:  djnz r1,loop
	   djnz r0,loop1
	   djnz r2,loop2
	   ret
	   
	   end