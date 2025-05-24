#include <reg51.h>
unsigned int val;
sbit led = P1^0;

void main()
{
	for(;;)
	{
	led = 0;
	for(val=0;val<10000;val++);
	
  led = 1;
	for(val=0;val<10000;val++);
	}
}

