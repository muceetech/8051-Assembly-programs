#include <reg51.h>
void delay();

void main()
{
	while(1)
	{
	P1 = 0x00; //port 1 = 00h
	delay();  // call delay function
	
  P1 = 0xFF; //port 1 = FFh
	delay();  // call delay function
	}
}

void delay()
{
	int val;
	for(val=0;val<10000;val++);
}
