
_main:
	MOV SP+0, #128
;8051_ex1.c,17 :: 		void main(){
;8051_ex1.c,19 :: 		Lcd_Init();                        // Initialize Lcd
	LCALL _Lcd_Init+0
;8051_ex1.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;8051_ex1.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;8051_ex1.c,24 :: 		Delay_ms(2000);
	MOV R5, 16
	MOV R6, 51
	MOV R7, 251
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;8051_ex1.c,26 :: 		while(1)
L_main0:
;8051_ex1.c,28 :: 		Lcd_Out(1,5,txt1);                 // Write text in first row
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #5
	MOV FARG_LCD_Out_text+0, #_txt1+0
	LCALL _LCD_Out+0
;8051_ex1.c,30 :: 		Lcd_Out(2,5,txt2);                 // Write text in second row
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #5
	MOV FARG_LCD_Out_text+0, #_txt2+0
	LCALL _LCD_Out+0
;8051_ex1.c,31 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	MOV _i+0, #0
L_main2:
	CLR C
	MOV A, _i+0
	SUBB A, #8
	JNC L_main3
;8051_ex1.c,32 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOV FARG_Lcd_Cmd_out_char+0, #24
	LCALL _Lcd_Cmd+0
;8051_ex1.c,33 :: 		Delay_ms(200);
	MOV R5, 2
	MOV R6, 134
	MOV R7, 22
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;8051_ex1.c,31 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	INC _i+0
;8051_ex1.c,34 :: 		}
	SJMP L_main2
L_main3:
;8051_ex1.c,36 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	MOV _i+0, #0
L_main5:
	CLR C
	MOV A, _i+0
	SUBB A, #8
	JNC L_main6
;8051_ex1.c,37 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOV FARG_Lcd_Cmd_out_char+0, #28
	LCALL _Lcd_Cmd+0
;8051_ex1.c,38 :: 		Delay_ms(200);
	MOV R5, 2
	MOV R6, 134
	MOV R7, 22
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;8051_ex1.c,36 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	INC _i+0
;8051_ex1.c,39 :: 		}
	SJMP L_main5
L_main6:
;8051_ex1.c,41 :: 		Delay_ms(2000);
	MOV R5, 16
	MOV R6, 51
	MOV R7, 251
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;8051_ex1.c,42 :: 		}
	SJMP L_main0
;8051_ex1.c,44 :: 		}
	SJMP #254
; end of _main
