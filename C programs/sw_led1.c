#include <reg51.h>

sbit led = P2^0;
sbit sw = P1^5;

void main()
{
	for(;;)
	{
		if(sw == 0)
			led = 1;
		else 
			led =0;
	}
}
