const arr = [[1,2],[3,4]];
const flat = arr.reduce((previous, current) => previous.concat(current), [])
console.log(flat)
