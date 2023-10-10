class Vec {
  constructor(x, y) {
    this.x = x
    this.y = y
  }
  plus(vec) {
    return new Vec(this.x + vec.x, this.y + vec.y)
  }
  minus(vec) {
    return new Vec(this.x - vec.x, this.y - vec.y)
  }
  get length() {
    return Math.sqrt(this.x ** 2 + this.y ** 2)
  }
}

const org = new Vec(0, 0)
const one = new Vec(1, 1)
const pyt = new Vec(3, 4)

console.log(org.length)
console.log(one.length)
console.log(pyt.length)

console.log(pyt.plus(org))
console.log(pyt.minus(one))
