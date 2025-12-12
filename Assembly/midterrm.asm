.model small
.stack 100h
.data
type db 0Dh,0Ah,"Please choose your type of operation:$"
prompt db 0Dh,0Ah,"              1. Addition; 2. Subtraction; 3. Multiplication; 4. Division$"
prompt2 db 0Dh,0Ah,"Please enter a number that corresponds to the type of operation:$"
space db 0Dh,0Ah,"$"

A1 db 0Dh,0Ah,"Please enter a first number:$"
A2 db 0Dh,0Ah,"Please enter a second number:$"
A3 db 0Dh,0Ah,"The sum of the two numbers is:$"
addition db 0Dh,0Ah,"You chose Addition!$"

S1 db 0Dh,0Ah,"Please enter a first number:$"
S2 db 0Dh,0Ah,"Please enter a second number:$"
S3 db 0Dh,0Ah,"The difference of the two numbers is:$"
subtraction db 0Dh,0Ah,"You chose Subtraction!$"

Frst db 0Dh,0Ah,"Please enter first number:$"
Sec db 0Dh,0Ah,"Please enter second number:$"
Prod db 0Dh,0Ah,"The product of the two numbers is:$"
multiplication db 0Dh,0Ah,"You chose Multiplication!$"

result db '00','$'

divisionn db 0Dh,0Ah,"You chose Division!$"
msg1 db 0Dh,0Ah,"Please enter first number:$"
msg2 db 0Dh,0Ah,"Please enter second number:$"
msgQ db 0Dh,0Ah,"The quotient is:$"



.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,09h
    mov dx,offset type
    int 21h
    mov ah,09h
    mov dx,offset space
    int 21h
    mov ah,09h
    mov dx,offset prompt
    int 21h
    mov ah,09h
    mov dx,offset space
    int 21h
    mov ah,09h
    mov dx,offset prompt2
    int 21h
    mov ah,09h
    mov dx,offset space
    int 21h
    mov ah,01h
    int 21h
    mov bl,al

    cmp bl,'1'
    je ADDITION
    cmp bl,'2'
    je SUBTRACTION
    cmp bl,'3'
    je MULTIPLICATION
    cmp bl,'4'
    jmp DIVISIONS

    

    
    jmp exit

ADDITION:
    mov ah,09h
    mov dx,offset addition
    int 21h
    mov ah,09h
    mov dx,offset A1
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    mov ah,09h
    mov dx,offset A2
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al
    add bl,cl
    add bl,30h
    mov ah,09h
    mov dx,offset A3
    int 21h
    mov dl,bl
    mov ah,02h
    int 21h
    jmp exit

SUBTRACTION:
    mov ah,09h
    mov dx,offset subtraction
    int 21h
    mov ah,09h
    mov dx,offset S1
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    mov ah,09h
    mov dx,offset S2
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al
    sub bl,cl
    add bl,30h
    mov ah,09h
    mov dx,offset S3
    int 21h
    mov dl,bl
    mov ah,02h
    int 21h
    jmp exit

MULTIPLICATION:
    mov ah,09h
    mov dx,offset multiplication
    int 21h
    mov ah,09h
    mov dx,offset Frst
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    mov ah,09h
    mov dx,offset Sec
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al
    mov al,bl
    mul cl
    aam
    add ax,3030h
    xchg ah,al
    mov word ptr[result],ax
    mov ah,09h
    mov dx,offset Prod
    int 21h
    mov ah,09h
    mov dx,offset result
    int 21h
    jmp exit

DIVISIONS:
    mov ah,09h
    mov dx,offset divisionn
    int 21h

    mov dx,offset msg1
    mov ah,09h
    int 21h
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        .model small
.stack 100h
.data
type db 0Dh,0Ah,"Please choose your type of operation:$"
prompt db 0Dh,0Ah,"              1. Addition; 2. Subtraction; 3. Multiplication; 4. Division$"
prompt2 db 0Dh,0Ah,"Please enter a number that corresponds to the type of operation:$"
space db 0Dh,0Ah,"$"

A1 db 0Dh,0Ah,"Please enter a first number:$"
A2 db 0Dh,0Ah,"Please enter a second number:$"
A3 db 0Dh,0Ah,"The sum of the two numbers is:$"
addition db 0Dh,0Ah,"You chose Addition!$"

S1 db 0Dh,0Ah,"Please enter a first number:$"
S2 db 0Dh,0Ah,"Please enter a second number:$"
S3 db 0Dh,0Ah,"The difference of the two numbers is:$"
subtraction db 0Dh,0Ah,"You chose Subtraction!$"

Frst db 0Dh,0Ah,"Please enter first number:$"
Sec db 0Dh,0Ah,"Please enter second number:$"
Prod db 0Dh,0Ah,"The product of the two numbers is:$"
multiplication db 0Dh,0Ah,"You chose Multiplication!$"

result db '00','$'

divisionn db 0Dh,0Ah,"You chose Division!$"
msg1 db 0Dh,0Ah,"Please enter first number:$"
msg2 db 0Dh,0Ah,"Please enter second number:$"
msgQ db 0Dh,0Ah,"The quotient is:$"



.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,09h
    mov dx,offset type
    int 21h
    mov ah,09h
    mov dx,offset space
    int 21h
    mov ah,09h
    mov dx,offset prompt
    int 21h
    mov ah,09h
    mov dx,offset space
    int 21h
    mov ah,09h
    mov dx,offset prompt2
    int 21h
    mov ah,09h
    mov dx,offset space
    int 21h
    mov ah,01h
    int 21h
    mov bl,al

    cmp bl,'1'
    je ADDITION
    cmp bl,'2'
    je SUBTRACTION
    cmp bl,'3'
    je MULTIPLICATION
    cmp bl,'4'
    jmp DIVISIONS

    

    
    jmp exit

ADDITION:
    mov ah,09h
    mov dx,offset addition
    int 21h
    mov ah,09h
    mov dx,offset A1
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    mov ah,09h
    mov dx,offset A2
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al
    add bl,cl
    add bl,30h
    mov ah,09h
    mov dx,offset A3
    int 21h
    mov dl,bl
    mov ah,02h
    int 21h
    jmp exit

SUBTRACTION:
    mov ah,09h
    mov dx,offset subtraction
    int 21h
    mov ah,09h
    mov dx,offset S1
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    mov ah,09h
    mov dx,offset S2
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al
    sub bl,cl
    add bl,30h
    mov ah,09h
    mov dx,offset S3
    int 21h
    mov dl,bl
    mov ah,02h
    int 21h
    jmp exit

MULTIPLICATION:
    mov ah,09h
    mov dx,offset multiplication
    int 21h
    mov ah,09h
    mov dx,offset Frst
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    mov ah,09h
    mov dx,offset Sec
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al
    mov al,bl
    mul cl
    aam
    add ax,3030h
    xchg ah,al
    mov word ptr[result],ax
    mov ah,09h
    mov dx,offset Prod
    int 21h
    mov ah,09h
    mov dx,offset result
    int 21h
    jmp exit

DIVISIONS:
    mov ah,09h
    mov dx,offset divisionn
    int 21h

    mov dx,offset msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,'0'
    mov bl,al

    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,'0'
    mov cl,al

    mov al,bl
    xor ah,ah
    mov dl,cl
    div dl

    mov dx,offset msgQ
    mov ah,09h
    int 21h

    mov dl,al
    add dl,'0'
    mov ah,02h
    int 21h
    jmp exit
    


exit:
    mov ah,4Ch
    int 21h

main endp
end main
    mov ah,01h
    int 21h
    sub al,'0'
    mov bl,al

    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,'0'
    mov cl,al

    mov al,bl
    xor ah,ah
    mov dl,cl
    div dl

    mov dx,offset msgQ
    mov ah,09h
    int 21h

    mov dl,al
    add dl,'0'
    mov ah,02h
    int 21h
    jmp exit
    


exit:
    mov ah,4Ch
    int 21h

main endp
end main