// Write a program to print a histogram of the lengths of words in its input. It
// is easy to draw the histogram with the bars horizontal; a vertical
// orientation is more challenging.

#include <stdio.h>
int c, count;
int hist[20] = {0};
int main() {
  while ((c = getchar()) != EOF) {
    if (c == ' ' || c == '\n') {
      hist[count]++;
      count = 0;
    } else {
      count++;
    }
  }
  for (int i = 1; i < 20; i++) {
    printf("%d - %d \n", i, hist[i]);
  }
}
