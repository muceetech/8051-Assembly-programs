#include <REG51.H>

unsigned char counter = 0;

void ex0_isr (void) interrupt 0
{
	counter++;   // Increment the count
	P2 = counter;
}

void ex1_isr (void) interrupt 2
{
	counter--;   // Increment the count
	P2 = counter;
}

void main (void)
{

IT0 = 1;   // Configure interrupt 0 for falling edge on /INT0 (P3.2)
EX0 = 1;   // Enable EX0 Interrupt
IT1 = 1;   // Configure interrupt 0 for falling edge on /INT0 (P3.2)
EX1 = 1;   // Enable EX0 Interrupt
EA = 1;    // Enable Global Interrupt Flag

while (1)
  {
  }
}



