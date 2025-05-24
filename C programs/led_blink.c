#include <reg51.H>

sbit led=P2^0;

void delay();

void main()
{
	led = 0; //port 1 = 00h
	delay();  // call delay function
	
  led = 1;  //port 1 = FFh
	delay();  // call delay function
}

void delay()
{
	int val;
	for(val=0;val<20000;val++);
}
