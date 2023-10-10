// 1.
function id(f) { return f }

// 2.

const compose = (funcA, funcB) => x => funcA(funcB(x));

// 3.
   function square(x) { return x ** 2 }
function sqrt(x) { return x ** (1 / 2) }

console.log("square(3) :", square(3))
console.log("sqrt(9) :", sqrt(9))
console.log("sqrt(square(3)) :", sqrt(square(3)))

console.log("id(3) :", id(3))
console.log("(id(square(3))) : ", id(square(3)))
console.log(" (compose(square,sqrt)) :", compose(square, sqrt))
console.log(" (compose(square,sqrt)(3)) :", compose(square, sqrt)(3))

// 4. WWW is a category if and only if all sites link to each other and each site links to itself
// and since it actually doesnt its not. 
//
// a. Objects - web pages
// b. Morphisms - linking two webpages
// c. Composition - clicking two links one after the other same as clicking direct link
//      i) Associativity - since all sites are interlinked routes dont matter 
//      ii) Identity - going from H to A then A to A

// 5. Facebook
//
// a. Objects - people
// b. Morphisms - friendships
// c. Composition - if A is a friend of B and if B is a friend of C does not necessary entail that A & C are friends.
//
// Hence no FB is not a category.
//

// 6. a directed graph is a categor if and only if 
// 
// i) each vertice is linked to / has an adjacency to itself.
// ii) all vertices are interconnected with atleast a one way adjacency