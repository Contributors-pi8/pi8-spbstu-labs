#include <cstdio>

int main()
{
  int first[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  int second[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  __asm {
    lea esi,first   ; сохраняем адреса на первые значения массивов
    lea edi,second
    mov ecx,10      ; задаем счетчик для цикла

    push es         ; сохраняем значение extra segment в стек
    mov ax,ds       ; сохраняем значение data segment
    mov es,ax       ; es = ds

    cld             ; устанавливаем direction flag на 0
    rep movsd       ; циклично проходимся по массиву со сдвигом 4 байта

    pop es          ; восстанавливаем external segment
  }

  printf("first: ");
  for (int i : first)
  {
    printf("%d ", i);
  }

  printf("\nsecond: ");
  for (int i : second)
  {
    printf("%d ", i);
  }

  return 0;
}
