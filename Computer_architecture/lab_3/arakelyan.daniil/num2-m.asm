DOSSEG
.MODEL SMALL
.STACK 100h
.DATA
  A db 0,1,2,3,4,5,6,7,8,9
  B db 0,0,0,0,0,0,0,0,0,0
  
  arrayAString db 'This is array A: $'
  arrayBString db 'This is array B: $'
  
  moveEndMessage db 'Data moved from A to B. Now array B contain this data: $'


PRINT_STRING MACRO string

  push dx

  mov ah, 09h
  mov dx, OFFSET string
  int 21h
  
  pop dx

ENDM

PRINT_ARRAY MACRO array, size, counter

  LOCAL print_label

  push si

  mov cx, size
  lea si, array

loop_label&counter:

  mov al, [si] ; преобразование в числа в ascii код. вот у нас в al 5.
  add al, '0' ; тут добавляем '0' = 30h (hex) и получается так, что у нас в al: 5 + 30h = 35h, а это число 5 в ascii таблице 
  mov dl, al ; тут копируем в dl. dl используем для передачи данных в функцию вывода BIOS
  mov ah, 02h ; закидываем в ah функцию для вывода одного символа на экран. а символ как раз в dl
  int 21h ; программное прерывание, "в котором" функция вывода одного символа

  mov dl, ' ' ; для вывода пробела после вывода числа
  mov ah, 02h
  int 21h

  inc si ; увеличиваем значение si для перехода к сл элементу массива
  loop loop_label&counter ; looooooooooooop

  mov dl, 0Dh ; перемещаем курсор в начало
  mov ah, 02h ; выводим символ
  int 21h

  mov dl, 0Ah ; символ перевода строки
  mov ah, 02h ; выводим этот символ 
  int 21h
  
  pop si

ENDM

.CODE
start:
  mov ax, @data ; загружаем адрес сегмента данных в регистр ax. из data в ax
  mov ds, ax ; загружаем ax в регистр сегмента данных ds (dsta segment)
  mov es, ax ;  загружаем ax в регистр сегмента данных es (external segment)
  
  PRINT_STRING arrayAString
  PRINT_ARRAY A, 10, 1

  PRINT_STRING arrayBString
  PRINT_ARRAY B, 10, 2
  
  cld ; как во второй лабе, перессылка
  lea si, A
  lea di, B
  mov cx, 10
  rep movsb
  
  PRINT_STRING moveEndMessage
  PRINT_ARRAY B, 10, 3
  
  mov ax, 4C00h
  int 21h

END start