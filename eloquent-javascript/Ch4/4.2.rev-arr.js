const reverseArray = (arr) => {
  revArr = [];
  for (let i = arr.length - 1; i >= 0; i--) {
    revArr.push(arr[i]);
  }
  return revArr;
}
let a = [1, 2, 3, 4]
console.log(reverseArray(a))

const reverseArrayInPlace = (arr) => {
  let half = (arr.length % 2 == 0) ? arr.length / 2 : (arr.length + 1) / 2;
  for (let i = 0; i < half; i++) {
    j = arr.length - 1 - i;
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr
}
let b = [10, 20, 30, 40, 50]
console.log(b)
let revb = reverseArrayInPlace(b)
console.log(b)
console.log(revb)
console.log(b === revb)
console.log(reverseArrayInPlace(a))

