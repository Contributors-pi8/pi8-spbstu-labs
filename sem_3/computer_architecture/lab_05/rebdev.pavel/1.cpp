#include <iostream>
#include <bitset>
#include <cstdlib>

#define myShl \
    /*INPUT*/ \
    "movl %edi, %ebx\n"/*Put right part of first param in ebx*/ \
    "shr $32, %rdi\n"/*Put left part of rdi to edi*/ \
    "movl %edi, %eax\n"/*Put left part of first param in eax*/ \
    "movl %esi, %ecx\n"/*Put second param in ecx*/ \
    "movl %ebx, %esi\n"/*Put left part of first param in esi*/ \
    /*eax = first[0-4]; ebx = first[5-8]; ecx = second; esi = ebx = first[5-8];*/ \
    /*SHL LOGIC*/ \
    "shl %ecx, %eax\n"/*eax = eax << ecx*/ \
    "shl %ecx, %ebx\n"/*ebx = ebx << ecx*/ \
    "push %rax\n" \
    "push %rcx\n" \
    "mov $32, %al\n"/*al = 32*/ \
    "sub %cl, %al\n"/*al = 32 - second param*/ \
    "mov %al, %cl\n"/*cl = 32 - second param*/ \
    "shr %cl, %esi\n"/*we need to put 32 - second param in cl, because shl and shr work only with numbers and cl register*/ \
    "pop %rcx\n" \
    "pop %rax\n" \
    "orl %esi, %eax\n" \
    /*OUTPUT*/ \
    "movl %eax, %ecx\n"/*Put eax in right part of rcx*/ \
    "shl $32, %rcx\n"/*Right part of rcx now left*/ \
    "orq %rbx, %rcx\n"/*Put ebx in right part of rcx(we can't use just movl %ebx, %ecx, becaus in this case first byte of rcx go to zero)*/ \
    "movq %rcx, (%rdx)\n"/*Put rcx in rdx*/ \

void printOut(unsigned long long f, int s, unsigned long long r)
{
  std::cout << "\033[1;32m***\nTen\n***\033[0m\n";
  std::cout << "first: \t\t" << f << "\nsecond: \t" << s << "\nresult: \t" << r << '\n';
  std::bitset< sizeof(unsigned long long) * 8 > fb(f);
  std::bitset< sizeof(unsigned long long) * 8 > rb(r);
  std::cout << "\033[1;32m***\nBin\n***\033[0m\n";
  std::cout << "first: \t\t" << fb << "\nresult: \t" << rb << '\n';
}
void shlWithParam(unsigned long long, int, unsigned long long &)
{
  //Parametrs of function in Linux saves in rdi, rsi, rdx, rcx
  __asm__
  (
    myShl
  );
}
void shlWithReg()
{
  __asm__
  (
    myShl
  );
}
unsigned long long gFirst = rand();
int gSecond = (rand () % 8);
unsigned long long gResult = 0;
void shlWithGlobal()
{
  __asm__
  (
    "movq %0, %%rdi\n"
    "movq %1, %%rsi\n"
    "leaq %2, %%rdx\n"
    :/*list of output parameters*/
    :"m"(gFirst), "m"(gSecond), "m"(gResult)/*list of input parameters*/
    :"rdi", "rsi", "rdx"/*list of using registers*/
  );
  __asm__
  (
    myShl
  );
}

int main()
{
  srand(time(0));
  unsigned long long first = 0;
  for (size_t i = 0; i < (rand() % 64); ++i)
  {
    first *= 10;
    first += rand() % 10;
  }
  int second = (rand () % 32);
  unsigned long long result = 0;

  std::cout << "\033[1;31mStart data:\033[0m\n";
  printOut(first, second, result);

  shlWithParam(first, second, result);
  std::cout << "\033[1;31mAfter shl with parameters:\033[0m\n";
  printOut(first, second, result);

  result = 0;
  __asm__
  (
    "movq %0, %%rdi\n"
    "movq %1, %%rsi\n"
    "leaq %2, %%rdx\n"
    :/*list of output parameters*/
    :"m"(first), "m"(second), "m"(result)/*list of input parameters*/
    :"rdi", "rsi", "rdx"/*list of using registers*/
  );
  shlWithReg();
  std::cout << "\033[1;31mAfter shl with registers:\033[0m\n";
  printOut(first, second, result);

  shlWithGlobal();
  std::cout << "\033[1;31mAfter shl with global:\033[0m\n";
  printOut(gFirst, gSecond, gResult);
  return 0;
}
