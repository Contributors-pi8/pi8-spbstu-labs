#include <iostream>
#include <unistd.h>
#include <csignal>

void signalHandler(int signum)
{
  std::cout << "\033[1;32m";
  std::cout << "SIGTRAP find";
  std::cout << "\033[0m\n";
  unsigned short ax_data = 0, bx_data = 0;
  __asm__
  (
    "mov %%ax, %0\n"
    "mov %%bx, %1\n"
    :"=r"(ax_data), "=r"(bx_data)
  );
  std::cout << "ax: " << ax_data <<"; bx: " << bx_data << '\n';
  std::cout << "\033[1;31mi";
  std::cout << "SIGTRAP end";
  std::cout << "\033[0m\n";
}

int main()
{
  signal(SIGTRAP, signalHandler);
  std::cout << "\033[1;36m";
  std::cout << "This programm has next struct: set TF as 1, use 6 commands, set TF as 0 (5 commands)";
  std::cout << "\033[0m\n";
  __asm__
  (
    "pushf\n"// push flags to stack
    "pop %rax\n"// put flags from stack to eax
    "or $0x100, %rax\n"// TF = 1
    "push %rax\n"// put eax to stack
    "popf\n"// get flags from stack
  );
  __asm__
  (
    "mov $100, %ax\n"
    "mov $100, %bx\n"
    "add $100, %ax\n"
    "add $100, %bx\n"
    "add $100, %ax\n"
    "add $100, %bx\n"
  );
  __asm__
  (
    "pushf\n"// push flags to stack
    "pop %rax\n"// put flags from stack to eax
    "and $0xFEFF, %rax\n"// TF = 1
    "push %rax\n"// put eax to stack
    "popf\n"// get flags from stack
  );
  std::cout << "Programm is end\n";
  return 0;
}
