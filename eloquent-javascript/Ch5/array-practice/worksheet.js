const characters = [
  {
    name: 'Luke Skywalker',
    height: 172,
    mass: 77,
    eye_color: 'blue',
    gender: 'male',
  },
  {
    name: 'Darth Vader',
    height: 202,
    mass: 136,
    eye_color: 'yellow',
    gender: 'male',
  },
  {
    name: 'Leia Organa',
    height: 150,
    mass: 49,
    eye_color: 'brown',
    gender: 'female',
  },
  {
    name: 'Anakin Skywalker',
    height: 188,
    mass: 84,
    eye_color: 'blue',
    gender: 'male',
  },
];
// console.log(characters)
// console.log('----------------------------------------------------')

//***MAP***
//1. Get array of all names
const m1 = characters.map(x => x.name)

//2. Get array of all heights
const m2 = characters.map(x => x.height)

//3. Get array of objects with just name and height properties
const m3 = characters.map(x => ({ "name": x.name, "height": x.height }))

//4. Get array of all first names
const m4 = characters.map(x => x.name.split(' ')[0])

//***REDUCE***
//1. Get total mass of all characters
const r1 = characters.reduce((previous, current) => { return previous + current.mass }, 0)

//2. Get total height of all characters
const r2 = characters.reduce((previous, current) => { return previous + current.height }, 0)

//3. Get total number of characters by eye color
const r3 = characters.reduce((previous, current) => {
  if (previous[current.eye_color]) previous[current.eye_color]++
  else previous[current.eye_color] = 1
  return previous
}, {})

//4. Get total number of characters in all the character names
const r4 = characters.reduce((previous, current) => previous + current.name.length, 0)


//***FILTER***
//1. Get characters with mass greater than 100
const f1 = characters.filter(x => x.mass > 100)

//2. Get characters with height less than 200
const f2 = characters.filter(x => x.height < 200)

//3. Get all male characters
const f3 = characters.filter(x => x.gender == 'male')

//4. Get all female characters
const f4 = characters.filter(x => x.gender == 'female')


//***SORT***
//1. Sort by mass
const t1 = characters.sort((x, y) => x.mass - y.mass)

//2. Sort by height
const t2 = characters.sort((x, y) => x.height - y.height)

//3. Sort by name
const t3 = characters.sort((x, y) => {
  if (x.name > y.name) return 1
  else if (y.name > x.name) return -1
  else return 0
})

//4. Sort by gender
const t4 = characters.sort((x, y) => {
  if (x.gender > y.gender) return 1
  else if (y.gender > x.gender) return -1
  else return 0
})


// console.log(t4)
//***EVERY***
//1. Does every character have blue eyes?
const e1 = characters.every(x => x.eye_color == 'blue')

//2. Does every character have mass more than 40?
const e2 = characters.every(x => x.mass > 40)

//3. Is every character shorter than 200?
const e3 = characters.every(x => x.height < 200)

//4. Is every character male?
const e4 = characters.every(x => x.gender == 'male')


//***SOME***
//1. Is there at least one male character?
const s1 = characters.some(x => x.gender == 'male')

//2. Is there at least one character with blue eyes?
const s2 = characters.some(x => x.eye_color == 'blue')

//3. Is there at least one character taller than 210?
const s3 = characters.some(x => x.height > 210)

//4. Is there at least one character that has mass less than 50?
const s4 = characters.some(x => x.mass < 50)
