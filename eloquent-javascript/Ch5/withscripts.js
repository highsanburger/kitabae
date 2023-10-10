const SCRIPTS = require('./scripts.js');

function filter(arr, f) {
  let l = [];
  for (let i = 0; i < arr.length; i++) {
    if (f(arr[i])) l.push(arr[i])
  }
  return l
}

// console.log(filter(SCRIPTS, o => o.year < 0))
// console.log(SCRIPTS.filter(o => o.year < -3000))

function map(arr, f) {
  let l = []
  for (let i = 0; i < arr.length; i++) {
    l.push(f(arr[i]))
  }
  return l
}
// console.log(map(filter(SCRIPTS,(o => o.year > 1950)),o => o.name))

function reduce(arr, f, start) {
  let t = start;
  for (let i = 0; i < arr.length; i++) {
    t = f(arr[i], t)
  }
  return t
}
let a = [1, 2, 3, 4, 5]
// console.log(reduce(a, (x, y) => x * y, 1))

function characterCount(script) {
  return script.ranges.reduce((count, [from, to]) => {
    return count + (to - from);
  }, 0);
}
// console.log(SCRIPTS.reduce((a, b) => {
//   return characterCount(a) < characterCount(b) ? b : a;
// }));

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
// console.log(countBy([1, 2, 3, 4, 5], n => n > 2));


function characterScript(code) {
  for (let script of SCRIPTS) {
    if (script.ranges.some(([from, to]) => {
      return code >= from && code < to;
    })) {
      return script;
    }
  } return null;
}
// console.log(characterScript(121)); // → {name: "Latin", …}


function textScripts(text) {
  let scripts = countBy(text, char => {
    let script = characterScript(char.codePointAt(0));
    return script ? script.name : "none";
  }).filter(({ name }) => name != "none");
  let total = scripts.reduce((n, { count }) => n + count, 0);
  if (total == 0) return "No scripts found";
  return scripts.map(({ name, count }) => {
    return `${Math.round(count * 100 / total)}% ${name}`;
  }).join(", ");
}
// console.log(textScripts('英国的狗说"woof", 俄罗斯的狗说"тяв"')); // → 61% Han, 22% Latin, 17% Cyrillic

