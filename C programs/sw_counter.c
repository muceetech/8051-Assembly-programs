#include <reg51.h>

sbit sw = P3^2;
unsigned char count;
void delay();
	
void main()
{
	count = 0;
	P2 = 0x00;  //port 2 is output
	for(;;)    // continuous loop
	{
		if(sw == 0)   // if sw is pressed
		{
			count++;
			P2 = count;
			delay();
		}
	}
}

void delay()
{
	unsigned int val;
	for(val=0;val<32000;val++);
}
