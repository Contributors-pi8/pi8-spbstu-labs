#include <omp.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>

struct termios orig_termios;

void disableRawMode()
{
  tcsetattr(STDIN_FILENO, TCSAFLUSH, &orig_termios);
}

void enableRawMode()
{
  tcgetattr(STDIN_FILENO, &orig_termios);
  atexit(disableRawMode);

  struct termios raw = orig_termios;
  raw.c_lflag &= ~(ECHO | ICANON);

  tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);
}

int main()
{
  enableRawMode();

  // Выключить курсор
  printf("\033[?25l");

  uint8_t color = 0;
  bool alive = true;
  char c;
  #pragma omp parallel num_threads(4) shared(alive)
  {
    #pragma omp master
    {
      printf("Master: Press q to quit\n");
      while (read(STDIN_FILENO, &c, 1) == 1 && c != 'q')
      {
        alive = true;
      }
      alive = false;
    }

    #pragma omp single
    {
      while (alive)
      {
        printf("Single: Current Color = \033[48;5;%dm%3d\033[m\r", color, color);
        fflush(stdout);

        #pragma omp atomic
        color++;

        sleep(1);
      }
    }
  }
  // Включить курсор
  printf("\033[?25h");
  return 0;
}
