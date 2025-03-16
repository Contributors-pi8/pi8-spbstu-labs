#include <iostream>
#include <conio.h>
#include <omp.h>
#include <stdio.h>
#include <windows.h>

void foo()
{
  for (int i = 0; i < 500000; i++)
  {
    rand();
  }
}

int main()
{
  std::setlocale(LC_ALL, "rus");

  omp_set_num_threads(4);

  #pragma omp parallel
  {
    #pragma omp sections nowait
    {
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 1;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 2;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 3;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 4;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 5;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 6;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 7;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 8;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 9;
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 'A';
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 'B';
        foo();
      }
      #pragma omp section
      for (int i = 0; i < 5; i++)
      {
        std::cout << 'C';
        foo();
      }
    }
    #pragma omp barrier
    for (int i = 0; i < 1; i++)
    {
      std::cout << " BARRIER ";
      foo();
    }
  }
  std::cout << '\n';
  int k = 0;
  omp_set_num_threads(2);
  #pragma omp parallel
  {
    #pragma omp atomic
    k++;
    #pragma omp atomic
    k++;
    #pragma omp critical // Отменяет гачи-мучи борьбу за cout;
    {
      std::cout << k << '\n';
    }
  }

  omp_set_num_threads(4);
  omp_lock_t lock;
  int n;
  omp_init_lock(&lock);
  #pragma omp parallel private(n)
  {
    n = omp_get_thread_num();
    while (!omp_test_lock(&lock))
    {
      std::cout << '\n'
                << "WAITING : NUMBER OF THREADS: " << n;
      Sleep(3);
    }
    std::cout << '\n'
              << "Start work. Threads number is: " << n;
    Sleep(5);
    std::cout << '\n'
              << "End work. Threads nubmer is: " << n;
    omp_unset_lock(&lock);
  }
  omp_destroy_lock(&lock);
}