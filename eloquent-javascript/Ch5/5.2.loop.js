function loop(i, test, update, body) {
  while (test(i)) {
    body(i)
    i = update(i)
  }
}
loop(3, n => n > 0, n => n - 1, console.log);
