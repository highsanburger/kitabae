// 1. Flattening
//
// Use the reduce method in combination with the concat method to “flatten”
// an array of arrays into a single array that has all the elements of the original
// arrays.

let arr = [[1, 2, 3], [4, 5], [6]];
const flat = arr.reduce((previous, current) => previous.concat(current), [])
console.log(flat) // → [1, 2, 3, 4, 5, 6]

console.log("---------------------------------------------------")

// 2. Your own loop
//
// Write a higher-order function loop that provides something like a for loop
// statement. It takes a value, a test function, an update function, and a body
// function. Each iteration, it first runs the test function on the current loop value
// and stops if that returns false. Then it calls the body function, giving it the
// current value. Finally, it calls the update function to create a new value and
// starts from the beginning.
// When defining the function, you can use a regular loop to do the actual
// looping.

function loop(i, test, update, body) {
  while (test(i)) {
    body(i)
    i = update(i)
  }
}
loop(3, n => n > 0, n => n - 1, console.log);
// → 3
// → 2
// → 1

console.log("---------------------------------------------------")

// 3. Everything
// Analogous to the some method, arrays also have an every method. This one
// returns true when the given function returns true for every element in the array.
// In a way, some is a version of the || operator that acts on arrays, and every is
// like the && operator.
// Implement every as a function that takes an array and a predicate function
// as parameters. Write two versions, one using a loop and one using the some
// method.

function everyLoop(arr, f) {
  let bool = true
  for (let i = 0; i < arr.length; i++) {
    if (!f(arr[i])) bool = false
  }
  return bool
}

function everySome(arr, f) { return !arr.some(x => !f(x)) }

console.log(everyLoop([1, 3, 5], n => n < 10)); // → true
console.log(everyLoop([2, 4, 16], n => n < 10)); // → false
console.log(everyLoop([], n => n < 10)); // → true

console.log(everySome([1, 3, 5], n => n < 10)); // → true
console.log(everySome([2, 4, 16], n => n < 10)); // → false
console.log(everySome([], n => n < 10)); // → true


console.log("---------------------------------------------------")

// 4. Dominant writing direction
//
// Write a function that computes the dominant writing direction in a string of
// text. Remember that each script object has a direction property that can be
// "ltr" (left to right), "rtl" (right to left), or "ttb" (top to bottom).
// The dominant direction is the direction of a majority of the characters that
// have a script associated with them. The characterScript and countBy func-
// tions defined earlier in the chapter are probably useful here.

const SCRIPTS = require('./ch5-scripts.js');

function countBy(items, groupName) {
  let counts = [];
  for (let item of items) {
    let name = groupName(item);
    let known = counts.findIndex(c => c.name == name);
    if (known == -1) {
      counts.push({ name, count: 1 });
    } else {
      counts[known].count++;
    }
  }
  return counts;
}

function characterScript(code) {
  for (let script of SCRIPTS) {
    if (script.ranges.some(([from, to]) => {
      return code >= from && code < to;
    })) {
      return script;
    }
  } return null;
}

function textScripts(text) {
  const scripts = countBy(text, char => {
    const script = characterScript(char.codePointAt(0));
    return script ? script.name : "none";
  }).filter(({ name }) => name !== "none");
  const total = scripts.reduce((n, { count }) => n + count, 0);
  if (total === 0) return "No scripts found";
  return scripts.map(({ name, count }) => {
    return `${Math.round(count * 100 / total)}% ${name}`;
  }).join(", ");
}

function dominantDirection(text) {
  let domLang = ''
  let s = textScripts(text).split(' ')
  if (s.length == 2) domLang = s[1]
  else {
    let n1 = Number(s[0].slice(0, 2))
    let n2 = Number(s[2].slice(0, 2))
    if (n1 > n2) domLang = s[1]
    else domLang = s[3]
  }
  return SCRIPTS.filter(x => x.name == domLang)[0].direction
}

let t1 = "Hello!"
let t2 = "Hey, ماء الخير"
console.log(dominantDirection(t1)) // -> ltr
console.log(dominantDirection(t2)) // -> rtl
