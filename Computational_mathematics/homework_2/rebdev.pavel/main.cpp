#include <iostream>
#include <cmath>
#include <vector>
#include <iomanip>
#include <string>

long double fact(long double x)
{
  if (x <= 0)
    return 1;
  return x * fact(x - 1);
}
long double firstDigit(long double x)
{
  std::stringstream strstr;
  strstr << x;
  std::string str = strstr.str();
  int num = 0;
  while (str[num] == '0')
  {
    ++num;
  }
  return ((str[num] - '0') / std::pow(10, num));
}
int main()
{
  std::cout.precision(8);
  int pointNumber = 0;
  std::cout << "Number of points = ";
  std::cin >> pointNumber;
  long double h = 0.1;
  std::cout << "h = ";
  std::cin >> h;
  long double x = 0;
  std::cout << "x = ";
  std::cin >> x;
  long double x0 = firstDigit(x);
  long double t = (x - x0) / h;

  std::vector< std::vector< long double > > points(pointNumber);
  for (int i = 0; i < pointNumber; ++i)
  {
    points[i] = std::vector< long double >(pointNumber - i);
    for (int j = 0; j < (pointNumber - i); ++j)
    {
      points[i][j] = 0;
    }
  }

  std::cout << "x";
  for (int i = 0; i < pointNumber; ++i)
  {
    points[0][i] = std::log(1 + x0 + h * i);
    std::cout << "\t\t" << (long double)(x0 + h * i);
  }
  std::cout << "\nf(x)";
  for (int i = 0; i < pointNumber; ++i)
  {
    std::cout << '\t' << points[0][i];
  }
  for (int i = 1; i < pointNumber; ++i)
  {
    std::cout << "\nΔ" << i << "f(x)";
    for (int j = 0; j < (pointNumber - i); ++j)
    {
      points[i][j] = points[i - 1][j + 1] - points[i - 1][j];
      std::cout << '\t' << points[i][j];
    }
  }

  long double sum = 0;
  for (int i = 0; i < pointNumber; ++i)
  {
    long double now = points[i][0];
    for (int j = 0; j < i; ++j)
    {
      now *= (t - j);
    }
    now /= fact(i);
    sum += now;
  }
  std::cout << "\n\n###\nNewton: " << sum << "\n###\n";

  sum = 0;
  for (int i = 0; i < pointNumber; ++i)
  {
      long double now = points[0][i];
      for (int j = 0; j < pointNumber; ++j)
      {
        if (j == i)
          ++j;
        if (j < pointNumber)
        {
          now *= x - (x0  + h * j);
          now /= (x0 + h * i) - (x0 + h * j);
        }
      }
      sum += now;
  }
  std::cout << "Lagrange: " << sum << "\n###\n";
  return 0;
}
