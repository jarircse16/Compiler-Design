Data segment

 msg db 0dh,0ah,"Current = $"
 msg1 db 0dh,0ah,"Resistance = $"
 result db 0dh,0ah,"Voltage = $"

Data ends
Code segment
 assume CS:Code,DS:Data
start:
 mov ax,Data 
 mov DS,ax

 mov dx,offset msg 
 mov ah,09h
 int 21h

 mov ah,01h 
 int 21h

 call AsciitoHex

 mov bl,al 
 rol bl,4

 mov ah,01h 
 int 21h

 call AsciitoHex 

 add bl,al 

 mov dx,offset msg1 
 mov ah,09h
 int 21h

 mov ah,01h 
 int 21h

 call AsciitoHex 
 mov cl,al
 rol cl,4

 mov ah,01h 
 int 21h

 call AsciitoHex 

 add cl,al 

 mov al,bl 
 mov bl,cl
 mul bl

 mov cx,ax 

 mov dx,offset result 
 mov ah,09h
 int 21h

 and ax,0f000h 
 ror ax,12

 mov bl,al 
 call AsciiConv 

 mov dl,bl 
 mov ah,02h
 int 21h

 mov ax,cx 

 and ax,0f00h 
 ror ax,8

 mov bl,al 
 call AsciiConv 

 mov dl,bl 
 mov ah,02h
 int 21h

 mov ax,cx 

 and ax,00f0h 
 ror ax,4

 mov bl,al 
 call AsciiConv 

 mov dl,bl 
 mov ah,02h
 int 21h

 mov ax,cx 

 and ax,000fh 

 mov bl,al 
 call AsciiConv 

 mov dl,bl 
 mov ah,02h
 int 21h

 mov ah,4ch 
 int 21h

 AsciiConv proc 
  cmp bl,0ah 
  jc skip
  add bl,07h
  skip: add bl,30h
  ret
  endp

 AsciitoHex proc 
  cmp al,41h 
  jc skippy
  sub al,07h
  skippy: sub al,30h
  ret
  endp
Code ends
end start