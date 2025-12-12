.model small
.stack 64h

.data
    prompt DB "WHAT IS YOUR NGALAN?: $"
    response DB 0Ah, "Your Name is: $"
    nameInput DB 20, ?, 20 DUP(?) 
.code
begin proc
    mov ax, @data
    mov ds, ax

   
    mov ah, 09h
    mov dx, offset prompt
    int 21h

    
    lea dx, nameInput
    mov ah, 0Ah
    int 21h

    ; Add '$' 
    mov si, offset nameInput     
    mov cl, [si+1]                
    mov ch, 0
    add si, 2                  
    add si, cx                    
    mov byte ptr [si], '$'       ; Add '$' 

    ; Print "Your Name is:"
    mov ah, 09h
    mov dx, offset response
    int 21h

  
    mov ah, 09h
    lea dx, nameInput + 2
    int 21h

   
    mov ah, 4Ch
    int 21h
begin endp
end begin