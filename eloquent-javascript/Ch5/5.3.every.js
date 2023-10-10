function everyLoop(arr, f) {
  let bool = true
  for (let i = 0; i < arr.length; i++) {
    if (!f(arr[i])) bool = false
  }
  return bool
}

// not (p and q) =not p or not q 

function everySome(arr,f) {
 return  !arr.some(x => !f(x))
}

console.log(everyLoop([1, 3, 5], n => n < 10)); // → true
console.log(everyLoop([2, 4, 16], n => n < 10)); // → false
console.log(everyLoop([], n => n < 10)); // → true

console.log(everySome([1, 3, 5], n => n < 10)); // → true
console.log(everySome([2, 4, 16], n => n < 10)); // → false
console.log(everySome([], n => n < 10)); // → true
