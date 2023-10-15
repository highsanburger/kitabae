// 1. Looping a triangle

// Write a loop that makes seven calls to console.log to output the following
// triangle:
// #
// ##
// ###
// ####
// #####
// ######
// #######

str = '';
for (let i = 0; i < 7; i++) {
  str += '#';
  console.log(str)
}

console.log("---------------------------------------------------")

// 2. FizzBuzz

// Write a program that uses console.log to print all the numbers from 1 to 100,
// with two exceptions. For numbers divisible by 3, print "Fizz" instead of the
// number, and for numbers divisible by 5 (and not 3), print "Buzz" instead.
// When you have that working, modify your program to print "FizzBuzz" for
// numbers that are divisible by both 3 and 5 (and still print "Fizz" or "Buzz"
// for numbers divisible by only one of those).

for (let i = 1; i < 101; i++) {
  if (i % 3 == 0 && i % 5 == 0) console.log("FizzBuzz")
  else if (i % 3 == 0) console.log("Fizz")
  else if (i % 5 == 0) console.log("Buzz")
  else console.log(i)
}

console.log("---------------------------------------------------")

// 3. Chessboard

// Write a program that creates a string that represents an 8×8 grid, using newline
// characters to separate lines. At each position of the grid there is either a space
// or a "#" character. The characters should form a chessboard.
// Passing this string to console.log should show something like this:

//  # # # #
// # # # #
//  # # # #
// # # # #
//  # # # #
// # # # #
//  # # # #
// # # # #

// When you have a program that generates this pattern, define a binding size
//   = 8 and change the program so that it works for any size, outputting a grid
// of the given width and height.


let size = 8;
let board = '';
let r1 = '';
let r2 = '';
for (let i = 0; i < size; i++) {
  if (i % 2 == 0) {
    r1 += ' ';
    r2 += '#';
  }
  else {
    r1 += '#';
    r2 += ' ';
  }
}
r1 += '\n';
r2 += '\n';
for (let i = 0; i < size; i += 2) {
  board += r1;
  board += r2;

}
console.log(board)
