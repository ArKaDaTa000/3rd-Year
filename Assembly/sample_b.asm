.model small
.stack 64h

.data
    msg1     db "Enter first number (0-9): $"
    msg2     db 0Dh,0Ah,"Enter second number (0-9): $"
    msg3     db 0Dh,0Ah,"What is the sum? $"
    cmsg     db 0Dh,0Ah,"Yes! Your answer is CORRECT!$"
    wmsg     db 0Dh,0Ah,"NOPE! Your answer is WRONG!$"
    errormsg db 0Dh,0Ah,"You did NOT enter a valid digit!$"

.code
main proc
    mov ax, @data
    mov ds, ax


    mov ah, 09h
    mov dx, offset msg1
    int 21h

    mov ah, 01h     
    int 21h
    mov bl, al     

    cmp bl, '0'
    jb notNum
    cmp bl, '9'
    ja notNum

    sub bl, '0'    


    mov ah, 09h
    mov dx, offset msg2
    int 21h

    mov ah, 01h
    int 21h
    mov bh, al     

    cmp bh, '0'
    jb notNum
    cmp bh, '9'
    ja notNum

    sub bh, '0'     


    mov al, bl
    add al, bh     


    mov ah, 09h
    mov dx, offset msg3
    int 21h

    mov ah, 01h
    int 21h
    mov cl, al      

    cmp cl, '0'
    jb notNum
    cmp cl, '9'
    ja notNum

    sub cl, '0'    

    cmp al, cl      
    je correct

wrong:
    mov ah, 09h
    mov dx, offset wmsg
    int 21h
    jmp exit

correct:
    mov ah, 09h
    mov dx, offset cmsg
    int 21h
    jmp exit

notNum:
    mov ah, 09h
    mov dx, offset errormsg
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp
end main
