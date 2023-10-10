class Animal {
  constructor(name, sound) {
    this.name = name
    this.sound = sound

  }
  make() {
    // console.log('The', this.name, 'goes :', this.sound)
    console.log(`The ${this.name} goes : ${this.sound}`)
  }
}
const dog = new Animal('dog', 'bark');
Animal.prototype.color = 'black'
console.log(dog.color)
console.log(dog.make())

