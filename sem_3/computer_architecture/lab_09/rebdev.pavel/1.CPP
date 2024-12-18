#include <stdio.h>
#include <conio.h>
#include <dos.h>
#include <bios.h>
#include <time.h>

int main()
{
  //SCAN AND ASCII
  printf("Print any key to get it's ascii and scan code.\nTo end programm press esc\n");
  char scan = 0, ascii = 0, status = 0;
  int adress = 0;
  while(getch() != 27)
  {
    asm {
      push ds
      push si
      push di
      mov ax, 0x40
      mov ds, ax
      mov si, 0x1A
      mov di, 0x1C
    }
    wait_kbd:
      asm {
        mov ax, [si]
        cmp ax, [di]
        je wait_kbd
        mov si, [si]
      }
    adress = _SI;
    asm {
        mov ax, [si]
        mov si, 0x17
        mov bx, [si]
        pop di
        pop si
        pop ds
    }
    scan = _AH;
    ascii = _AL;
    status = _BL;
    printf("adress = %x scan code = %d ASCII = %d\n", adress, scan, ascii);
    printf("status %x\n", status);
  }



  //KEYBOARD LOCKING
  printf("Now let's test keyboard locking for ten second\n");
	time_t timer = time(NULL);
  int timeOut = 0;
	outp(0x60, 0xF5);
	while(timeOut < 10)
	{
    if ((time(0) - timer) != timeOut)
    {
      timeOut = (time(0) - timer);
      printf("%d seconds\n", timeOut);
    }
	}
  printf("Keyboard is unclocking\n");
  outp(0x60, 0xF6);



  //CAPS LOCK and NUM LOCK
  char sym = 0;
	while ((sym != 'q') && (sym != 'Q'))
	{
    switch (sym)
    {
      case 'c':
      case 'C':
        outp(0x60, 0xED);
        outp(0x60, 0x04);
        break;
      case 'n':
      case 'N':
        outp(0x60, 0xED);
        outp(0x60, 0x02);
        break;
      default:
        printf("%c\n", sym);
        break;
    }
    sym = getchar();
	}
  printf("Programm has ended\n");
  getchar();
	return 0;
}
