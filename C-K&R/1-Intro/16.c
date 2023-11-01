// Revise the main routine of the longest-line program so it will correctly
// print the length of arbitrary long input lines, and as much as possible of
// the text.

#include <stdio.h>
#define MAXLINE 1000 /* maximum input line length */

int getLine(char line[]);
void copy(char to[], char from[]);

/* print the longest input line */
/* print the longest input line and as much text as possible */
/* print the length of arbitrary long input lines and as much text as possible
 */
int main() {
  int len;            /* current line length */
  int total_len = 0;  /* total length of all lines */
  char line[MAXLINE]; /* current input line */

  while ((len = getLine(line)) > 0) {
    total_len += len;
    printf("Length of current line: %d\n", len);
    if (total_len < MAXLINE) {
      printf("Current Text: %s", line); // Print the current line
    } else {
      printf("Reached MAXLINE length. Truncating further input.\n");
      break;
    }
  }

  printf("Total length of all lines: %d\n", total_len);
  return 0;
}

/* getLine:  read a line into s, return length  */
int getLine(char s[]) {
  int c, i;

  for (i = 0; (c = getchar()) != EOF && c != '\n'; ++i)
    s[i] = c;
  if (c == '\n') {
    s[i] = c;
    ++i;
  }
  s[i] = '\0';
  return i;
}

/* copy:  copy 'from' into 'to'; assume to is big enough */
void copy(char to[], char from[]) {
  int i;

  i = 0;
  while ((to[i] = from[i]) != '\0')
    ++i;
}
