//
// Created by Aleksandr Zagrivnyy on 14.10.2024.
//

#include <conio.h>
#include <stdio.h>

int main(void)
{
  clrscr();
  int first[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  int second[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  int far *firstPtr = (int *)first;
  int far *secondPtr = (int *)second;

  asm {
    push es           ; сохраняем значения сегментов в стек
    push ds

    cld               ; устанавливаем direction flag на 0
    mov cx,10         ; задаем счетчик для цикла

    lds si,firstPtr
    les di,secondPtr

    rep movsw       ; циклично проходимся по массиву со сдвигом 2 байта

    pop ds
    pop es
  }

  printf("first: ");
  for (int i = 0; i < 10; i++)
  {
    printf("%d ", first[i]);
  }

  printf("\nsecond: ");
  for (int i = 0; i < 10; i++)
  {
    printf("%d ", first[i]);
  }

  getch();

  return 0;
}
