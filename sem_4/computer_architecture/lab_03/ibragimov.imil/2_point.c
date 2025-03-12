#include <omp.h>
#include <stdint.h>
#include <stdio.h>

void logOMPParallelForWorks(int8_t nThreads);
void logOMPParallelSectionWorks(int8_t nThreads);

int main()
{
  logOMPParallelForWorks(4);
  logOMPParallelSectionWorks(4);
  return 0;
}

void logOMPParallelForWorks(int8_t nThreads) {
  printf("OpenMP Parallel For:\n");
  printf("Current Threads amount (Before parallel): %d\n", omp_get_num_threads());
  #pragma omp parallel num_threads(nThreads) shared(nThreads)
  {
    #pragma omp for
    for (uint8_t i = 0; i < nThreads; i++)
    {
      printf("%d: ", omp_get_thread_num());
      printf("Current Threads amount (During parallel): %d\n", omp_get_num_threads());
    }
  }
  printf("Current Threads amount (After parallel): %d\n", omp_get_num_threads());
}

void logOMPParallelSectionWorks(int8_t nThreads) {
  printf("OpenMP Parallel Section:\n");
  printf("Current Threads amount (Before parallel): %d\n", omp_get_num_threads());
  #pragma omp parallel sections num_threads(nThreads)
  {
    #pragma omp section
    {
      printf("%d: ", omp_get_thread_num());
      printf("Current Threads amount (During parallel): %d\n", omp_get_num_threads());
    }
    #pragma omp section
    {
      printf("%d: ", omp_get_thread_num());
      printf("Current Threads amount (During parallel): %d\n", omp_get_num_threads());
    }
    #pragma omp section
    {
      printf("%d: ", omp_get_thread_num());
      printf("Current Threads amount (During parallel): %d\n", omp_get_num_threads());
    }
  }
  printf("Current Threads amount (After parallel): %d\n", omp_get_num_threads());
}
