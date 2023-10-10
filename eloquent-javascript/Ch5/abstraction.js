// Abstracting over repitition 
function repeat(n,f) { for (let i = 0; i < n; i++) { f(i) } }

repeat(4,console.log)

let a = [];
repeat(4,(i) => {a.push(`square of ${i} is ${i**2} `)})
console.log(a)

// Abstracting over comparision

function greaterThan(x) {
 return y => y > x; 
}
let greaterThan5 = greaterThan(5);
console.log(greaterThan5(3));
console.log(greaterThan(1)(5)) // first argument goes to x second goes to y
console.log(greaterThan('a')('z'))

// over flow
function unless(cond, f) { if (!cond)  f() }

repeat(7, (n) => { unless(n%2 == 0, () => console.log(n,"is odd."))})
