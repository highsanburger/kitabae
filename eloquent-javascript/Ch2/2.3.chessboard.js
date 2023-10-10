let size = 8;
let board = '';
let r1 = '';
let r2 = '';
for (let i = 0; i < size; i++) {
  if (i % 2 == 0) {
    r1 += ' ';
    r2 += '#';
  }
  else {
    r1 += '#';
    r2 += ' ';
  }
}
r1 += '\n';
r2 += '\n';
for (let i = 0; i < size; i += 2) {
  board += r1;
  board += r2;

}
console.log(board)
