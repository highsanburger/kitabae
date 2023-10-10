const isEven = (n) => {
  n = Math.abs(n)
  if (n == 0) {
    return true;
  }
  else if (n == 1) {
    return false;
  }
  else {
    return isEven(n - 2)
  }
}
console.log(isEven(50))
console.log(isEven(75))
console.log(isEven(-1))
console.log(isEven(-10))



