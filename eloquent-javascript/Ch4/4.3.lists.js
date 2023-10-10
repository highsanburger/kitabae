const arrayToList = (arr) => {
  if (arr.length === 0) {
    return null;
  } else {
    const list = {
      value: arr[0],
      rest: arrayToList(arr.slice(1)),
    };
    return list;
  }
};

const listToArray = (list) => {
  let arr = [];
  const appendValue = (obj) => {
    arr.push(obj.value)
    if (obj.rest != null) { appendValue(obj.rest) }
  }
  appendValue(list)
  return arr
}

const arr = [1, 2, 3];
const generatedList = arrayToList(arr);
console.log(generatedList);
console.log(listToArray(generatedList))

const prepend = (el, list) => {
  const prepList = { value: el, rest: list };
  return prepList;
};
console.log(prepend(0, generatedList));

const nth = (index, list) => {
  if (!list) {
    return undefined;
  }

  if (index === 0) {
    return list.value;
  } else {
    return nth(index - 1, list.rest);
  }
}

console.log(nth(0, generatedList)); // 1
console.log(nth(1, generatedList)); // 2

