#include <reg51.H>

sbit led=P2^0;
sbit sw=P1^5;

void delay();

void main()
{
	led = 0;
	while(1)
	{
	if(sw == 0)
	{
		led =1;
		delay();
		led=0;
	}
	}
}

void delay()
{
	int val;
	for(val=0;val<1000;val++);
}
