// Write a program to print the corresponding Celsius to Fahrenheit table.
#include <stdio.h>

int main() {

  float lower = 20;
  float step = 2;
  float upper = 80;
  float cels = lower;

  printf("Celsius -> Fahrenheit\n");
  printf("-----------------------\n");
  while (cels < upper) {
    // float fahr = 32 + (cels * 9) / 5; -- truncates
    float fahr = 32.0 + cels * (9.0 / 5.0);
    printf("%3.2f - %3.2f \n", cels, fahr);
    cels = cels + step;
  }
}
