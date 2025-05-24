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
	   TMOD=0x10;
	   TL1=0xEF;
	   TH1=0xD8;
	   TF1=0;
     TR1=1;
	   
}
