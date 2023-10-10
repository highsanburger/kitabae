function deepEqual(a, b) {
  if (a === b) return true;
  if (a == null || typeof a != "object" || b == null || typeof b != "object") return false;

  let ak = Object.keys(a), bk = Object.keys(b);

  if (ak.length != bk.length) return false;

  for (let k of ak) {
    if (!bk.includes(k) || !deepEqual(a[k], b[k])) return false;
  }
  return true;
}

let obj = {here: {is: "an"}, object: 2};
let obj2 = {here: {is: "an"}, object: 2};
let obj3 = {here: "is an" , object: 2};
console.log(deepEqual(obj,obj))
console.log(deepEqual(obj,obj2)) 
console.log(deepEqual(obj,obj3))


