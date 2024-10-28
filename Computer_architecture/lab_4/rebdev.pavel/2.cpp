/*
  I can't write universal function, which use assembler insertion with different commands.

  Example:
  void myFunction(std::string str)
  {
    __asm__(str);
  }
  int main()
  {
    std::string str = "addq %rbx, %rax\n\t"
    myFunction(str)
  }
  Or
  int main()
  {
    myFunction("addq %rbx, %rax\n\t")
  }

  So, i know, that macros is very bad, but in this situation i haven't choice.
  P.s. don't burn my curtains please
*/
#include <iostream>
#include <chrono>

#define mainFunction(value) \
  start = timer1.now(); \
  for (size_t i = 0; i < 100; ++i) \
  { \
    __asm__ \
    ( \
      value \
      value \
      value \
      value \
      value \
      value \
      value \
      value \
      value \
      value \
    ); \
  } \
  end = timer1.now(); \
  std::cout << std::chrono::duration_cast< std::chrono::nanoseconds >(end - start).count() << " nanoseconds\n"; \
  __asm__ \
  ( \
    "movq %0, %%rax\n" \
    :"=m"(ax) \
  )

int main()
{
  std::chrono::steady_clock timer1;
  auto start = timer1.now();
  auto end = timer1.now();
  int * ax = new int;
  *ax = 0;

  std::cout << "add rax, 12 (addq $12, \%rax) 10 x 100 times: ";
  mainFunction("addq $12, %rax\n");

  std::cout << "add rax, rbx (addq \%rbx, \%rax) 10 x 100 times: ";
  int * bx = new int[11];
  bx[0] = 15;
  __asm__
  (
    "movq %0, %%rbx\n"
    :"=m"(bx)
  );//if i just try to use "addq (%rbx), %rax", without change rbx, programm is crash
  mainFunction("addq %rbx, %rax\n");

  std::cout << "add rax, [rbx] (addq (\%rbx), \%rax) 10 x 100 times: ";
  mainFunction("addq (%rbx), %rax\n");

  std::cout << "add rax, [rbx + 40] (addq 40(\%rbx), \%rax) 10 x 100 times: ";
  mainFunction("addq 40(%rbx), %rax\n");

  std::cout << "add [rbx], rax (addq %rax, (\%rbx)) 10 x 100 times: ";
  mainFunction("addq %rax, (%rbx)\n");

  std::cout << "add rax, [rbx + esi] (addq (\%rbx, \%rsi), \%rax) 10 x 100 times: ";
  __asm__
  (
    "movq $8, %rsi\n"
  );
  mainFunction("addq (%rbx, %rsi), %rax\n");

  std::cout << "add rax, [rbx + esi + 12] (addq 12(\%rbx, \%rsi), \%rax) 10 x 100 times: ";
  mainFunction("addq 12(%rbx, %rsi), %rax\n");

  delete ax;
  delete[] bx;
  return 0;
}
