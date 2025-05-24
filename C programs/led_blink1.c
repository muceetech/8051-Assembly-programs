#include <reg51.h>
unsigned int val;

void main()
{
	for(;;)
	{
	P1 = 0x55; //port 1 = 00h
	for(val=0;val<10000;val++);
	
  P1 = 0xAA; //port 1 = FFh
	for(val=0;val<10000;val++);
	}
}

