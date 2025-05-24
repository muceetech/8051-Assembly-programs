#include <reg51.H>

int units,tens,hundreds,binval;
void main() 
{
   while(1)
   {
    binval = P1;
    units = binval %10;  //units value
    tens =  binval/10 ;  //
    tens = tens %10;		 // tens digit
    hundreds = binval /100;  //hundreds  digit
    
    P2 = (units & 0x0F) + (tens<<4 & 0xF0);
    P3 = hundreds;
   }
}