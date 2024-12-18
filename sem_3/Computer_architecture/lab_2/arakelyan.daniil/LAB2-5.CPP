#include <stdio.h>
#include <conio.h>

int main(void)
{
  clrscr();

  int far* aPointer = (int*) 0xb8000000;
  int far* bPointer = (int*) 0xb9000000;

  asm {

    push es
    push ds
    cld
    mov cx, 256

    lds si, aPointer
    les di, bPointer
    rep movsw

    pop ds
    pop es

  }

  return 0;
}