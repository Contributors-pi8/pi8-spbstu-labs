#include <stdio.h>
#include <conio.h>

int main(void)
{
  clrscr();

  int a[5] = {1, 2, 3, 4, 5};
  int b[5] = {0, 0, 0, 0, 0};

  printf("\n array a: \n");
  for (int i = 0; i < 5; i++)
  {
    printf("\n %d ", a[i], "\n");
  }

  printf("\n\n array b before: \n");
  for (int j = 0; j < 5; j++)
  {
    printf("\n %d ", b[j], "\n");
  }

  asm {

    cld //flag clear direction flag ystonavl flag napravlenya v 0 =>
    //operacii budut proishodit po yvelicheniy. posle kajdoi operacii
    //ykazateli si and di budut idti vpered

    mov cx, 5 // counter = 5
    lea si, a[0] // pointer to a[0]
    lea di, b[0] // pointer to b[0]

    //push ds  // save data segment on stack => posle vipolnenya smojem
    // vosstanotitb ishodnyi segment dannih
    mov ax, es // ex v ax. es - extra segment.
    mov ds, ax // ax v ds. ds = es => ds and es ykazivayut na odin segment dannih

    rep movsw // copy from SI into DI. povroeyaem count (=5) raz.
    // movsw copy po 2 byte (slovo). chuvstvitelbna k flagam. sbrosili ih
    // chtob ne bilo prerivanya

    //pop ds //vosstanavlivaem ishodnoe znachenie reg DS iz stecka.
  }


  printf("\n\n array b after: \n");
  for (int k = 0; k < 5; k++)
  {
    printf(" \n %d ", b[k], "\n");
  }

  return 0;
}