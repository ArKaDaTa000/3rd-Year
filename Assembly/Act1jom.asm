.model small 
.stack 64h

.data
   print DB 1 dup("$")
   pls DB "WHATS YOUR NAME? " ODH,0AH,"$"
   ent DB 0AH, 0DH, "Your name is: ",0DH, 0AH, "$"
   space DB 0DH, 0AH, "($)"
  
    .code
    begin proc near
                
                mov ax,@data
                mov dx,ax
                
                
                
                
                
                mov dx, offset pls
                mov ah, 09h
                int 21h
                
                mov dx, offset print
               
                mov ah, 0ah
                int 21h
                
                mov dx, offset space
                mov ah, 09h
                int 21h
                
                mov dx, offset ent
                mov ah, 09h
                int 21h
                
                mov dx, offset print + 2
                
                xor ch, ch
                
                mov cl, print + 1
               
                mov cl,40h 
                mov bx, 1
                int 21h
                
                mov ah, 4ch
                int 21h
                
    begin endp
    
end begin