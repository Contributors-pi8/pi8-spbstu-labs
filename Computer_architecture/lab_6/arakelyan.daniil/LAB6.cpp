#include <dos.h>
#include <conio.h>
#include <stdio.h>
#include <iostream.h>

// made on wm xp - for borland c++ compiler

void interrupt (*old_inter_0xF0)(...); // save old vector of 0xf0 interrupt vector
void interrupt (*old_inter_0x00)(...); // save old vector of 0x00 interrupt vector

int d1 = 100;
int d2 = 200;

void interrupt new_inter_0xF0(...) { // new interrupt 0xf0
  cout << "interrupt 0xF0 done.\n";

  asm {
    mov ax, d1
    mov bx, d2
    mov d1, bx
    mov d2, ax
  }

  cout << "data in interrupt after switch: a = " << d1 << " and b = " << d2 << "\n";
}

void interrupt new_div_by_zero_handler(...) { // new interrupt 0x00 (devision by zero)
  cout << "interrupt 0x00 (dev by zero!).\n";

  asm {
    mov ax, [bp+18]
    add ax, 2 // add this ti skip division by zero command
    mov [bp+18], ax
  }

  cout << "we skipped division by zero!!.\n";
}

void analyze_interrupt_0xf0() {
  cout << "interrupt 0xf0...\n";

  cout << "data befor interrupt 0xF0: a = " << d1 << " and b = " << d2 << "\n";

  asm {
    int 0xF0
  }

  cout << "data after out from interrupt 0xF0: a = " << d1 << " and b = " << d2 << "\n";
}

void analyze_div_by_zero() {
  int a = 5;
  int b = 0;
  int res = 0;

  cout << "\nintrrupt 0x00...\n";

  cout << "division by zero: " << a << " / " << b << "\n";

  res = a/b;


  cout << "result of division by zero is : " << res << "\n";
}


void main() {

  clrscr();

  old_inter_0xF0 = getvect(0xF0); // save old vector of interrupt 0xf0
  old_inter_0x00 = getvect(0x00); // save old vector of interrupt 0x00

  // new vectors setting
  setvect(0xF0, new_inter_0xF0);
  setvect(0x00, new_div_by_zero_handler);

  // interrupt 0xf0
  analyze_interrupt_0xf0();

  // interrupt division by zero
  analyze_div_by_zero();

  // recovery old interrupts vectors
  setvect(0xF0, old_inter_0xF0);
  setvect(0x00, old_inter_0x00);

  cout << "\nthis is the end\nenter some char to exit: ...\n";
  getch();

}
