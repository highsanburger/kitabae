console.log("true ? 1 : 2 : ", true ? 1 : 2)
console.log("false ? 1 : 2 : ", false ? 1 : 2)

// Short circuiting, {||,&&} dont check 2nd when 1st is {true,false}
console.log("true || false : ", true || false)
console.log("false && true : ", false && true)

console.log('true || "5" : ', true || "5")
console.log('false && 89 * 9 : ', false && 89 * 9)

console.log('"Chennai" || "city" : ', "Chennai" || "city")
console.log('"Chennai" && "city" : ', "Chennai" && "city")


console.log('"" || "city" : ', "" || "city")
console.log('"" && "city" : ', "" && "city")
