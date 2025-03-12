#include <omp.h>
#include <stdint.h>
#include <stdio.h>

typedef struct
{
  int8_t* values;
  uint8_t width;
  uint8_t height;
} Matrix;

int8_t sumAll(Matrix matrix);
int8_t findMax(Matrix matrix);

int main()
{
  int8_t values[64] = {
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 12, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 5, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1};

  Matrix matrix = {
      .width = 8,
      .height = 8,
      .values = values,
  };
  int8_t sum = sumAll(matrix);
  int8_t max = findMax(matrix);
  printf("Sum: %d\n", sum);
  printf("Max: %d\n", max);

  return 0;
}

int8_t sumAll(Matrix matrix)
{
  uint8_t maxThreads = 4;
  uint8_t startIndex = 0;
  uint8_t endIndex = 0;
  int8_t sum = 0;
  #pragma omp parallel for num_threads(maxThreads) private(startIndex, endIndex) shared(sum)
  for (uint8_t y = 0; y < matrix.height; y++)
  {
    startIndex = y * matrix.width;
    endIndex = startIndex + matrix.width;
    for (; startIndex < endIndex; startIndex++)
    {
      #pragma omp atomic
      sum += matrix.values[startIndex];
    }
  }
  return sum;
}

int8_t findMax(Matrix matrix)
{
  uint8_t maxThreads = 4;
  uint8_t startIndex = 0;
  uint8_t endIndex = 0;
  int8_t partialMax = 0;
  int8_t max = INT8_MIN;
  #pragma omp parallel for num_threads(maxThreads) private(startIndex, endIndex, partialMax) shared(max)
  for (uint8_t y = 0; y < matrix.height; y++)
  {
    partialMax = INT8_MIN;
    startIndex = y * matrix.width;
    endIndex = startIndex + matrix.width;
    for (; startIndex < endIndex; startIndex++)
    {
      partialMax = matrix.values[startIndex] > partialMax ? matrix.values[startIndex] : partialMax;
    }

    #pragma omp critical
    {
      max = partialMax > max ? partialMax : max;
    }
  }
  return max;
}
