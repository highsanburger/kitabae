const SCRIPTS = require('./scripts.js');

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
console.log(dominantDirection(t1))
console.log(dominantDirection(t2))


