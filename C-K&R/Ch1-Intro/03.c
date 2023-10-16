// Modify the temperature conversion program to print a heading above the table.
#include <stdio.h>

int main() {
  float fahr, celsius;
  float lower, upper, step;

  lower = 0;   /* lower limit of temperatuire scale */
  upper = 300; /* upper limit */
  step = 20;   /* step size */

  fahr = lower;
  printf("Fahrenheit -> Celsius\n");
  printf("-----------------------\n");
  while (fahr <= upper) {
    celsius = (5.0 / 9.0) * (fahr - 32.0);
    printf("%6.1f %9.2f\n", fahr, celsius);
    fahr = fahr + step;
  }
}
