DOSSEG
.MODEL TINY
.STACK 100h
.DATA

A db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
B db 10 dup(0)

.CODE
start:
    mov ax, @data ; segments init
    mov ds, ax
    mov es, ax

    cld
    lea si, A
    lea di, B
    mov cx, 10
    rep movsb

    lea si, B
    mov cx, 10

print_loop:
    mov al, [si]
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov dl, ' '
    mov ah, 02h
    int 21h

    inc si
    loop print_loop

    mov ax, 4C00h
    int 21h

END start
