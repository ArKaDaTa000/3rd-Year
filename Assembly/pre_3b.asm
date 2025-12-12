.model small
.stack 100h

.data
    msg1 db "THE SUM OF THREE PLUS FOUR IS EQUAL TO WHAT NUMBER?: $"
    msg2 db 0Dh,0Ah, "Please enter the second number: $"
    msg3 db 0Dh,0Ah, "Please enter the two number: $"
    resultMsg db 0Dh,0Ah, "The sum of the two number is: $"
    line db 0Dh, 0Ah, "$"

.code
main proc
    mov ax, @data
    mov ds, ax

 
    mov ah, 09h
    lea dx, msg1
    int 21h

  
    mov ah, 01h
    int 21h
    sub al, '0'       
    mov bl, al         

    
    mov ah, 09h
    lea dx, msg2
    int 21h

    
    mov ah, 01h
    int 21h
    sub al, '0'
    add bl, al         

    
    mov ah, 09h
    lea dx, msg3
    int 21h

    
    mov ah, 01h
    int 21h
    sub al, '0'
    add bl, al        

  
    mov ah, 09h
    lea dx, resultMsg
    int 21h

 
    mov ax, 0
    mov al, bl         

  
    cmp al, 10
    jl PrintOneDigit

   
    mov ah, 0
    mov dl, 10
    div dl            

    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h          

    mov al, ah        
    add al, '0'
    mov dl, al
    int 21h           
    jmp Done

PrintOneDigit:
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

Done:
  
    mov ah, 4Ch
    int 21h

main endp
end main