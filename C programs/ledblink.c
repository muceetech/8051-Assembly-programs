#include <REG51.H>

void delay();

void main()
{
while(1)
{
 P1 = 0x00;
 delay();
 P1 = 0xFF;
 delay();
}
}

void delay()
{
	int val;
	for(val=0;val<1000;val++)
	{
	TMOD = 0x10;
	TH1 = 0XFC;
	TL1 = 0X17;
	TF1 = 0;
	TR1 = 1;
	}
}

	
