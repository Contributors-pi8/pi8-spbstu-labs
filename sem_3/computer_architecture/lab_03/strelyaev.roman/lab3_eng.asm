DOSSEG
.MODEL TINY
.STACK 100h
.DATA

a db 1,2,3,4,5,6,7,8,9,0
b db 10 dup(0) ; array b is initialized with ten zeros

mcr macro ; es & ds initialization
mov ax, @data
mov ds, ax
mov es, ax
endm

.CODE
start: mcr
mov cx, 10
lea si, a
lea di, b
cld
rep movsb

mov cx, 10
mov bx, 10
lea si, b

p1:
mov ax, [si]
mov ah, 00h
mov dx, 0000h

p2:
inc dl
div bl ; ax devided by bl, mod is in ah, result in al; 122/b(10) = ah(2), al(12)
cmp al, 0
push ax
mov ah, 00h ; pushing ax(ah) to stack so we have: 122 stack = {1, 2 ,2} ? ? dx = 3
jne p2

p3:
pop ax
push dx
mov dl, ah
add dl, '0' ; ?converting to ASCII
mov ah, 2h
int 21h ; code previvaniya dlya vivoda na ekran
pop dx
dec dl
cmp dl, 0
jne p3

mov ah, 2h ; symbol output function
mov dl, ' '
int 21h ; call prerivanie with args in ah from dl

inc si ; next element in thearray b
loop p1

mov dl, 97
mov ah, 2h
int 21h

mov ax, 4C00H ; ????????? ?????? ????????, ??-?? ?????????? ?????? ???
int 21h

END start

