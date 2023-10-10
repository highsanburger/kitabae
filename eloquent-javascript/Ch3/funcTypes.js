// Declaration 
console.log(add(2, 3)) // hoisting
function add(x, y) { return x + y }


// Expression
const mul = function(x, y) {
  return x * y
}
console.log(mul(2, 3))


// Arrows
const sqr = (x) => {
  return x * x
}
console.log(sqr(2))

const cub = x => x * x * x;
console.log(cub(2))


// Nested lexical scopes

for (let i = 0; i < 3; i++) {
  function sub(x, y) { return x - y }
  console.log(sub(sqr(i), i))
}

console.log(sub(5, 2))

function chicken() {
  return egg();
}
function egg() {
  // return chicken(); // would result in RangeError Max call stack
  return "chicken"
}
console.log(chicken() + " came first.");

const pow = (b, e) => (e == 0) ? 1 : b * pow(b, e - 1)
const fact = n => (n == 1) ? 1 : n * fact(n - 1)
console.log(fact(8))
