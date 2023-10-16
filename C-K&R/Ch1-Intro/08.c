// Write a program to count blanks, tabs, and newlines.
#include <stdio.h>

int main() {
  int numBlanks = 0;
  int numTabs = 0;
  int numLines = 0;
  int c;
  while ((c = getchar()) != EOF) {
    if (c == ' ') {
      ++numBlanks;
    }
    if (c == '\t') {
      ++numTabs;
    }
    if (c == '\n') {
      ++numLines;
    }
  }
  printf("Number of : blanks - %d, tabs - %d, lines - %d \n", numBlanks,
         numTabs, numLines);
}
