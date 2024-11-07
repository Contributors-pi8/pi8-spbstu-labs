#include <cstdio>

int main()
{
  int first[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  int second[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  __asm {
    lea esi,first   ; сохраняем адреса на первые значения массивов
    lea edi,second
    mov ecx,10      ; задаем счетчик для цикла

    for:
    mov edx,[esi]   ; сохраняем значение из esi в edx
    mov [edi],edx
    add esi,4       ; переходим к следующему элементу массива смещаясь на 4 байта (размер int)
    add edi,4
    loop for
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
