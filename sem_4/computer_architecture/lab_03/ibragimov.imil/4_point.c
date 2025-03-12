#include <omp.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>

omp_lock_t lock;

int main()
{
  omp_init_lock(&lock);

  uint8_t threadID = 0;
  char color[15] = "\0";
  #pragma omp parallel num_threads(4) private(threadID) shared(color)
  {
    uint8_t data = 0;
    while (true) {
      omp_set_lock(&lock);
      sprintf(color, "\033[48;5;%dm  \033[m", data);
      printf("Sender ID=%d:  Send %s\n", omp_get_thread_num(), color);
      data++;
      sleep(2);
      omp_unset_lock(&lock);

      omp_set_lock(&lock);
      printf("Listener ID=%d: Got %s\n", omp_get_thread_num(), color);
      sleep(2);
      omp_unset_lock(&lock);
    }
  }
  return 0;
}
