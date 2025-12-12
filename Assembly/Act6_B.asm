.model small
.stack 100h
.data
  
  
    YasUI1 dw '0', '0'
    msg db '$$$'
    proWOo1 db 'Please enter a first number: $'
    proWOo2 db 0Dh,0Ah,'Please enter a second number: $'
    ResultL db 0Dh,0Ah,'The product of the two numbers is: $'
    newline db 0Dh,0Ah,'$'

.code
main proc
    mov ax, @data
    mov ds, ax

  
    lea dx, proWOo1
    mov ah, 09h
    int 21h

    mov ah, 01h       
    int 21h
    sub al, 30h        
    mov bl, al         
    mov YasUI1[0], bx 

    
    lea dx, proWOo2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bh, al         
    mov YasUI1[2], bx 

    
    mov al, bl
    mul bh             
    mov cx, ax         

    
    lea dx, ResultL
    mov ah, 09h
    int 21h

    
    mov ax, cx
    call PrintNum

  
    mov ah, 4Ch
    int 21h
main endp


PrintNum proc
   
    mov bx, 10
    xor cx, cx
nextDigit:
    xor dx, dx
    div bx             
    push dx            
    inc cx
    test ax, ax
    jnz nextDigit

printLoop:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    loop printLoop
    ret
PrintNum endp

end main