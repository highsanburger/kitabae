// Write a program to print a histogram of the frequencies of different
// characters in its input.

#include <stdio.h>

int main() {
  int chars[256] = {0};
  int c;
  while ((c = getchar()) != EOF) {
    if (0 <= c && c <= 256) {
      chars[c]++;
    }
  }
  for (int i = 0; i < 256; i++) {
    printf("%c - %d\n", (char)i, chars[i]);
  }
}
