// Write a program to print all input lines that are longer than 80 characters.

#include <stdio.h>

#define MAXLINE 1000  /* maximum input line length */
#define MIN_LENGTH 80 /* minimum length to print a line */

int getLine(char line[], int maxline);

int main() {
  char line[MAXLINE];
  int len;

  while ((len = getLine(line, MAXLINE)) > 0) {
    if (len > MIN_LENGTH) {
      printf("%s", line);
    }
  }

  return 0;
}

int getLine(char s[], int lim) {
  int c, i;

  for (i = 0; i < lim - 1 && (c = getchar()) != EOF && c != '\n'; i++) {
    s[i] = c;
  }

  if (c == '\n') {
    s[i] = c;
    i++;
  }

  s[i] = '\0';

  return i;
}
