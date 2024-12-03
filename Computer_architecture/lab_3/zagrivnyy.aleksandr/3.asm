BITS 16
ORG 0x100

section .data
    source db 0, 1, 2, 100, 24, 5, 156, 78, 9, 10
    target db 10 dup(0)

section .text
_start:
    cld
    lea si, source
    lea di, target

    rep movsb            ; Копирование байтов из [si] в [di] по 1 байту

    mov cx, 10
    mov bx, 10
    lea si, target

read_ints:
    mov ax, [si]
    mov ah, 0
    mov dx, 0

split_int:
    inc dl               ; Счетчик разрядов
    div bl               ; Делим ax на bl (10) -> результат в al, а остаток в ah
    cmp al, 0
    push ax
    mov ah, 0
    jne split_int        ; Если al != 0, то повторяем деление

print_int:
    pop ax
    push dx

    mov dl, ah
    add dl, '0'
    mov ah, 0x02
    int 0x21

    pop dx
    dec dl               ; Уменьшаем счетчик разрядов
    cmp dl, 0
    jne print_int        ; Если dl != 0, то повторяем

    mov dl, ' '
    mov ah, 0x02
    int 0x21

    inc si
    loop read_ints       ; Повторяем цикл, пока cx не станет равно 0

    mov ax, 0x4C00       ; Функция завершения программы с кодом 0
    int 0x21
