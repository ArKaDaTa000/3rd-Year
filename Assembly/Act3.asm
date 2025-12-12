.model small
.stack 100h
     .data
      pr db 'Please enter a character: $'
      num db 0Dh, 0Ah, 'You entered a number character!$'
      let db 0Dh,0Ah,  'You entered a letter character!$'
      
      
      .code
      main proc
      
   mov ax, @data
    mov ds, ax  
       
       
      mov ah, 09h
      mov dx, offset pr
     int 21h
       
   mov ah, 01h
     int 21h
      mov bl,al
      
       mov ah, 01h
       int 21h
       
   cmp bl, '0'
    jb number
     cmp bl, '9'
       jbe p_number
       
       number:
       
   mov ah, 09h
    mov dx, offset let
    int 21h
    jmp ex
       
       p_number:
       
     mov ah, 09h
     mov dx, offset num
     int 21h
       
     ex:
       
     mov ah, 4ch
     int 21h
       
     main endp
    end main