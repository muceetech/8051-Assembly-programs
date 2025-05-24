sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;

sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
sbit SW1 at P1_0_bit;
sbit SW2 at P1_1_bit;
sbit SW3 at P1_2_bit;
sbit SW4 at P1_3_bit;
sbit buzzer at P3_0_bit;
sbit ses at P3_1_bit;

// End LCD module connections

unsigned char sec,mint,hr=1,count;
int tim_min;





void Timer0InterruptHandler() org IVT_ADDR_ET0{


  EA_bit = 0;        // Clear global interrupt enable flag

  
  TR0_bit = 0;       // Stop Timer0
  TH0 = 0x3c;        // Set Timer0 high byte
  TL0 = 0xb0;        // Set Timer0 low byte



  EA_bit = 1;        // Set global interrupt enable flag
  TR0_bit = 1;       // Run Timer0

  count++;


  if(count >19)
  {
         if(SW1 == 0)
         {
           mint++;
           if(mint>59)
           mint = 0;
         }
         if(SW2 == 0)
         {
           hr++;
           if(hr>12){
           hr = 1;
           }
         }
         if(SW3 == 0)
         {
           tim_min++;
          if(tim_min>59)
          tim_min = 0;
         }
         if((hr==12)&&(mint==0)&&(sec == 0))
         ses = ~ses;

         Lcd_Cmd(_LCD_CLEAR);               // Clear display
         Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
         Lcd_Chr_CP((hr/10)+0x30);
         Lcd_Chr_CP((hr%10)+0x30);
         Lcd_Chr_CP(':');
         Lcd_Chr_CP((mint/10)+0x30);
         Lcd_Chr_CP((mint%10)+0x30);
         Lcd_Chr_CP(':');
         Lcd_Chr_CP((sec/10)+0x30);
         Lcd_Chr_CP((sec%10)+0x30);
         Lcd_Chr_CP(' ');
         if(ses == 0)
             Lcd_Chr_CP('A');
         if(ses != 0)
             Lcd_Chr_CP('P');
         Lcd_Chr_CP('M');
         if(SW4 == 0)
         {
         Lcd_Out(2,1,"Timer ON :");
         }
         if(SW4 == 1)
         {
         Lcd_Out(2,1,"Timer OFF:");
         buzzer = 0;
         }
         Lcd_Chr_CP((tim_min/10)+0x30);
         Lcd_Chr_CP((tim_min%10)+0x30);
         Lcd_Out(2,14,"CNT");

         if((SW4 == 0)&&(tim_min == 0))
         {
         buzzer = 1;
         }

   sec++;
   if(sec>59)
   {
    sec = 0;
    mint++;
    tim_min--;
    if(tim_min<0)
       tim_min = 0;
    if(mint>59)
     {
        mint = 0;
        hr++;
     if(hr>12)
     {
         hr = 1;
     }
     }
     }
    count =0;
  }
}


void main() {
  ses  = 0;

  TF0_bit = 0;       // Ensure that Timer0 interrupt flag is cleared
  ET0_bit = 1;       // Enable Timer0 interrupt
  EA_bit  = 1;       // Set global interrupt enable

  GATE0_bit = 0;     // Clear this flag to enable Timer0 whenever TR0 bit is set.
  C_T0_bit  = 0;     // Set Timer operation: Timer0 counts the divided-down systam clock.
  M10_bit   = 0;     // M11_M01 = 01    =>   Mode 1(16-bit Timer/Counter)
  M00_bit   = 1;

  TR0_bit = 0;       // Turn off Timer0
  TH0 = 0x3c;        // Set Timer0 high byte
  TL0 = 0xb0;        // Set Timer0 low byte
  TR0_bit = 1;       // Run Timer0
  Lcd_Init();                        // Initialize LCD





}