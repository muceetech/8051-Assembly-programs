unsigned int count;


void counter() iv IVT_ADDR_EX0 ilevel 0 ics ICS_AUTO 
{
count++;
}


void main()
{
      P3 = 0x0F;
      P2 = 0x00;
      IT0_bit =1;
      EX0_bit = 1;       // Enable external interrupt 0
      EA_bit  = 1;       // Set global interrupt enable
      
      while(1)
      {
           P2 = count;
      }
}

