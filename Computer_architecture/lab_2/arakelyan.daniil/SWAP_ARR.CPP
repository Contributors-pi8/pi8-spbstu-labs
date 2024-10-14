#include <stdio.h>
#include <conio.h>

int main(void)
{

  clrscr();
  printf("\n\n new try \n");

  int a[5] = {0,1,2,3,4};
  int b[5] = {5,6,7,8,9};

  asm {
   lea bx, a[0]
   lea si, b[0]
   mov cx, 5

  }

  loop_point: asm {

     mov ax, ss:[bx]
     mov dx, ss:[si]

     mov ss:[bx], dx
     mov ss:[si], ax

     add bx, 2
     add si, 2

     loop loop_point

  }

  printf("\n array a: \n");
  for (int i = 0; i < 5; i++)
  {
    printf("\n %d ", a[i], "\n");
  }

  printf("\n array b: \n");
  for (int j = 0; j < 5; j++)
  {
    printf(" \n %d ", b[j], "\n");
  }


  return 0;
}