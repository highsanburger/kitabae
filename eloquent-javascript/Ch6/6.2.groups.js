class Group {
  constructor() {
    this.arr = []
    // return []
  }
  has(val) {
    if (this.arr.includes(val)) return true
    else return false
  }
  add(val) {
    this.arr.push(val)
  }
  print() {
    console.log(this.arr)
  }
  delete(val) {
    this.arr = this.arr.filter(x => x != val)
  }
  static from(a) {
    const g = new Group()
    for (let el of a) {
      g.add(el)
    }
    return g
  }
}
let group = Group.from([10, 20]);
console.log(group.has(10));
// → true
console.log(group.has(30));
// → false
group.add(10);
group.delete(10);
console.log(group.has(10));
// → false


