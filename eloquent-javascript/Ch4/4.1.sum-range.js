const range = (start, end) => {
  const arr = []
  for (let i = start; i < end + 1; i++) {
    arr.push(i)
  }
  return arr
}
console.log(range(1, 10))
console.log(typeof range(1, 10))
console.log(typeof range)

const sum = (arr) => {
  let s = 0
  for (el of arr) {
    s += el
  }
  return s
}
myArr = [1, 2, 30]
console.log(sum(myArr))

const rangeMod = (start, end,step=1) => {
  let arr = []
  if (step > 0 ) {
  for (let i = start; i < end ; i += step) {
    arr.push(i)
  }} else{
  for (let i = end; i <= start ; i += -step ) {
    arr.push(i)
  }
    arr = arr.reverse()
  }
  return arr;
   }
console.log(rangeMod(1,10,2))
console.log(rangeMod(5,2,-1))


