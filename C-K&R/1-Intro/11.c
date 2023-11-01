// How would you test the word count program? What kinds of input are most
// likely to uncover bugs if there are any?
// ❯ cat 11.c | wc
// 27     127     626

#include <stdio.h>

#define IN 1  /* inside a word */
#define OUT 0 /* outside a word */

/* count lines, words, and characters in input */
int main() {
  int c, nl, nw, nc, state;

  state = OUT;
  nl = nw = nc = 0;
  while ((c = getchar()) != EOF) {
    ++nc;
    if (c == '\n')
      ++nl;
    if (c == ' ' || c == '\n' || c == '\t')
      state = OUT;
    else if (state == OUT) {
      state = IN;
      ++nw;
    }
  }
  printf("Number of : Lines - %d, Words - %d, Characters - %d\n", nl, nw, nc);
}
