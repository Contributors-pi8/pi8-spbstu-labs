BITS 16
ORG 0x100

section .data
    source db 0,1,2,3,4,5,6,7,8,9
    target db 10 dup(0)

section .text
_start:
    cld
    lea si, source
    lea di, target

    rep movsb            ; Копирование байтов из [si] в [di] по 1 байту

    mov cx, 10
    lea si, target       ; Указатель на начало целевого массива

print_loop:
    mov al, [si]
    add al, '0'
    mov dl, al
    mov ah, 0x02
    int 0x21
    mov dl, ' '
    int 0x21
    inc si
    loop print_loop

    mov ax, 0x4C00
    int 0x21
