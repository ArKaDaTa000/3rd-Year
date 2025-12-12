.model small

.stack 100h

.data
   
    msg1 db "Please enter first number: $"
    msg2 db 0dh,0ah,"Please enter second number: $"
    msg3 db 0dh,0ah,"The quotient is: $"
    result db ?
    space db 0dh,0ah,"$"
    
    num1 db ?
    num2 db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov dx, offset space
    
    mov ah,09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h     
    mov num1, al

   
    mov ah, 09h
    lea dx, msg2
    int 21h

    mov dx, offset space 
    
    mov ah,09h
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h     
    mov num2, al

   
    mov al, num1
    mov bl, num2
    mov ah, 0
    div bl           
    mov result, al

    
    mov ah, 09h
    lea dx, msg3
    int 21h

    mov dx, offset space
    
    mov ah,09h
    int 21h
    
    mov dl, result
    add dl, 30h      
    mov ah, 02h
    int 21h

    
    mov ah, 4Ch
    int 21h

    
    main endp
end main