// Modify the temperature conversion program to print the table in reverse
// order, that is, from 300 degrees to 0.

#include <stdio.h>

int main(void) {
  for (double fahr = 300; fahr > 0; fahr = fahr - 20) {
    printf("%6.1f %9.2f\n", fahr, (5.0 / 9.0) * (fahr - 32.0));
  }
}
