//
// Created by alexz on 14.10.2024.
//

#include <stdio.h>
#include <conio.h>

int main(void)
{
  clrscr();
  int first[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  int second[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  int far *firstPtr = (int *)first;
  int far *secondPtr = (int *)second;

  asm {
    push es
    push ds

    cld
    mov cx,10

    lds si,firstPtr
    les di,secondPtr

    rep movsw

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
