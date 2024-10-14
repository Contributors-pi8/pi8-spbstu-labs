#include <stdio.h>
#include <conio.h>

int main(void)
{
  clrscr();

  int a[5] = {1,1,1,1,1};
  int b[5] = {0,0,0,0,0};

  int far *aPointer = (int*) a;
  int far *bPointer = (int*) b;

  asm {

    push es // save znacheni9 registrov ES and DS (extra segment and data segment)
    // chtob ne bilo problem posle, vo
    push ds
    cld // sbrasivaem flag napravlenya. chtob rabotatb s pam9tbyu po yvelicheniy
    mov cx, 5 // counter = 5

    lds si, aPointer //zakidivaem segment and smeshenie pointera a v reg segmenta DS and SI
    //posle etogo operacii s reg SI budut proishoditb v segmente na kotoriy ykazivaet DS.
    //ot adresa na kotoriy ykazivaet SI
    les di, bPointer // zakidivaem segment and smeshenie pointera b v reg segmenta ES
    // and register DI.
    rep movsw // copy po 2 byte iz adresa na kotoryi ykaz SI, v adres,
    // na kotoriy ykazivaet DI. + "sdvigaet" SI and DI posle operacii copy

    pop ds // vostanovlenye
    pop es

  }

  printf("\n array b after:\n");
  for (int i = 0; i < 5; i++)
  {
    printf("\n %d ", b[i], "\n");
  }

  return 0;
}