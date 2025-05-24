void main() 
{
        while(1) // unending loop
        {
           P2 = 0x00 ; //Port2 is connected to LED .so initially switch off all leds
           delay_ms(1000);
           P2 = 0xFF ; //Port2 is connected to LED .switch ON all leds
           delay_ms(1000);
        }
}