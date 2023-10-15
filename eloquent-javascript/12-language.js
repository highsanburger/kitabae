// Arrays

// Add support for arrays to Egg by adding the following three functions to the
// top scope: array(...values) to construct an array containing the argument
// values, length(array) to get an array’s length, and element(array, n) to fetch
// the nth element from an array.

// Modify these definitions...

topScope.array = "...";

topScope.length = "...";

topScope.element = "...";

run(`
do(define(sum, fun(array,
     do(define(i, 0),
        define(sum, 0),
        while(<(i, length(array)),
          do(define(sum, +(sum, element(array, i))),
             define(i, +(i, 1)))),
        sum))),
   print(sum(array(1, 2, 3))))
`);
// → 6


// Closure

// The way we have defined fun allows functions in Egg to reference the surround-
// ing scope, allowing the function’s body to use local values that were visible at
// the time the function was defined, just like JavaScript functions do.
// The following program illustrates this: function f returns a function that
// adds its argument to f’s argument, meaning that it needs access to the local
// scope inside f to be able to use binding a.
run(`
do(define(f, fun(a, fun(b, +(a, b)))),
print(f(4)(5)))
`);
// → 9
// Go back to the definition of the fun form and explain which mechanism
// causes this to work.


// Comments

// It would be nice if we could write comments in Egg. For example, whenever
// we find a hash sign (#), we could treat the rest of the line as a comment and
// ignore it, similar to // in JavaScript.
// We do not have to make any big changes to the parser to support this. We
// can simply change skipSpace to skip comments as if they are whitespace so that
// all the points where skipSpace is called will now also skip comments. Make
// this change.

// This is the old skipSpace. Modify it...
function skipSpace(string) {
  let first = string.search(/\S/);
  if (first == -1) return "";
  return string.slice(first);
}

console.log(parse("# hello\nx"));
// → {type: "word", name: "x"}

console.log(parse("a # one\n   # two\n()"));
// → {type: "apply",
//    operator: {type: "word", name: "a"},
//    args: []}



// Fixing scope

// Currently, the only way to assign a binding a value is define. This construct
// acts as a way both to define new bindings and to give existing ones a new value.
// This ambiguity causes a problem. When you try to give a nonlocal binding
// a new value, you will end up defining a local one with the same name instead.
// Some languages work like this by design, but I’ve always found it an awkward
// way to handle scope.
// Add a special form set, similar to define, which gives a binding a new value,
// updating the binding in an outer scope if it doesn’t already exist in the inner
// scope. If the binding is not defined at all, throw a ReferenceError (another
// standard error type).
// The technique of representing scopes as simple objects, which has made
// things convenient so far, will get in your way a little at this point. You might
// want to use the Object.getPrototypeOf function, which returns the prototype
// of an object. Also remember that scopes do not derive from Object.prototype,
// so if you want to call hasOwnProperty on them, you have to use this clumsy
// expression:
Object.prototype.hasOwnProperty.call(scope, name);

specialForms.set = (args, scope) => {
  // Your code here.
};

run(`
do(define(x, 4),
   define(setx, fun(val, set(x, val))),
   setx(50),
   print(x))
`);
// → 50
run(`set(quux, true)`);
// → Some kind of ReferenceError
