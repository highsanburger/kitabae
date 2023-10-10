const countBs = str => {
  let numBs = 0;
  for (let i = 0; i < str.length; i++) {
    (str[i] == 'B') ? numBs++ : null;
  }
  return numBs
}
console.log(countBs("Bean Bags Be"))


const countChar = (str, chr) => {
  let numChar = 0;
  for (let i = 0; i < str.length; i++) {
    (str[i] == chr) ? numChar++ : null;
  }
  return numChar
}
console.log(countChar('Started', 't'))

