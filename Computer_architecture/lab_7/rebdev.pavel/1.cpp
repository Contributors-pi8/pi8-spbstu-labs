#include<iostream>
#include <csignal>

float a = 1.98, b = 2.35, c = 0;

void signalHandler(int signum)
{
  std::cout << "\033[1;10mResult of division on zero: " << c << "\033[0m\n";
  exit(0);
}

int main()
{
  signal(SIGFPE, signalHandler);
  __asm__
  (
    "finit\n"//Init FPU
    "flds %0\n"//a to FPU stack
    "flds %1\n"//b to FPU stack
    "faddp\n"//add two numbers from stack and put result to stack
    "fstps %2\n"//add highter stack element to c
    :/*list of output parameters*/
    :"m"(a), "m"(b), "m"(c)/*list of input parameters*/
    :/*list of using registers*/
  );
  std::cout << "\033[1;32m" << a << " + " << b << " = " << c << "\033[0m\n";

  __asm__
  (
    "fstps %0\n"
    :/*list of output parameters*/
    :"m"(c)/*list of input parameters*/
    :/*list of using registers*/
  );
  std::cout << "\033[1;31mGet nan: " << c << "\033[0m\n";

  int ctrl = 0x027A;
	a = 128.32;
	b = 0;
	__asm__
	(
		"finit\n"
		"fldcw %0\n"
		"fld %2\n"
		"fld %1\n"
		"fdiv\n"
		"fstps %3\n"
    :/*list of output parameters*/
    :"m" (ctrl), "m"(a), "m"(b), "m"(c)/*list of input parameters*/
    :/*list of using registers*/
  );
  return 0;
}
