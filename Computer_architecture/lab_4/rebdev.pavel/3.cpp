#include <iostream>
#include <string>

void buityOutput(std::string str)
{
  for (size_t i = 0; i < (str.size() + 2); ++i) std::cout << '#';
  std::cout << "\n#" << str << "#\n";
  for (size_t i = 0; i < (str.size() + 2); ++i) std::cout << '#';
  std::cout << '\n';
}
void fillArr(int * arr, int lines, int colums)
{
  for (int i = 0; i < (lines * colums); ++i)
  {
    arr[i] = i;
  }
}
void printArr(int * arr, int lines, int colums)
{
  for (int i = 0; i < lines; ++i)
  {
    for (int j = 0; j < colums; ++j)
    {
      std::cout << "arr[" << i << "][" << j << "] = " << arr[i * colums + j] << '\t';
    }
    std::cout << '\n';
  }
}

int main()
{
  const int lines = 6, colums = 3;
  std::cout << "matrix size: " << lines << 'x' << colums << '\n';
  int arr[lines][colums];

  fillArr(*arr, lines, colums);
  buityOutput(std::string("Base array:"));
  printArr(*arr, lines, colums);
  __asm__
  (
    "leaq %0, %%rsi\n"//rsi = arr
    "movq %1, %%rax\n"//rax = lines
    "movq $0, %%rdx\n"
    "movq $2, %%rcx\n"
    "divq %%rcx\n"// rax = rdx:rax / rcx; rdx = rdx:rax % rcx
    "movq %%rax, %%rcx\n"


    "mainLoop:\n"
      "push %%rcx\n"// we use counter register in other context, so we need to save it

      "movq %2, %%rax\n"
      "movq $0, %%rdx\n"
      "movq $4, %%rcx\n" //rcx = sizeof(int)
      "mulq %%rcx\n" //rdx:rax = rax * rcx
      "addq %%rax, %%rsi\n"//skip array line(*rsi + colums * sizeof(int))

      "movq %2, %%rcx\n"
      "subq $1, %%rcx\n"//rcx = colums - 1

      "localLoop:\n"
        "movq $0, (%%rsi)\n"//*rsi = 0
        "addq $4, %%rsi\n"//*rsi += sizeof(int)
        "loop localLoop\n"
      "addq $4, %%rsi\n"

      "pop %%rcx\n"
      "loop mainLoop\n"
    :/*list of output parameters*/
    :"m"(arr), "i"(lines), "i"(colums)/*list of input parameters*/
    :"rsi", "rax", "rcx"/*list of using registers*/
  );
  buityOutput(std::string("Array after first fill:"));
  printArr(*arr, lines, colums);

  fillArr(*arr, lines, colums);
  __asm__
  (
    "leaq %0, %%rdi\n"//rdi = arr
    "movq %1, %%rax\n"//rax = lines
    "movq $0, %%rdx\n"
    "movq $2, %%rcx\n"
    "divq %%rcx\n"// rax = rdx:rax / rcx; rdx = rdx:rax % rcx
    "movq %%rax, %%rcx\n"

    "mainLoop2:\n"
      "push %%rcx\n"

      "movq %2, %%rax\n"
      "movq $0, %%rdx\n"
      "movq $4, %%rcx\n" //rcx = sizeof(int)
      "mulq %%rcx\n"
      "addq %%rax, %%rdi\n"//next array line(*rsi + colums * sizeof(int))

      //stosq moves 64 bits, but int is 32 bits, so, we just divide rcx to 2 [ (32 * colums) == ((64 * colums) / 2) ]
      "movq %2, %%rax\n"
      "movq $0, %%rdx\n"
      "movq $2, %%rcx\n"
      "divq %%rcx\n"// rax = rdx:rax / rcx; rdx = rdx:rax % rcx
      "movq %%rax, %%rcx\n"


      "movq $0, %%rax\n"
      "rep stosq\n"//stosq moves 64 bits from rax to rdi

      "pop %%rcx\n"
      "loop mainLoop2\n"
    :/*list of output parameters*/
    :"m"(arr), "i"(lines), "i"(colums)/*list of input parameters*/
    :"rsi", "rax", "rcx"/*list of using registers*/
  );
  buityOutput(std::string("Array after second fill:"));
  printArr(*arr, lines, colums);

  return 0;
}
