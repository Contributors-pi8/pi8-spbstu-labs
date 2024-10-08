DOSSEG
.MODEL SMALL
.STACK 100h
.DATA

a db 10,242,200,15,12,124,178,221,245,92
b db 10 dup(0)

.CODE
start: 
    mov ax, @data ; segment register initialization
    mov ds, ax
    mov es, ax

    mov cx, 10
    lea si, a
    lea di, b
    cld
    rep movsb

    mov cx, 10
    mov bx, 10
    lea si, b

met1: 
    mov ax, [si] 
    mov ah, 00h
    mov dx, 0000h
                   
met2:      
    inc dl                                                         
    div bl  
    cmp al, 0
    push ax
    mov ah, 00h 
    jne met2
               
met3: 
    pop ax
    push dx
    mov dl, ah
    add dl, '0'
    mov ah, 2h
    int 21h
    pop dx
    dec dl
    cmp dl, 0
    jne met3 

    mov ah, 2h
    mov dl, ' '
    int 21h

    inc si
    loop met1 

    mov ax, 4C00h
    int 21h

END start