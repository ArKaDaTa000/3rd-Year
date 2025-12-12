.model small
.stack 100h

.data
    Id_1   db 0Dh,0Ah,"ENTER YOUR ID NO: $"
    Name_2    db 0Dh,0Ah,"ENTER YOUR NAME: $"
    Age_3    db 0Dh,0Ah,"ENTER YOUR AGE: $"
    gender_4  db 0Dh,0Ah,"ENTER YOUR GENDER: $"
    Addres_5  db 0Dh,0Ah,"ENTER YOUR ADDRESS: $"
  EmployeeStatus_6   db 0Dh,0Ah,"ENTER EMPLOYEE STATUS: $"
  DailyRate_7    db 0Dh,0Ah,"ENTER YOUR DAILY RATE: $"
  DaysWorked_8   db 0Dh,0Ah,"ENTER NO. DAYS WORKED: $"

          hd       db 0Dh,0Ah,"*************************************",0Dh,0Ah
                     db "* THE FOLLOWING ARE YOUR INFORMATION *",0Dh,0Ah
                    db "*************************************",0Dh,0Ah,"$"

    Em_1    db 0Dh,0Ah,"EMPLOYEE NO.: $"
    Na_2    db 0Dh,0Ah,"NAME: $"
    AG_3    db 0Dh,0Ah,"AGE: $"
    Gn_4  db 0Dh,0Ah,"GENDER: $"
    Ad_5  db 0Dh,0Ah,"ADDRESS: $"
    St_6   db 0Dh,0Ah,"EMPLOYEE STATUS: $"
    Da_7    db 0Dh,0Ah,"DAILY RATE: $"
    Da_8   db 0Dh,0Ah,"NO. OF WORKING DAYS: $"
    Sa_9  db 0Dh,0Ah,"MONTHLY SALARY: PHP $"

    ccd11    db 30,?,30 dup('$')
    zzd11    db 30,?,30 dup('$')
    aad11    db 5,?,5 dup('$')
    gg11    db 10,?,10 dup('$')
    jj11   db 40,?,40 dup('$')
    ee11    db 15,?,15 dup('$')
    rtbf    db 10,?,10 dup('$')
    dybf    db 10,?,10 dup('$')

    slbf    db 10 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset Id_1
    mov ah, 09h
    int 21h
    mov dx, offset ccd11
    mov ah, 0Ah
    int 21h

    mov dx, offset Name_2 
    mov ah, 09h
    int 21h
    mov dx, offset zzd11
    mov ah, 0Ah
    int 21h

    mov dx, offset Age_3
    mov ah, 09h
    int 21h
    mov dx, offset aad11
    mov ah, 0Ah
    int 21h

    mov dx, offset gender_4
    mov ah, 09h
    int 21h
    mov dx, offset gg11
    mov ah, 0Ah
    int 21h

    mov dx, offset Addres_5 
    mov ah, 09h
    int 21h
    mov dx, offset jj11 
    mov ah, 0Ah
    int 21h

    mov dx, offset EmployeeStatus_6
    mov ah, 09h
    int 21h
    mov dx, offset ee11
    mov ah, 0Ah
    int 21h

    mov dx, offset DailyRate_7 
    mov ah, 09h
    int 21h
    mov dx, offset rtbf
    mov ah, 0Ah
    int 21h

    mov dx, offset DaysWorked_8
    mov ah, 09h
    int 21h
    mov dx, offset dybf
    mov ah, 0Ah
    int 21h

    lea si, rtbf+2
    xor ax, ax
    xor bx, bx
rt_lp:
    mov bl, [si]
    cmp bl, 13
    je rt_dn
    sub bl, '0'
    mov dx, 10
    mul dx
    add ax, bx
    inc si
    jmp rt_lp
rt_dn:
    mov cx, ax

    lea si, dybf+2
    xor ax, ax
    xor bx, bx
dy_lp:
    mov bl, [si]
    cmp bl, 13
    je dy_dn
    sub bl, '0'
    mov dx, 10
    mul dx
    add ax, bx
    inc si
    jmp dy_lp
dy_dn:
    mov dx, ax

    mul cx
    mov bx, ax

    lea di, slbf+9
    mov byte ptr[di], '$'
    dec di
sl_lp:
    xor dx, dx
    mov ax, bx
    mov cx, 10
    div cx
    add dl, '0'
    mov [di], dl
    dec di
    mov bx, ax
    cmp bx, 0
    jne sl_lp
    inc di

    mov dx, offset hd
    mov ah, 09h
    int 21h

    mov dx, offset  Em_1
    mov ah, 09h
    int 21h
    mov dx, offset ccd11+2
    mov ah, 09h
    int 21h

    mov dx, offset Na_2
    mov ah, 09h
    int 21h
    mov dx, offset zzd11+2
    mov ah, 09h
    int 21h

    mov dx, offset AG_3
    mov ah, 09h
    int 21h
    mov dx, offset aad11+2
    mov ah, 09h
    int 21h

    mov dx, offset Gn_4
    mov ah, 09h
    int 21h
    mov dx, offset gg11+2
    mov ah, 09h
    int 21h

    mov dx, offset Ad_5 
    mov ah, 09h
    int 21h
    mov dx, offset jj11 +2
    mov ah, 09h
    int 21h

    mov dx, offset St_6 
    mov ah, 09h
    int 21h
    mov dx, offset ee11+2
    mov ah, 09h
    int 21h

    mov dx, offset Da_7 
    mov ah, 09h
    int 21h
    mov dx, offset rtbf+2
    mov ah, 09h
    int 21h

    mov dx, offset Da_8
    mov ah, 09h
    int 21h
    mov dx, offset dybf+2
    mov ah, 09h
    int 21h

    mov dx, offset Sa_9
    mov ah, 09h
    int 21h
    mov dx, di
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main