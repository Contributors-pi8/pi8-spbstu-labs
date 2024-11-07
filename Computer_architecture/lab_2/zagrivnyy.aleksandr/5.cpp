#include <conio.h>

int main(void)
{
  clrscr();

  int *src = (int *)0xB8000;
  int *dest = (int *)0xB9000;

  asm {
    push es     ; сохраняем значения сегментов в стек
    push ds

    cld         ; устанавливаем direction flag на 0
    mov cx,256  ; задаем счетчик для цикла

    lds si,src
    les di,dest
    rep movsw   ; циклично проходимся по массиву со сдвигом 2 байта

    pop ds      ; восстанавливаем значения сегментов из стека
    pop es
  }

  getch();

  return 0;
}
