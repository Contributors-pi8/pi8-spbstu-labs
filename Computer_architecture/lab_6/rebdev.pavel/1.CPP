#include <dos.h>
#include <conio.h>
#include <stdio.h>

int first = 15, second = 20, sum = 0;
void interrupt new0xF0(...)
{
  printf("Find 0xF0\n");
  asm {
    mov ax, first
    mov bx, second
    lea si, sum
    add [si], ax
    add [si], bx
  }
}

void interrupt new0x00(...)
{
  printf("Find 0x00\n");
  asm {
    mov ax, [bp+18]
    add ax, 2
    mov [bp+18], ax
  }
}

void main()
{
  //save old vectors
  void interrupt (*old0xF0)(...);
  old0xF0 = getvect(0xF0);
  void interrupt (*old0x00)(...);
  old0x00 = getvect(0x00);

  //set new vectors
  setvect(0xF0, new0xF0);
  setvect(0x00, new0x00);

  //main
  printf("first, second and sum before 0xF0: %d %d %d \n", first, second, sum);
  printf("Go to 0xF0\n");
  asm {
    int 0xF0
  }
  printf("first, second and sum after 0xF0: %d %d %d \n", first, second, sum);
  int a = 15, b = 0, c = 0;
  printf("a, b, c before devision: %d %d %d \n", a, b, c);
  c = a / b;
  printf("a, b, c after devision: %d %d %d \n", a, b, c);

  //set old interrupts vectors
  setvect(0xF0, old0xF0);
  setvect(0x00, old0x00);
  getch();
}
