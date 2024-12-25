#include <stdio.h>

int main(void)
{
  int a[5] = {1,1,1,1,1};
  int b[5] = {0,0,0,0,0};

  asm {
    lea bx, a[0] // zakinyli adres na a[0] v regisster bx
    lea si, b[0] // adres b[0] zakinuli v si
    mov cx, 5  // make counter = 5
  }

  label: asm {
    mov ax, ss:[bx] //v ax zakidivaem znachenie po adresu bx
    mov ss:[si], ax // tyt sohranyaem znachenie iz ax v si
    add bx, 2 //perehod k sled elementy v massive a
    add si, 2 // perehod k sled elementy v massive b
    loop label // if cx != 0 => perehodim op9tb k nachaly "label"
  }

  printf("\n array a:");
  for (int i = 0; i < 5; i++)
  {
    printf("\n %d ", a[i], "\n");
  }

  printf("\n array b:");
  for (int j = 0; j < 5; j++)
  {
    printf("\n %d ", b[i], "\n");
  }


  return 0;

}