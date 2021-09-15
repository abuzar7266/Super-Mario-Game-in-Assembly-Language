.model large
.stack
.data
;__________________________Strings_____________________
String_Data1 db "Press Enter to Play Game :$"
strNamePlayer db 50 dup(0)
String_Data7 byte "You Won! $"
String_Data2 byte "Score: $"
String_Data4 byte "Lives: $"
String_Data9 byte "Level: $"
String_Data5 byte "Hey!,$"
String_Data3 byte "HighScore: $"
String_Data8 byte "You Lost! $"
String_Data11 byte "Please Enter Player Name :$"
String_Data10 byte "(-_-) Super Mario(-_-)  $"
highscore_str db 50 dup('0'),'$'
WriteGraphics_color db 00
WriteGraphics_size dw 00
WriteGraphics_data dw ?
highscore dw 00
Pscore dw 00
count dw 0000H
winCheck db 00
loseCheck db 00
digits dw 0000h
NumberText dw 0000
;------------------ setCursor Data ----------------
setCursorX byte 0
setCursorY byte 0
;_____________________________________________________
;lives Variable
mario_life db 03h
;level Variable
mario_level db 01h
;rectangle drawn variables
rect_x dw 0
rect_y dw 0
rect_wid dw 650
rect_heig dw 348
rect_temp dw ?
stonetemp dw 0
background_colour db 11
 
 uptemp dw 0
 
 gameplayS db 00




;FOR DRAWING PIXELS OF PIC
;16*13 image
MARIO_Right db 11,11,11,4,4,4,4,4,4,11,11,11,11
	  db 11,11,4,4,4,4,4,4,4,4,4,4,11
	 db	11,11,6,6,6,14,14,14,0,14,11,11,11
	 db 11,6,14,6,14,14,14,14,0,14,14,14,11
	db	11,6,14,6,6,14,14,14,14,0,14,14,14
	db	11,6,6,14,14,14,14,14,0,0,0,0,11
	db	11,11,11,14,14,14,14,14,14,14,14,11,11
	DB	11,11,4,4,1,4,4,4,4,11,11,11,11
	DB	11,4,4,4,1,4,4,1,4,4,4,11,11
	DB	4,4,4,4,1,1,1,1,4,4,4,4,11
	DB	14,14,4,1,1,1,1,1,1,4,14,14,11
	DB	14,14,14,1,1,1,1,1,1,14,14,14,11
	DB	14,14,1,1,1,1,1,1,1,1,14,14,11
	DB	11,11,1,1,1,11,11,1,1,1,11,11,11
	DB	11,6,6,6,11,11,11,11,6,6,6,11,11
	DB	6,6,6,6,11,11,11,11,6,6,6,6,11

;14*17
MarioJumpRight db 11,11,11,11,11,11,4,4,4,4,4,11,11,14,14,14,11
	db 11,11,11,11,11,4,4,4,4,4,4,4,4,4,14,14,11
	db 11,11,11,11,11,6,6,6,14,14,0,14,11,4,4,4,11
	db 11,11,11,11,6,14,6,14,14,14,0,14,14,14,4,4,11
	db 11,11,11,11,6,14,6,6,14,14,14,0,14,14,14,4,11
	db 11,11,11,11,6,6,14,14,14,14,0,14,14,14,4,11
	db 11,11,11,11,11,11,14,14,14,14,14,14,14,4,4,11,11
	db 14,14,14,4,4,4,4,1,4,4,4,1,4,4,11,11,6
	db 14,14,14,4,4,4,4,4,1,4,4,4,1,11,11,6,6
	db 11,14,11,11,11,4,4,4,1,1,1,1,1,1,1,6,6
	db 11,11,11,11,11,11,1,1,1,1,1,1,1,1,1,6,6
	db 11,11,11,11,6,6,1,1,1,1,1,1,1,1,1,6,6
	db 11,11,11,6,6,6,1,1,1,1,1,1,11,11,11,11,11
	db 11,11,11,6,6,11,11,11,11,11,11,11,11,11,11,11,11

;16*14
CoinPixel db  11,11,11,11,0,0,0,0,0,0,11,11,11,11
db 11,11,0,0,0,15,15,15,0,0, 0,0,11,11
db 11,0,0,15,15,14,14,14,14,14,0,0,11,11
db 11,0,15,14,14,15,15,15,0,14,14,0,0,11
db 0,0,15,14,14,15,14,14,0,14,14,0,0,11
db 0,15,14,14,14,15,14,14,0,14,14,14,0,0
db 0,15,14,14,14,15,14,14,0,14,14,14,0,0
db 0,15,14,14,14,15,14,14,0,14,14,14,0,0
db 0,15,14,14,14,15,14,14,0,14,14,14,0,0
db 0,15,14,14,14,15,14,14,0,14,14,14,0,0
db 0,15,14,14,14,15,14,14,0,14,14,14,0,0
db 0,0,15,14,14,15,14,14,0,14,14,0,0,11
db 11,0,15,14,14,0,0,0,0,14,14,0,0,11
db 11,0,0,15,14,14,14,14,14,14,0,0,11,11
db 11,11,0,0,0,14,14,14,0,0,0,0,11,11
db 11,11,11,11,0,0,0,0,0,0,11,11,11,11

removeCoinPixel db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
db  11,11,11,11,11,11,11,11,11,11,11,11,11,11
Coin_x Dw 0
Coin_y Dw 0

	;Pixels
MarioJumpLeft db 11 , 14 , 14 , 14 , 11 , 11 , 4 , 4 , 4 , 4 , 4 , 11 , 11 , 11 , 11 , 11 , 11                                                                                        
db 11 , 14 , 14 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 11 , 11 , 11 , 11 , 11                                                                                            
db 11 , 4 , 4 , 4 , 11 , 14 , 0 , 14 , 14 , 6 , 6 , 6 , 11 , 11 , 11 , 11 , 11                                                                                          
db 11 , 4 , 4 , 14 , 14 , 14 , 0 , 14 , 14 , 14 , 6 , 14 , 6 , 11 , 11 , 11 , 11                                                                                        
db 11 , 4 , 14 , 14 , 14 , 0 , 14 , 14 , 14 , 6 , 6 , 14 , 6 , 11 , 11 , 11 , 11                                                                                        
db 11 , 11 , 4 , 14 , 14 , 14 , 0 , 14 , 14 , 14 , 14 , 6 , 6 , 11 , 11 , 11 , 11                                                                                       
db 11 , 11 , 4 , 4 , 14 , 14 , 14 , 14 , 14 , 14 , 14 , 11 , 11 , 11 , 11 , 11 , 11                                                                                     
db 6 , 11 , 11 , 4 , 4 , 1 , 4 , 4 , 4 , 1 , 4 , 4 , 4 , 4 , 14 , 14 , 14                                                                                               
db 6 , 6 , 11 , 11 , 1 , 4 , 4 , 4 , 1 , 4 , 4 , 4 , 4 , 4 , 14 , 14 , 14                                                                                               
db 6 , 6 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 4 , 4 , 4 , 11 , 11 , 11 , 14 , 11                                                                                               
db 6 , 6 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 11 , 11 , 11 , 11 , 11 , 11                                                                                              
db 6 , 6 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 6 , 6 , 11 , 11 , 11 , 11                                                                                                
db 11 , 11 , 11 , 11 , 11 , 1 , 1 , 1 , 1 , 1 , 1 , 6 , 6 , 6 , 11 , 11 , 11                                                                                           
db 11 , 11 , 11 , 11 , 11 , 11 , 11 , 11 , 11 , 11 , 11 , 11 , 6 , 6 , 11 , 11 , 11  




MARIO_Flagleft db 15 , 15 , 15 , 15 , 4 , 4 , 4 , 4 , 4 , 4 , 15 , 15 , 15                                                                                
db 15 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 15 , 15                                                                                     
db 15 , 15 , 15 , 14 , 0 , 14 , 14 , 14 , 6 , 6 , 6 , 15 , 15                                                                               
db 15 , 14 , 14 , 14 , 0 , 14 , 14 , 14 , 14 , 6 , 14 , 6 , 15                                                                             
db 14 , 14 , 14 , 0 , 14 , 14 , 14 , 14 , 6 , 6 , 14 , 6 , 15                                                                               
db 15 , 0 , 0 , 0 , 0 , 14 , 14 , 14 , 14 , 14 , 6 , 6 , 15                                                                                 
db 15 , 15 , 14 , 14 , 14 , 14 , 14 , 14 , 14 , 14 , 15 , 15 , 15                                                                           
db 15 , 15 , 15 , 15 , 4 , 4 , 4 , 4 , 1 , 4 , 4 , 15 , 15                                                                                 
db 15 , 15 , 4 , 4 , 4 , 1 , 4 , 4 , 1 , 4 , 4 , 4 , 15                                                                                     
db 15 , 4 , 4 , 4 , 4 , 1 , 1 , 1 , 1 , 4 , 4 , 4 , 4                                                                                       
db 15 , 14 , 14 , 4 , 1 , 1 , 1 , 1 , 1 , 1 , 4 , 14 , 14                                                                                   
db 15 , 14 , 14 , 14 , 1 , 1 , 1 , 1 , 1 , 1 , 14 , 14 , 14                                                                                 
db 15 , 14 , 14 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 14 , 14                                                                                   
db 15 , 15 , 15 , 1 , 1 , 1 , 15 , 15 , 1 , 1 , 1 , 11 , 15                                                                                 
db 15 , 15 , 6 , 6 , 6 , 15 , 15 , 15 , 15 , 6 , 6 , 6 , 15                                                                                 
db 15 , 6 , 6 , 6 , 6 , 15 , 15 , 15 , 15 , 6 , 6 , 6 , 6  



MARIO_left db 11 , 11 , 11 , 11 , 4 , 4 , 4 , 4 , 4 , 4 , 11 , 11 , 11                                                                                
db 11 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 11 , 11                                                                                     
db 11 , 11 , 11 , 14 , 0 , 14 , 14 , 14 , 6 , 6 , 6 , 11 , 11                                                                               
db 11 , 14 , 14 , 14 , 0 , 14 , 14 , 14 , 14 , 6 , 14 , 6 , 11                                                                             
db 14 , 14 , 14 , 0 , 14 , 14 , 14 , 14 , 6 , 6 , 14 , 6 , 11                                                                               
db 11 , 0 , 0 , 0 , 0 , 14 , 14 , 14 , 14 , 14 , 6 , 6 , 11                                                                                 
db 11 , 11 , 14 , 14 , 14 , 14 , 14 , 14 , 14 , 14 , 11 , 11 , 11                                                                           
db 11 , 11 , 11 , 11 , 4 , 4 , 4 , 4 , 1 , 4 , 4 , 11 , 11                                                                                 
db 11 , 11 , 4 , 4 , 4 , 1 , 4 , 4 , 1 , 4 , 4 , 4 , 11                                                                                     
db 11 , 4 , 4 , 4 , 4 , 1 , 1 , 1 , 1 , 4 , 4 , 4 , 4                                                                                       
db 11 , 14 , 14 , 4 , 1 , 1 , 1 , 1 , 1 , 1 , 4 , 14 , 14                                                                                   
db 11 , 14 , 14 , 14 , 1 , 1 , 1 , 1 , 1 , 1 , 14 , 14 , 14                                                                                 
db 11 , 14 , 14 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 14 , 14                                                                                   
db 11 , 11 , 11 , 1 , 1 , 1 , 11 , 11 , 1 , 1 , 1 , 11 , 11                                                                                 
db 11 , 11 , 6 , 6 , 6 , 11 , 11 , 11 , 11 , 6 , 6 , 6 , 11                                                                                 
db 11 , 6 , 6 , 6 , 6 , 11 , 11 , 11 , 11 , 6 , 6 , 6 , 6  



;Iron Man
;42*31
Iron_Man db	 11,11,11,11,11,11,11,11,11,11,11,11,11,0,0,0,0,0,0,11,11,11,11,11,11,11,11,11,11,11,11
db  11,	11,	11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	0,	4,	4,	4,	4,	4,	4,	0,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	4,	4,	4,	4,	4,	4,	4,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	14,	14,	4,	4,	4,	4,	4,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	4,	14,	14,	14,	4,	4,	4,	14,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11
 db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	4,	14,	14,	14,	14,	4,	4,	14,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	4,	14,	14,	14,	14,	14,	14,	14,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	14,	14,	14,	14,	14,	14,	14,	14,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	14,	14,	1,	1,	14,	14,	14,	14,	1,	1,	11,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	14,	14,	1,	1,	1,	14,	14,	14,	1,	1,	11,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	14,	14,	14,	14,	14,	14,	14,	14,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	14,	14,	14,	14,	14,	14,	14,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	4,	4,	14,	14,	14,	14,	14,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	0,	4,	14,	14,	4,	4,	4,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	11,	11,	0,	0,	0,	0,	4,	4,	4,	0,	4,	4,	14,	14,	0,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	0,	0,	4,	4,	4,	4,	4,	4,	4,	4,	0,	0,	0,	0,	4,	4,	0,	0,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	0,	4,	4,	4,	4,	14,	4,	4,	4,	4,	4,	4,	4,	4,	4,	4,	4,	4,	0,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	0,	4,	4,	4,	4,	4,	14,	4,	4,	1,	4,	4,	4,	4,	4,	4,	1,	4,	4,	0,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	0,	4,	11,	4,	4,	4,	14,	4,	4,	4,	4,	4,	1,	11,	1,	4,	4,	4,	0,	0,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	0,	11,	4,	4,	4,	4,	4,	4,	4,	4,	4,	11,	11,	11,	4,	4,	0,	0,	11,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	11,	0,	4,	14,	14,	0,	0,	4,	4,	4,	4,	4,	1,	11,	1,	4,	4,	0,	14,	0,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	0,	4,	14,	14,	14,	0,	14,	14,	4,	4,	4,	4,	4,	4,	4,	4,	14,	0,	14,	0,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	0,	4,	14,	14,	4,	0,	0,	14,	14,	14,	14,	14,	4,	4,	4,	14,	0,	14,	14,	0,	11,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	11,	0,	4,	4,	0,	0,	11,	11,	0,	0,	14,	14,	14,	14,	14,	14,	14,	0,	4,	4,	4,	0,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	0,	4,	14,	14,	0,	11,	11,	11,	11,	0,	14,	14,	14,	14,	14,	14,	14,	0,	4,	4,	4,	0,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	0,	4,	14,	0,	11,	11,	11,	11,	0,	4,	14,	14,	14,	14,	14,	14,	14,	0,	0,	14,	14,	0,	11,	11,	11,	11,	11,	11	
db 11,	11,	11,	0,	4,	14,	0,	11,	11,	11,	0,	4,	14,	14,	14,	14,	14,	14,	14,	14,	14,	0,	14,	14,	4,	0,	11,	11,	11,	11,	11
db 11,	11,	0,	4,	4,	0,	11,	11,	11,	11,	0,	4,	11,	4,	4,	14,	14,	14,	4,	4,	0,	0,	14,	4,	0,	11,	11,	11,	11,	11,	11
db 11,	0,	0,	4,	4,	0,	11,	11,	11,	11,	0,	4,	1,	4,	4,	4,	4,	4,	4,	4,	0,	0,	4,	4,	4,	0,	11,	11,	11,	11,	11	
db 0,	0,	4,	4,	4,	4,	0,	11,	11,	11,	0,	4,	4,	4,	4,	4,	4,	4,	4,	4,	4,	0,	11,	0,	4,	4,	4,	4,	0,	11,	11
db 0,	4,	0,	0,	0,	0,	4,	0,	11,	11,	0,	4,	4,	4,	4,	4,	0,	0,	4,	4,	4,	0,	11,	11,	0,	11,	0,	0,	4,	0,	11
db 0,	0,	0,	1,	11,	11,	0,	0,	11,	11,	0,	4,	14,	14,	14,	4,	0,	4,	4,	14,	14,	0,	11,	11,	0,	4,	0,	0,	0,	0,	11
db 11,	11,	11,	1,	11,	1,	11,	11,	11,	11,	0,	14,	4,	4,	14,	0,	0,	4,	14,	4,	14,	0,	11,	11,	11,	0,	11,	11,	1,	11,	11
db 11,	11,	11,	1,	11,	1,	11,	11,	11,	0,	14,	4,	4,	4,	0,	11,	0,	14,	4,	4,	0,	11,	11,	11,	11,	1,	11,	1,	11,	11,	11
db 11,	11,	11,	1,	1,	11,	11,	11,	11,	0,	4,	4,	4,	4,	0,	11,	0,	4,	4,	4,	0,	11,	11,	11,	11,	1,	11,	1,	11,	11,	11
db 11,	11,	11,	1,	1,	11,	11,	11,	11,	0,	4,	4,	4,	0,	11,	11,	11,	0,	14,	4,	0,	11,	11,	11,	11,	11,	11,	1,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	4,	0,	11,	11,	11,	11,	0,	4,	14,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	11,	0,	4,	14,	0,	11,	11,	11,	11,	0,	4,	4,	4,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	0,	0,	0,	0,	11,	11,	11,	11,	11,	11,	0,	0,	0,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	1,	11,	11,	1,	11,	11,	11,	11,	11,	11,	1,	11,	11,	1,	11,	11,	11,	11,	11,	11,	11,	11,	11
db 11,	11,	11,	11,	11,	11,	11,	11,	0,	1,	11,	0,	11,	11,	11,	11,	11,	11,	0,	1,	11,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11		
db 11,	11,	11,	11,	11,	11,	11,	11,	0,	1,	11,	0,	11,	11,	11,	11,	11,	11,	0,	1,	11,	0,	11,	11,	11,	11,	11,	11,	11,	11,	11		

iron_x dw 0
iron_y dw 8
ironboolright dw 0
IronThrowObject dw 0
throwobject_x dw 0
throwobject_y dw 0

;44*38
 DrawCastle db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11          
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11          
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,11 , 11                
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,4 , 4 ,11 , 11                
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,0 , 0 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11 ,11 , 11        
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,0 , 0 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11 ,11 , 11 ,4 , 4 ,4 , 4 ,11 , 11 ,11 , 11        
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,0 , 0 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,0 , 0 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11        
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11        
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11                
 db 11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,8 , 8 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11 ,11 , 11                
 db 8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8                            
 db 8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,11 , 11 ,8 , 8 ,11 , 11 ,8 , 8                                 
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,8 , 8 ,8 , 8 ,8 , 8 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                            
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,8 , 8 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11                                
 db 11 , 11 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,0 , 0 ,7 , 7 ,7 , 7 ,7 , 7 ,7 , 7 ,11 , 11 
EnemyPixel  db 11,11,11,11,11,11,6,6,6,6,11,11,11,11,11,11
db 11,11,11,11,11,6,6,6,6,6,6,11,11,11,11,11
db 11,11,11,11,6,6,6,6,6,6,6,6,11,11,11,11
db 11,11,11,6,6,6,6,6,6,6,6,6,6,11,11,11
db 11,11,6,0,0,6,6,6,6,6,6,0,0,6,11,11
db 11,6,6,6,11,0,6,6,6,6,0,11,6,6,6,11
db 11,6,6,6,11,0,0,0,0,0,0,11,6,6,6,11
db 6,6,6,6,11,0,11,6,6,11,0,11,6,6,6,6
db 6,6,6,6,11,11,11,6,6,11,11,11,6,6,6,6
db 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
db 11,6,6,6,6,14,14,14,14,14,14,6,6,6,6,11
db 11,11,11,11,6,6,6,6,6,6,6,6,11,11,11,11
db 11,11,0,0,14,14,14,14,14,14,14,14,0,0,11,11
db 11,0,0,0,0,0,0,14,14,14,14,0,0,0,0,0,11

TotalPixels dw 0
Mario_x dw 0
Mario_y dw 88
pixel_row dw 0
pixel_col dw 0
pixelArray dw ?
pixel_startx dw 0
pixel_starty dw 0
pixeltemp dw 0
pixeltemp2 dw 0


;__________________Enemy Variable____________
Enemy STRUCT
xmax dw ?
ymax dw ?
xmin dw ?
ymin dw ?
x dw ?
y dw ?
Enemy ENDS

enemy_x dw 120
enemy_y dw  170
enemy1_direct db 0
enemy2_direct db 0
Enemy_1 Enemy <105,0,75,0,75,170>
Enemy_2 Enemy <205,0,145,0,175,170>


direct db 00

coinno2_x dw 165
coinno2_y dw 168
flag_coin2  dw  1

coinno1_x dw 90
coinno1_y dw 90
flag_coin1  dw  1

coinno3_x dw 20
coinno3_y dw 168
flag_coin3  dw  1

coinno4_x dw 260
coinno4_y dw 168
flag_coin4  dw  1

.code 

;___________________________________MAIN OF PROGRAM_____________________________________________________________________________________________________________________________________________
Main proc 

mov ax,@data
mov ds,ax
mov ah,09
lea dx,String_Data11
int 21h
mov ah,3fh
mov dx,offset strNamePlayer
int 21h
Mov ah,0 ;set video mode
Mov al,13h 
Int 10h
StartPlay:
mov gamePlayS,0

MenuPlay:
call CreateMenuEnvironment
mov ah,11h ;KeyboardKey Checking
int 16h
mov ah,10h ;Checking key value
int 16h

cmp ah,1CH
jne SkipGameplay
			mov gameplayS,1
			jmp GameStart
SkipGameplay:
cmp ah,01 ;Scan Code of Exit Key
je ExitGame

jmp MenuPlay




GameStart:
mov Pscore,0
mov mario_life,3
mov mario_level,01
mov iron_x, 0
mov iron_y, 8
mov enemy1_direct, 0
mov enemy2_direct, 0
mov Enemy_1.x,75
mov Enemy_1.y,170
mov Enemy_2.x,175
mov Enemy_2.y,170
mov mario_x,0
mov winCheck,0
mov loseCheck,0
mov mario_y,168
CALL CreateGameEnvironment
call createrightmario
call create_Enemy

Gameplay:
	mov setCursorX,0 ;Your Scores
	mov setCursorY,0
	call SetCursor
	mov WriteGraphics_color,15
	mov WriteGraphics_size,6
	mov bx,offset String_Data2
	mov WriteGraphics_data,bx
	call WriteString

	mov ax,PScore
	mov NumberText,ax
	call to_string


	mov setCursorX,13 ;Your Scores
	mov setCursorY,0
	call SetCursor
	mov WriteGraphics_color,15
	mov WriteGraphics_size,6
	mov bx,offset String_Data9
	mov WriteGraphics_data,bx
	call WriteString

	mov ah,0
	mov al,mario_level
	mov NumberText,ax
	call to_string


	mov setCursorX,25 ;Your Scores
	mov setCursorY,0
	call SetCursor
	mov WriteGraphics_color,15
	mov WriteGraphics_size,6
	mov bx,offset String_Data4
	mov WriteGraphics_data,bx
	call WriteString

	mov ah,0
	mov al,mario_life
	mov NumberText,ax
	call to_string

cmp mario_x,290
jna GoSkip_X 
cmp mario_y,130
jna GoSkip_X
mov flag_coin1,1
mov flag_coin2,1
mov flag_coin3,1
mov flag_coin3,1
inc mario_level
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,16
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
mov mario_x,0
mov mario_y,168
call createrightmario
GoSkip_X:

cmp mario_level,3
ja Game_Complete
cmp mario_life,0
je LostGame
call castle
call Enemy_Collision
call displaycoins
call EnemyMovement
call moveironman
;call makethrowobjects
call makeobjectmovement
call delay
mov ax,1
dec ax
call mario_fall
mov ax,1
dec ax


mov ah,11h ;KeyboardKey Checking
int 16h
jz Gameplay
mov ah,10h ;Checking key value
int 16h



cmp ah,01 ;Scan Code of Exit Key
je ExitGame

cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed
cmp  ah,48h			;Upward Pressed key Scan Code
je upwardkeypressed

RightKeyPressed:
mov direct,0
call movemarioright
call moveironman
call makeobjectmovement
call checkcoins
jmp keyDone
LeftKeyPressed :
mov direct,1
call movemarioLeft
call moveironman
call makeobjectmovement
call checkcoins
jmp Keydone
UpwardKeyPressed:
call movemarioup
call moveironman
call makeobjectmovement

KeyDone:
jmp gameplay

jmp ExitGame
LostGame:
mov ax,highscore
cmp ax,Pscore
jnbe SkiploseScore
	mov ax,Pscore
	mov highscore,ax
SkiploseScore:
mov loseCheck,1
mov gameplayS,0
jmp StartPlay
jmp ExitGame
Game_Complete:
mov ax,highscore
cmp ax,Pscore
jnbe SkipwinScore
	mov ax,Pscore
	mov highscore,ax
SkipwinScore:
mov winCheck,1
mov gameplayS,0
jmp StartPlay
jmp ExitGame

ExitGame:
mov ah,4ch 
int 21h

Main endp



;<<<<<<<<<<<<<<<<<<<<<<<< Helper Fuctions>>>>>>>>>>>>>>>>>>>>>>>>>> 

;_________________________________________Collision detection with throwing objects______________________
collisionObject proc  uses dx  bx 

mov dx,mario_x
sub dx ,20

cmp  dx ,throwobject_x
jge ExitCollision

add dx ,40
cmp dx,throwobject_x
jl exitCollision 

mov dx,mario_y
sub dx,20

cmp  dx ,throwobject_y
jg ExitCollision



add dx,40
cmp dx,throwobject_y
jb exitCollision 

call removelastcreatedpixels

dec mario_life
mov mario_x,0
mov mario_y,168
call createrightmario


ExitCollision:
ret
collisionObject endp


;_________________________________________Level3______________________
Castle proc
cmp mario_level,3
jb dontbuild
mov pixel_row,44
mov pixel_col,38
mov pixelarray,offset drawcastle
mov pixel_startx,275
mov pixel_starty,140
call managepixels

dontbuild:
ret
castle endp

;_________________________________________Iron Man laser Movement_____________________
MakeObjectMovement  proc uses dx
mov dx,throwobject_x
mov rect_X,dx
mov dx,throwobject_y
mov rect_y,dx
mov rect_wid,10
mov rect_heig,10
mov background_colour,11
call drawrect

cmp ironthrowobject,0
jne h

mov ironthrowobject,1

mov throwobject_y,30
mov dx,iron_x
mov throwobject_x,dx

h:

add throwobject_y,5
call makethrowobjects
cmp throwobject_y,110
jl j
mov ironthrowobject,0
j:
ret
makeobjectMovement endp

;_________________________________________Creating Lasers of Iron Man______________________

MakethrowObjects proc uses dx

cmp mario_level,3
jne NotCompatible
mov dx,throwobject_x
mov rect_X,dx
mov dx,throwobject_y
mov rect_y,dx
mov rect_wid,7
mov rect_heig,10
mov background_colour,6
call drawrect
NotCompatible:
ret
MakeThrowObjects endp

removelastIronMAN PROC uses dx
mov pixel_row,42
mov pixel_col,31
mov PixelArray, offset Iron_Man

mov dx,iron_x
mov pixel_startx,dx
mov dx,iron_y
mov pixel_starty,dx
call removelastcreatedPixels

ret
RemoveLastIronMan endp


;_________________________________________Movement Of IronMan______________________
MoveIronMan proc uses dx bx ax
cmp mario_level,3
jne ExitIronMove
call removelastironman
cmp ironboolright,1
je rightmoveIron

LeftMoveIRON:
cmp iron_x,0
jg l1
mov ironboolright,1
jmp rightmoveiron
l1:
sub iron_x,5
call createironman
ret


RightMoveIron:
cmp iron_x,190
jl r1
mov ironboolright,0

r1:
add iron_x,5
call createIronman

ExitIronMove:
ret
MoveIronMan endp



;_________________________________________Creation Of Iron Man______________________

CreateIronMan proc uses dx
cmp mario_level,3
jne ExitIronMan
mov pixel_row,42
mov pixel_col,31
mov PixelArray, offset Iron_Man

mov dx,iron_x
mov pixel_startx,dx
mov dx,iron_y
mov pixel_starty,dx
call ManagePixels
ExitIronMan:
ret
CreateIronMan endp

;_________________________________________Creation of Flag______________________
CreateFlag Proc

mov background_colour,15
mov rect_x,257
mov rect_y,2

mov rect_wid,55
mov rect_heig,40
call drawrect

mov background_colour,7
mov rect_x,312
mov rect_y,0

mov rect_wid,5
mov rect_heig,185
call drawrect

mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,13
mov PixelArray, offset Mario_flagleft

mov pixel_startx,277

mov pixel_starty,12
call ManagePixels

ret
CreateFlag endp

;_________________________________________Coins Display______________________
DisplayCoins proc  uses si dx

cmp flag_coin1,0
je skipcoin1

mov dx,coinno1_x
mov coin_x,dx
mov dx ,coinno1_y
mov coin_y,dx

call CreateCoin

skipcoin1:
cmp flag_coin2,0
je skipcoin2


mov dx,coinno2_x
mov coin_x,dx
mov dx ,coinno2_y
mov coin_y,dx 

call CreateCoin

skipcoin2:

cmp flag_coin3,0
je skipcoin3

mov dx,coinno3_x
mov coin_x,dx
mov dx ,coinno3_y
mov coin_y,dx

call CreateCoin

skipcoin3:
cmp flag_coin4,0
je skipcoin4


mov dx,coinno4_x
mov coin_x,dx
mov dx ,coinno4_y
mov coin_y,dx

call CreateCoin

skipcoin4:


ret
displayCoins endp

;_______________________________________ Destroying the Already Created Coins________________________
DestroyCoin proc 

mov pixelArray,offset  removeCoinPixel
mov dx,5
add pscore,dx
mov dx,Coin_x
mov pixel_startx,dx
mov dx,coin_y
mov pixel_starty,dx

mov pixel_row,16
mov pixel_col,14
Call removelastcreatedPixels
Call CreaterightMario


ret
DestroyCoin endp

;_________________________________________Coins Collision Detection______________________
CheckCoins proc  uses dx cx bx ax

mov dx,mario_x
cmp dx,coinno3_x
je RemoveCoin3

cmp dx,coinno4_x
je RemoveCoin4
cmp dx,coinno2_x
je RemoveCoin2
cmp dx,coinno1_x
je RemoveCoin1

ret

RemoveCoin3:

mov bx,coinno3_x
mov coin_x,bx
mov bx,coinno3_y
mov coin_y,bx
cmp bx,mario_y
jne k3
mov flag_coin3,0
call destroycoin
k3:
ret

Removecoin4:

mov bx,coinno4_x
mov coin_x,bx
mov bx,coinno4_y
mov coin_y,bx
cmp bx,mario_y
jne k4
mov flag_coin4,0
call destroycoin
k4:
ret

Removecoin1:


cmp bx,mario_y
sub bx,20

mov dx,bx
add dx,40

cmp mario_y,dx
jg k1


j:
cmp mario_y,dx
jnl k1

dcoin1:
mov flag_coin1,0
mov bx,coinno1_x
mov coin_x,bx
mov bx,coinno1_y
mov coin_y,bx
call destroycoin
k1:
ret

RemoveCoin2:
mov bx,coinno2_x
mov coin_x,bx
mov bx,coinno2_y
mov coin_y,bx
cmp bx,mario_y
jne k2
mov flag_coin2,0
call destroycoin
k2:
ret


checkCoins endp


;_________________________________________Enemy Creation Proc______________________

CreateEnemy proc uses dx

mov pixelArray,offset  EnemyPixel
mov totalpixels,224
mov pixel_row,14
mov pixel_col,16
mov dx,enemy_x
mov pixel_startx,dx
mov dx,enemy_y
mov pixel_starty,dx
call managepixels

ret
createEnemy endp

;_________________________________For Adding Delay in Game________________________
delay proc


push ax
push bx
push cx
push dx

mov cx,1000
mydelay:
mov bx,100     ;increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
mydelay1:
dec bx
jnz mydelay1
loop mydelay


pop dx
pop cx
pop bx
pop ax

ret
delay endp
;__________________________________RemoveLast createdPixels_________________________
RemoveLastCreatedPixels Proc uses cx bx dx ax si di
 mov pixeltemp,0
 mov pixeltemp2,0
 mov si,pixelarray

 mov di,0
 mov pixeltemp,0
 mov bx,pixel_starty
 mov pixeltemp2,0
 colpixel:


 l1:
 
 
 mov bx,pixel_startx
 add pixeltemp,bx

 makerow:
		mov al,11
		mov cx, pixeltemp  
		mov bx,pixel_starty
		add bx,di
		mov dx,bx
		mov ah,0ch				;Drawing a Pixel 
		int 10h
		add si,1
	inc pixeltemp
	inc pixeltemp2
	mov bx,pixel_col
	cmp pixeltemp2,bx
	jne makerow


rowdone:
mov pixeltemp2,0
mov pixeltemp,0
 inc di 
 cmp di,pixel_row
 jne colpixel



ret
RemoveLastCreatedPixels endp


;___________________________________Draw Bricks__________________________
DrawBricks proc
mov background_colour,6
mov rect_heig,10h
mov rect_wid,170h
mov rect_x,-1
mov rect_y,185
call drawrect


mov background_colour,0
mov rect_heig,1h
mov rect_wid,140h
mov rect_x,3
mov rect_y,187
call drawrect

mov background_colour,0
mov rect_heig,1h
mov rect_wid,140h
mov rect_x,3
mov rect_y,190
call drawrect

mov background_colour,0
mov rect_heig,1h
mov rect_wid,140h
mov rect_x,3
mov rect_y,194
call drawrect

mov background_colour,0
mov rect_heig,1h
mov rect_wid,140h
mov rect_x,3
mov rect_y,197
call drawrect
	mov cx,36
	mov ax,0
	Draw_Inter:
	mov background_colour,0
	mov rect_heig,2h
	mov rect_wid,1h
	mov rect_x,3
	add rect_x,ax
	mov rect_y,185
	push ax
	push cx
	call drawrect
	pop cx
	pop ax
	add ax,9
	loop Draw_Inter
	mov cx,36
	mov ax,0
	Draw_Inter2:
	mov background_colour,0
	mov rect_heig,3h
	mov rect_wid,1h
	mov rect_x,3
	add rect_x,ax
	mov rect_y,197
	push ax
	push cx
	call drawrect
	pop cx
	pop ax
	add ax,9
	loop Draw_Inter2
	mov cx,70
	mov ax,0
	Draw_Inter3:
	mov background_colour,0
	mov rect_heig,3h
	mov rect_wid,1h
	mov rect_x,5
	add rect_x,ax
	mov rect_y,187
	push ax
	push cx
	call drawrect
	pop cx
	pop ax
	add ax,5
	loop Draw_Inter3

	mov cx,70
	mov ax,0
	Draw_Inter4:
	mov background_colour,0
	mov rect_heig,3h
	mov rect_wid,1h
	mov rect_x,5
	add rect_x,ax
	mov rect_y,194
	push ax
	push cx
	call drawrect
	pop cx
	pop ax
	add ax,5
	loop Draw_Inter4

	mov cx,70
	mov ax,0
	Draw_Inter5:
	mov background_colour,0
	mov rect_heig,3h
	mov rect_wid,1h
	mov rect_x,3
	add rect_x,ax
	mov rect_y,190
	push ax
	push cx
	call drawrect
	pop cx
	pop ax
	add ax,10
	loop Draw_Inter5
ret
DrawBricks endp

;_______________________________Draw Hurdles_______________________________
DrawHurdle proc

	;First Hurdle
	mov background_colour,2
	mov rect_heig,30
	mov rect_wid,18
	mov rect_x,50
	mov rect_y,155
	call drawrect

	mov background_colour,2
	mov rect_heig,9
	mov rect_wid,24
	mov rect_x,47
	mov rect_y,145
	call drawrect
	;Second Hurdle
	mov background_colour,2
	mov rect_heig,40
	mov rect_wid,18
	mov rect_x,50
	add rect_x,70
	mov rect_y,145
	call drawrect

	mov background_colour,2
	mov rect_heig,9
	mov rect_wid,24
	mov rect_x,47
	add rect_x,70
	mov rect_y,135
	call drawrect
	;Third Hurdle
	mov background_colour,2
	mov rect_heig,50
	mov rect_wid,18
	mov rect_x,50
	add rect_x,170
	mov rect_y,135
	call drawrect

	mov background_colour,2
	mov rect_heig,9
	mov rect_wid,24
	mov rect_x,47
	add rect_x,170
	mov rect_y,125
	call drawrect

ret
DrawHurdle endp


;___________________________________Mario For Jumping Right___________________________________
createJumpRight proc uses dx

mov TotalPixels ,238
mov pixel_row,14
mov pixel_col,17
mov PixelArray, offset Mariojumpright
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx


call ManagePixels

ret
createJumpright endp

;___________________________________Mario for Jumping Left___________________________________
					createJumpLeft proc uses dx

mov TotalPixels ,238
mov pixel_row,14
mov pixel_col,17
mov PixelArray, offset Mariojumpleft
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call ManagePixels

ret
createJumpLeft endp

;___________________________________ Left Side of the Mario___________________________________
CreateLeftMario proc uses dx

mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,13
mov PixelArray, offset Mario_left
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call ManagePixels


ret 
	CreateLeftMario endp  



;___________________________________Right Side of the Mario___________________________________
CreateRightMario proc uses dx

mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,13
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call ManagePixels


ret 

	CreateRightMario endp  

;_______________________________________MOVING MARIO RIGHT__________________________________
MoveMarioRight proc  uses dx cx ax
call EnemyMovement
cmp mario_x,305
jae CannotGoRight
cmp mario_x,30
jbe Hurdle1Right 
cmp mario_x,69
jb RightMovementAllowed

cmp mario_x,100
jbe Hurdle2right

cmp mario_x,140
jbe RightMovementAllowed

cmp mario_x,205
jbe Hurdle3Right

Jmp RightMovementAllowed


;Hurdle 1 Checks For Movement
Hurdle1Right:
cmp mario_y,130    ;Checking the Height of Hurdle
jae CheckX
jmp RightMovementAllowed

checkX:  ;Cheking the Hurdles X Coordinates
cmp mario_x,30
jae CannotGoRight
jmp RightMovementAllowed


Hurdle2Right:

cmp mario_y,120  ;Checking the Height of Hurdle
jae CheckX2
jmp RightMovementAllowed

checkX2:  ;Cheking the Hurdles X Coordinates

cmp mario_x,100
jb RightMovementAllowed
jmp CannotGoRight



Hurdle3Right:

cmp mario_y,110  ;Checking the Height of Hurdle
jae CheckX3
jmp RightMovementAllowed

checkX3:  ;Cheking the Hurdles X Coordinates

cmp mario_x,200
jb RightMovementAllowed
jmp CannotGoRight




RightMovementAllowed:
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,13
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_x,5

call createrightmario
call delay

CannotGoRight:
call checkcoins
call collisionobject
ret
MoveMarioRight endp
;_________________________Mario_Move_JMP___________________
MoveMarioRight_JMP proc  uses dx cx ax


cmp mario_x,305
jae CannotGoRight
cmp mario_x,30
jbe Hurdle1Right 
cmp mario_x,69
jb RightMovementAllowed

cmp mario_x,100
jbe Hurdle2right

cmp mario_x,140
jbe RightMovementAllowed

cmp mario_x,205
jbe Hurdle3Right

Jmp RightMovementAllowed


;Hurdle 1 Checks For Movement
Hurdle1Right:
cmp mario_y,130    ;Checking the Height of Hurdle
jae CheckX
jmp RightMovementAllowed

checkX:  ;Cheking the Hurdles X Coordinates
cmp mario_x,30
jae CannotGoRight
jmp RightMovementAllowed


Hurdle2Right:

cmp mario_y,120  ;Checking the Height of Hurdle
jae CheckX2
jmp RightMovementAllowed

checkX2:  ;Cheking the Hurdles X Coordinates

cmp mario_x,100
jb RightMovementAllowed
jmp CannotGoRight



Hurdle3Right:

cmp mario_y,110  ;Checking the Height of Hurdle
jae CheckX3
jmp RightMovementAllowed

checkX3:  ;Cheking the Hurdles X Coordinates

cmp mario_x,200
jb RightMovementAllowed
jmp CannotGoRight




RightMovementAllowed:
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_x,5

call createjumpright
call delay

CannotGoRight:
call checkcoins
call collisionobject
ret
MoveMarioRight_JMP endp
;_______________________________________MOVING MARIO LEFT__________________________________
MoveMarioLeft proc uses cx dx ax 

cmp mario_x,0
jbe CannotGoLeft


cmp mario_x,245
jae LeftHurdle3

cmp mario_x,205
jae leftMovementAllowed

cmp mario_x,140
ja LeftHurdle2

cmp mario_x,105
ja LeftMovementAllowed

cmp mario_x,70
ja LeftHurdle1

jmp LeftMovementAllowed


LeftHurdle3:

cmp mario_y,110  ;Checking the Height of Hurdle
jae CheckX3
jmp LeftMovementAllowed

checkX3:  ;Cheking the Hurdles X Coordinates


cmp mario_x,245
ja LeftMovementAllowed
jmp CannotGoLeft


LeftHurdle2:
cmp mario_y,120  ;Checking the Height of Hurdle
jae CheckX2
jmp LeftMovementAllowed

checkX2:  ;Cheking the Hurdles X Coordinates

cmp mario_x,145
ja LeftMovementAllowed
jmp CannotGoLeft


LeftHurdle1:
cmp mario_y,130    ;Checking the Height of Hurdle
jae CheckX
jmp LeftMovementAllowed

checkX:  ;Cheking the Hurdles X Coordinates
cmp mario_x,75
ja LeftMovementAllowed
jmp CannotGoLeft


LeftMovementAllowed:
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,13
mov PixelArray, offset Mario_left
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
sub mario_x,5

call createleftmario
call delay

CannotGoLeft:
call checkcoins
call collisionobject
ret
MoveMarioLeft endp
;_________________________________Mario_Move_JMP_Left______________
MoveMarioLeft_JMP proc uses cx dx ax 


cmp mario_x,0
jbe CannotGoLeft


cmp mario_x,245
jae LeftHurdle3

cmp mario_x,205
jae leftMovementAllowed

cmp mario_x,140
ja LeftHurdle2

cmp mario_x,105
ja LeftMovementAllowed

cmp mario_x,70
ja LeftHurdle1

jmp LeftMovementAllowed


LeftHurdle3:

cmp mario_y,110  ;Checking the Height of Hurdle
jae CheckX3
jmp LeftMovementAllowed

checkX3:  ;Cheking the Hurdles X Coordinates


cmp mario_x,245
ja LeftMovementAllowed
jmp CannotGoLeft


LeftHurdle2:
cmp mario_y,120  ;Checking the Height of Hurdle
jae CheckX2
jmp LeftMovementAllowed

checkX2:  ;Cheking the Hurdles X Coordinates

cmp mario_x,145
ja LeftMovementAllowed
jmp CannotGoLeft


LeftHurdle1:
cmp mario_y,130    ;Checking the Height of Hurdle
jae CheckX
jmp LeftMovementAllowed

checkX:  ;Cheking the Hurdles X Coordinates
cmp mario_x,75
ja LeftMovementAllowed
jmp CannotGoLeft

LeftMovementAllowed:
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_left
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
sub mario_x,5

call createjumpLeft
call delay

CannotGoLeft:
call checkcoins
call collisionobject
ret
MoveMarioLeft_JMP endp


;___________________________________Drawing Pixels for pics___________________________________
ManagePixels proc uses dx ax cx bx si di

 mov pixeltemp,0
 mov pixeltemp2,0
 mov si,pixelarray

 mov di,0
 mov pixeltemp,0
 mov bx,pixel_starty
 mov pixeltemp2,0
 colpixel:


 l1:
 
 mov bx,pixel_startx
 mov pixeltemp,bx

 makerow:
		mov al,[si]
		mov cx, pixeltemp  
		mov bx,pixel_starty
		add bx,di
		mov dx,bx
		mov ah,0ch				;Drawing a Pixel 
		int 10h
		add si,1
	inc pixeltemp
	inc pixeltemp2
	mov bx,pixel_col
	cmp pixeltemp2,bx
	jne makerow


rowdone:
mov pixeltemp2,0
mov pixeltemp,0
 inc di 
 cmp di,pixel_row
 jne colpixel


ret
ManagePixels endp



;___________________________________Rectangle Draw___________________________________
		drawrect proc uses bx cx dx ax si

mov bx,0
mov dx,0
mov cx,0
mov ax,0
mov si,rect_x
outer:
	mov cx,rect_wid
inner:
		mov al,background_colour
		add cx,rect_x              
		mov dx,rect_y
		mov ah,0ch				;Drawing a Pixel of Rectangle
		int 10h
		sub cx,rect_x
		loop inner
inc rect_y
dec rect_heig
cmp rect_heig,0
jne outer

ret 
		drawrect endp
		
;______________________________________Game Hurdle and background  _________
CreateGameEnvironment proc 
mov ah,06h
mov al,0
mov cx,0
mov dh,40
mov dl,40
mov bh,11
int 10h

call drawBricks
call DrawHurdle
call createFlag
ret
CreateGameEnvironment endp

;__________________________________________Game Menu Environment__________________________________
CreateMenuEnvironment proc 

mov ah,06h
mov al,0
mov cx,0
mov dh,40
mov dl,40
mov bh,0
int 10h

	mov setCursorX,7 ;Your Scores
	mov setCursorY,20
	call SetCursor
	mov WriteGraphics_color,2
	mov WriteGraphics_size,25
	mov bx,offset String_Data1
	mov WriteGraphics_data,bx
	call WriteString


	mov setCursorX,8 ;Your Scores
	mov setCursorY,11
	call SetCursor
	mov WriteGraphics_color,2
	mov WriteGraphics_size,22
	mov bx,offset String_Data10
	mov WriteGraphics_data,bx
	call WriteString


	mov setCursorX,14 ;Your Scores
	mov setCursorY,9
	call SetCursor
	mov WriteGraphics_color,15
	mov WriteGraphics_size,5
	mov bx,offset String_Data5
	mov WriteGraphics_data,bx
	call WriteString

	mov ax,0
	mov si,offset strNamePlayer
	Strlen:
		mov dl,[si]
		cmp dl,0dh
		je ExitStrlen
		cmp dl,'$'
		je ExitStrlen
		inc si
		inc ax
	loop Strlen
	ExitStrlen:
	mov setCursorX,19 ;Your Scores
	mov setCursorY,9
	call SetCursor
	mov WriteGraphics_color,5
	mov WriteGraphics_size,ax
	mov bx,offset strNamePlayer
	mov WriteGraphics_data,bx
	call WriteString

	cmp winCheck,1
	jne SkipWin

	mov setCursorX,15 ;Your Scores
	mov setCursorY,18
	call SetCursor
	mov WriteGraphics_color,2
	mov WriteGraphics_size,9
	mov bx,offset String_Data7
	mov WriteGraphics_data,bx
	call WriteString

	SkipWin:
	cmp loseCheck,1
	jne SkipLose
	mov setCursorX,15 ;Your Scores
	mov setCursorY,18
	call SetCursor
	mov WriteGraphics_color,2
	mov WriteGraphics_size,10
	mov bx,offset String_Data8
	mov WriteGraphics_data,bx
	call WriteString
	SkipLose:

	mov setCursorX,0 ;Your Scores
	mov setCursorY,0
	call SetCursor
	mov WriteGraphics_color,15
	mov WriteGraphics_size,6
	mov bx,offset String_Data2
	mov WriteGraphics_data,bx
	call WriteString

	mov ax,PScore
	mov NumberText,ax
	call to_string


	mov setCursorX,25 ;Your Scores
	mov setCursorY,0
	call SetCursor
	mov WriteGraphics_color,15
	mov WriteGraphics_size,10
	mov bx,offset String_Data3
	mov WriteGraphics_data,bx
	call WriteString

	mov ax,highscore
	mov NumberText,ax
	call to_string
ret
CreateMenuEnvironment endp


;________________________to display non-strings on graphics mode__________________
to_String proc uses ax bx si cx dx
	mov count,0
	mov digits,0
	mov ax,NumberText
	mov si,offset highscore_str
	divide_push:
	mov dx,0
	mov bx,10
	div bx
	push dx
	inc count

	cmp ax,0
	ja divide_push

	display:

	pop dx
	add dl,48
	mov [si],dl
	inc si
	mov ah,02
	int 21h
	inc digits
	dec count
	cmp count,0
	ja display
ret
to_String endp

;___________________________Mario_Up____________
;This function helps mario jumps upward and we can easily control speed of jump by decreasing loopiterations and making the jumps which travels more in single in y component 
movemarioup proc
mov cx,15
Up_Movement:
call EnemyMovement
call moveironman
call makeobjectmovement
mov ah,11h ;KeyboardKey Checking
int 16h
jz Skip_Move
mov ah,10h ;Checking key value
int 16h
cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed10
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed10

RightKeyPressed10:
mov direct,0
call MoveMarioRight_JMP
jmp keyDone10
LeftKeyPressed10 :
mov direct,1
call MoveMarioLeft_JMP
keydone10:
Skip_MOVE:
push cx
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,16
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
sub mario_y,5
cmp direct,0
jne Go_Left_Mario
call createJumpRight
jmp skipRight
Go_Left_Mario:
call createJumpLeft



skipRight:
call delay
pop cx
loop Up_Movement
call checkcoins
ret

movemarioup endp

;_________________________________________Gravity Implimentation______________________
;Whenever mario jumps then this function acts as gravitational force which forces mario to move vertically downward
;Basically,we have 6 scenerios for gravity,3 for hurdles and 3 for empty spaces and we must need to develop algorithm which can control 
;y component of mario according to that specific portion
Mario_Fall proc
call moveironman
call makeobjectmovement
;________________________Hurdle-1________________
cmp mario_x,35
jnae Skip_Hurdle_1
cmp mario_x,70
jnbe Skip_Hurdle_1
cmp mario_y,128
je Skip_Hurdle_1
Hurdle_Movement1:
call EnemyMovement
call moveironman
call makeobjectmovement
cmp mario_y,128
jnbe Skip_Move_2
cmp mario_x,100
ja Skip_Hurdle_1
mov ah,11h ;KeyboardKey Checking
int 16h
jz Skip_Move_2
mov ah,10h ;Checking key value
int 16h
cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed3
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed3

RightKeyPressed3:
mov direct,0
call MoveMarioRight_JMP
jmp keyDone3
LeftKeyPressed3 :
mov direct,1
call MoveMarioLeft_JMP
keyDone3:
Skip_Move_2:

mov TotalPixels ,208

mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_y,5
cmp direct,0
jne Go_Left_Jump5
call createJumpRight
jmp Skip5_C1
Go_Left_Jump5:
call createJumpLeft
Skip5_C1:
call delay
cmp mario_y,128
jnae GoMakeIt5
mov mario_y,128
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
call createrightmario
call delay
JMP Skip_Fall
GoMakeIt5:
cmp mario_y,128
jnae Hurdle_Movement1
Skip_Hurdle_1:
;________________________Hurdle-2________________
cmp mario_x,100
jnae Skip_Hurdle_2
cmp mario_x,150
jnbe Skip_Hurdle_2
cmp mario_y,118
jae Skip_Hurdle_2
Hurdle_Movement2:
call EnemyMovement
call moveironman
call makeobjectmovement
cmp mario_y,118
jae Skip_Move_4
mov ah,11h ;KeyboardKey Checking
int 16h
jz Skip_Move_4
mov ah,10h ;Checking key value
int 16h
cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed4
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed4

RightKeyPressed4:
mov direct,0
call MoveMarioRight_JMP
jmp keyDone4
LeftKeyPressed4 :
mov direct,1
call MoveMarioLeft_JMP
keyDone4:
Skip_Move_4:

mov TotalPixels ,208

mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_y,5
cmp direct,0
jne Go_Left_Jump6
call createJumpRight
jmp Skip6_C1
Go_Left_Jump6:
call createJumpLeft
Skip6_C1:
call delay
cmp mario_y,118
jnae GoMakeIt6
mov mario_y,118
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
call createrightmario
call delay
JMP Skip_Fall
GoMakeIt6:
cmp mario_y,118
jnae Hurdle_Movement2
Skip_Hurdle_2:



;________________________Hurdle-3________________

cmp mario_x,195
jna Skip_Hurdle_3
cmp mario_x,260
jae Skip_Hurdle_3
cmp mario_y,108
jae Skip_Hurdle_3
Hurdle_Movement3:
call EnemyMovement
call makeobjectmovement
call moveironman
cmp mario_x,260
jae Skip_Hurdle_3
cmp mario_y,108
jnbe Skip_Move_8
mov ah,11h ;KeyboardKey Checking
int 16h
jz Skip_Move_8
mov ah,10h ;Checking key value
int 16h
cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed8
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed8

RightKeyPressed8:
mov direct,0
call MoveMarioRight_JMP
jmp keyDone8
LeftKeyPressed8 :
mov direct,1
call MoveMarioLeft_JMP
keyDone8:
Skip_Move_8:

mov TotalPixels ,208

mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_y,5
cmp direct,0
jne Go_Left_Jump8
call createJumpRight
jmp Skip8_C1
Go_Left_Jump8:
call createJumpLeft
Skip8_C1:
call delay
cmp mario_y,108
jnae GoMakeIt8
mov mario_y,108
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
call createrightmario
call delay
JMP Skip_Fall
GoMakeIt8:
cmp mario_y,108
jnae Hurdle_Movement3
Skip_Hurdle_3:
;_________________________Till the First hurdle_________________________
cmp mario_y,168
jae Skip_Fall
cmp mario_x,32
jae Skip_Fall_1
cmp mario_x,100
ja Skip_Fall_1
Down_Movement1:
call EnemyMovement
call moveironman
call makeobjectmovement
cmp mario_x,35
jae Skip_Fall_1
cmp mario_x,100
ja Skip_Fall_1
mov ah,11h ;KeyboardKey Checking
int 16h
jz Skip_Move_1
mov ah,10h ;Checking key value
int 16h
cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed2
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed2

RightKeyPressed2:
mov direct,0
call MoveMarioRight_JMP
jmp keyDone2
LeftKeyPressed2 :
mov direct,1
call MoveMarioLeft_JMP
keyDone2:
Skip_Move_1:
mov TotalPixels ,208

mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_y,5
cmp direct,0
jne Go_Left_Jump4
call createJumpRight
jmp Skip4_C1
Go_Left_Jump4:
call createJumpLeft
Skip4_C1:
call delay
cmp mario_y,168
jnge GoMakeIt
mov mario_y,168
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
call createrightmario
call delay
GoMakeIt:
cmp mario_y,168
jne Down_Movement1
Skip_Fall_1:
;_________________________Till the Second hurdle_________________________
cmp mario_y,168
jae Skip_Fall
cmp mario_x,70
jbe Skip_Fall_2
cmp mario_x,100
ja Skip_Fall_2
mov cx,15
Down_Movement2:
call EnemyMovement
call makeobjectmovement
call moveironman
cmp mario_y,118
jnae Check_Next
cmp mario_x,100
ja Skip_Fall
Check_Next:

cmp mario_x,100
ja Skip_Fall_2
cmp mario_x,70
jb Skip_Fall_2
push cx
mov ah,11h ;KeyboardKey Checking
int 16h
jz Skip_Move_5
mov ah,10h ;Checking key value
int 16h
cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed5
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed5

RightKeyPressed5:
mov direct,0
call MoveMarioRight_JMP
jmp keyDone5
LeftKeyPressed5 :
mov direct,1
call MoveMarioLeft_JMP
keyDone5:
Skip_Move_5:
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_y,5
cmp direct,0
jne Go_Left_Jump3
call createJumpRight
jmp Skip3_C1
Go_Left_Jump3:
call createJumpLeft
Skip3_C1:
call delay
cmp mario_y,168
jnge GoMakeIt2
mov mario_y,168
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
call createrightmario
call delay
GoMakeIt2:
pop cx
cmp mario_y,168
jne Down_Movement2
Skip_Fall_2:
;_________________________Till the Third hurdle_________________________
cmp mario_y,168
jae Skip_Fall
cmp mario_x,145
jle Skip_Fall_3
cmp mario_x,205
jge Skip_Fall_3
Down_Movement3:
call EnemyMovement
call makeobjectmovement
call moveironman
cmp mario_x,205
jae Skip_Fall_3
cmp mario_x,105
jbe Skip_Fall_3
push cx
mov ah,11h ;KeyboardKey Checking
int 16h
jz Skip_Move_7
mov ah,10h ;Checking key value
int 16h
cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed7
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed7

RightKeyPressed7:
mov direct,0
call MoveMarioRight_JMP
jmp keyDone7
LeftKeyPressed7 :
mov direct,1
call MoveMarioLeft_JMP
keyDone7:
Skip_Move_7:


mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_y,5
cmp direct,0
jne Go_Left_Jump2
call createJumpRight
jmp Skip2_C1
Go_Left_Jump2:
call createJumpLeft
Skip2_C1:
call delay
cmp mario_y,168
jnge GoMakeIt3
mov mario_y,168
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
call createrightmario
call delay
GoMakeIt3:
pop cx
cmp mario_y,168
jne Down_Movement3
Skip_Fall_3:
;_________________________Final Block Gravity_________________________
cmp mario_y,168
jae Skip_Fall
cmp mario_x,240
jbe Skip_Fall_4
mov cx,15
Down_Movement4:
call EnemyMovement
call makeobjectmovement
call moveironman
push cx
cmp mario_x,240
jbe Skip_Fall_4
mov ah,11h ;KeyboardKey Checking
int 16h
jz Skip_Move_9
mov ah,10h ;Checking key value
int 16h
cmp ah,4bh			;Right Pressed key Scan Code
je leftkeypressed9
cmp  ah,4dh			;Left Pressed key Scan Code
je rightkeypressed9

RightKeyPressed9:
mov direct,0
call MoveMarioRight_JMP
jmp keyDone9
LeftKeyPressed9 :
mov direct,1
call MoveMarioLeft_JMP
keyDone9:
Skip_Move_9:

mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
add mario_y,5
cmp direct,0
jne Go_Left_Jump
call createJumpRight
jmp Skip_C1
Go_Left_Jump:
call createJumpLeft
Skip_C1:
call delay
cmp mario_y,168
jnge GoMakeIt4
mov mario_y,168
mov TotalPixels ,208
mov pixel_row,16
mov pixel_col,17
mov PixelArray, offset Mario_right
mov dx,mario_x
mov pixel_startx,dx
mov dx,mario_y
mov pixel_starty,dx
call removelastcreatedpixels
cmp direct,0
jne Go_Left
call createrightmario
jmp Skip_C2
Go_Left:
call createleftmario
Skip_C2:
call delay
GoMakeIt4:
pop cx
cmp mario_y,168
jne Down_Movement4
Skip_Fall_4:
Skip_Fall:

ret
mario_fall endp


CreateCoin Proc uses dx si
mov pixelArray,offset  CoinPixel
mov dx,Coin_x
mov pixel_startx,dx
mov dx,coin_y
mov pixel_starty,dx

mov pixel_row,16
mov pixel_col,14

Call ManagePixels

ret
CreateCoin Endp

;_____________________________________Game Enemy Movement__________________
EnemyMovement proc uses dx ax bx si cx
cmp mario_level,2;Check which limits minor enemies for level 2 and onwards
jnae NotCompatble
mov ax,Enemy_1.x
mov enemy_x,ax
mov ax,Enemy_1.y
mov enemy_y,ax
call removeLastEnemy
mov ax,Enemy_2.x
mov enemy_x,ax
mov ax,Enemy_2.y
mov enemy_y,ax
call removeLastEnemy
	cmp enemy1_direct,0
	jne ElseMove
	add Enemy_1.x,5
	call create_Enemy
	mov ax,Enemy_1.xmax
	cmp Enemy_1.x,ax
	jb ElseSkip
	ChangeDirect_1:
	mov enemy1_direct,1
	jmp ElseSkip
	ElseMove:
	sub Enemy_1.x,5
	call create_Enemy
	mov ax,Enemy_1.xmin
	cmp Enemy_1.x,ax
	jae ElseSkip
	ChangeDirect_2:
	mov enemy1_direct,0
	jmp ElseSkip
	ElseSkip:


mov ax,Enemy_1.x
mov enemy_x,ax
mov ax,Enemy_1.y
mov enemy_y,ax
call removeLastEnemy
mov ax,Enemy_2.x
mov enemy_x,ax
mov ax,Enemy_2.y
mov enemy_y,ax
call removeLastEnemy

	cmp enemy2_direct,0
	jne ElseMove2
	add Enemy_2.x,5
	call create_Enemy
	mov ax,Enemy_2.xmax
	cmp Enemy_2.x,ax
	jb ElseSkip2
	mov enemy2_direct,1
	jmp ElseSkip2
	ElseMove2:
	sub Enemy_2.x,5
	call create_Enemy
	mov ax,Enemy_2.xmin
	cmp Enemy_2.x,ax
	jae ElseSkip2
	mov enemy2_direct,0
	jmp ElseSkip2
	ElseSkip2:
NotCompatble:
ret
EnemyMovement endp
create_Enemy proc
cmp mario_level,2
jnae NotCompatble
	mov ax,Enemy_1.x
	mov enemy_x,ax
	mov ax,Enemy_1.y
	mov enemy_y,ax
	call CreateEnemy
	mov ax,Enemy_2.x
	mov enemy_x,ax
	mov ax,Enemy_2.y
	mov enemy_y,ax
	call CreateEnemy
NotCompatble:
ret
create_Enemy endp

removeLastEnemy  proc 
cmp mario_level,2
jnae NotCompatble
mov pixelArray,offset  EnemyPixel
mov totalpixels,224
mov pixel_row,14
mov pixel_col,16
mov dx,enemy_x
mov pixel_startx,dx
mov dx,enemy_y
mov pixel_starty,dx
call removelastcreatedpixels
NotCompatble:
ret 
removeLastEnemy endp
Enemy_Collision proc
cmp mario_level,2
jnae NotCompatble
	mov ax,Enemy_1.x
	sub ax,15
	cmp mario_x,ax
	jnae GoElse
	add ax,30
	cmp mario_x,ax
	jnbe GoElse
	mov ax,Enemy_1.y
	sub ax,15
	cmp mario_y,ax
	jnae GoElse
	add ax,30
	cmp mario_y,ax
	jnbe GoElse
	dec mario_life
	mov TotalPixels ,208
	mov pixel_row,16
	mov pixel_col,17
	mov PixelArray, offset Mario_right
	mov dx,mario_x
	mov pixel_startx,dx
	mov dx,mario_y
	mov pixel_starty,dx
	call removelastcreatedpixels
	mov mario_x,0
	mov mario_y,168
	call createrightmario
	GoElse:


	mov ax,Enemy_2.x
	sub ax,15
	cmp mario_x,ax
	jnae GoElse2
	add ax,30
	cmp mario_x,ax
	jnbe GoElse2
	mov ax,Enemy_2.y
	sub ax,15
	cmp mario_y,ax
	jnae GoElse2
	add ax,30
	cmp mario_y,ax
	jnbe GoElse2
	dec mario_life
	mov TotalPixels ,208
	mov pixel_row,16
	mov pixel_col,17
	mov PixelArray, offset Mario_right
	mov dx,mario_x
	mov pixel_startx,dx
	mov dx,mario_y
	mov pixel_starty,dx
	call removelastcreatedpixels
	mov mario_x,0
	mov mario_y,168
	call createrightmario
	GoElse2:
NotCompatble:
ret
Enemy_Collision endp
;________________________Function to Write Text in Graphics Mode________________________________
WriteString proc uses bx dx ax dx si di cx
cmp WriteGraphics_size,101
mov si,0
mov cx,WriteGraphics_size
	WriteGraphics:
	push cx
	mov bx,WriteGraphics_data
	mov al,[bx+si]
	mov bh,0
	mov bl,WriteGraphics_color
	mov cx,1
	mov ah,0ah
	int 10h
	pop cx
	add setCursorX,1
	call SetCursor
	add si,1
	loop WriteGraphics
ret
writeString endp
;_____________________________Function to control Cursor on screen___________________________
setcursor proc uses bx dx ax dx si di cx
mov bh,0
mov dh,setCursorY
mov dl,setCursorX
mov ah,02h
int 10h
ret
setcursor endp
end main