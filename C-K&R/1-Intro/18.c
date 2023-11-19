// Write a program to remove trailing blanks and tabs from each line of input,
// and to delete entirely blank lines.

#include <stdio.h>

int main() {
  int c;
  while ((c = getchar()) != EOF) {
    if (c == '\t') {
      c = '0';
    }
    putchar(c);
  }
}

int getlien(char s[], int lim) {
  int c, i;
  for (i = 0; i < lim - 1 && (c = getchar()) != EOF && c != '\n'; i++) {
    s[i] = c;
    if (c == '\n') {
      s[i] = c;
      i++;
    }
  }
}
