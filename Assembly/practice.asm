.model small
.stack 100h
.data
    msg db 'the product is: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 9
    int 21h

    mov al, 5h
    mov bl, 2h

    mul bl

    mov cx, 0
    mov bx, 10

convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp al, 0
    jne convert_loop

print_loop:
    pop dx
    add dl, 30h
    mov ah, 2
    int 21h
    loop print_loop

    mov ah, 4ch
    int 21h
main endp
end main
