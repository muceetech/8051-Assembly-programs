// Lcd module connections
sbit LCD_RS at P1_2_bit;
sbit LCD_RW at P1_1_bit;
sbit LCD_EN at P1_0_bit;

sbit LCD_D4 at P2_4_bit;
sbit LCD_D5 at P2_5_bit;
sbit LCD_D6 at P2_6_bit;
sbit LCD_D7 at P2_7_bit;
// End Lcd module connections

char txt1[] = "MUCEETECH";
char txt2[] = "8051 DEMO";

char i;

void main(){

  Lcd_Init();                        // Initialize Lcd

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

  Delay_ms(2000);

  while(1)
  {                                  // Endless loop
  Lcd_Out(1,5,txt1);                 // Write text in first row
  
  Lcd_Out(2,5,txt2);                 // Write text in second row
     for(i=0; i<8; i++) {             // Move text to the left 7 times
      Lcd_Cmd(_LCD_SHIFT_LEFT);
      Delay_ms(200);
    }

    for(i=0; i<8; i++) {             // Move text to the right 7 times
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      Delay_ms(200);
    }

  Delay_ms(2000);
  }

}
