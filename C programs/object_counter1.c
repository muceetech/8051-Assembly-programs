#include <reg51.H>

sbit sw=P1^0;


void delay();

void main()
{
	int count = 0;
	int hundred,tens,ones;
	P3 =0x00;
	P2 =0x00;
	while(1)
	{
	if(sw == 0)
	{
		count++;
		delay();
	}
		hundred = count / 100 ;
		tens = (count / 10)% 10;  
		ones = count % 10 ;
	  P3 = hundred ;
		P2 = tens << 4 | ones;  // shift tens digit by 4 bits to left ,then OR with ones
	}
}

void delay()
{
	int val;
	for(val=0;val<31000;val++);
}
