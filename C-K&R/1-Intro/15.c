// Rewrite the temperature conversion program of Section 1.2 to use a function
// for conversion.

#include <stdio.h>

float fahr2cels(float fah) {
  float cels = (5.0 / 9.0) * (fah - 32.0);
  return cels;
}

/* print Fahrenheit-Celsius table
    for fahr = 0, 20, ..., 300; floating-point version */
int main() {
  float fahr, celsius;
  float lower, upper, step;

  lower = 0;   /* lower limit of temperatuire scale */
  upper = 300; /* upper limit */
  step = 20;   /* step size */

  fahr = lower;
  while (fahr <= upper) {
    celsius = fahr2cels(fahr);
    printf("%3.0f %6.1f\n", fahr, celsius);
    fahr = fahr + step;
  }
}
