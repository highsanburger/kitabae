const roads = [
  "Alice's House-Bob's House",
  "Alice's House-Cabin",
  "Alice's House-Post Office",
  "Bob's House-Town Hall",
  "Daria's House-Ernie's House", "Daria's House-Town Hall",
  "Ernie's House-Grete's House", "Grete's House-Farm",
  "Grete's House-Shop",
  "Marketplace-Farm",
  "Marketplace-Post Office",
  "Marketplace-Shop",
  "Marketplace-Town Hall",
  "Shop-Town Hall"
];

function buildGraph(edges) {
  let graph = Object.create(null);
  function addEdge(from, to) {
    if (graph[from] == null) {
      graph[from] = [to];
    } else {
      graph[from].push(to);
    }
  }
  for (let [from, to] of edges.map(r => r.split("-"))) {
    addEdge(from, to);
    addEdge(to, from);
  }
  return graph
}
const roadGraph = buildGraph(roads);

console.log(roadGraph)
class VillageState {
  constructor(place, parcels) {
    this.place = place;
    this.parcels = parcels;
  }
  move(destination) {
    if (!roadGraph[this.place].includes(destination)) {
      return this;
    } else {
      let parcels = this.parcels.map(p => {
        if (p.place != this.place) return p;
        return { place: destination, address: p.address };
      }).filter(p => p.place != p.address);
      return new VillageState(destination, parcels);
    }
  }
}

// let first = new VillageState(
//   "Post Office",
//   [{ place: "Post Office", address: "Alice's House" }]
// );
// let next = first.move("Alice's House");
// console.log(next.place); // → Alice's House
// console.log(next.parcels); // → []
// console.log(first.place); // → Post Office

function runRobot(state, robot, memory) {
  for (let turn = 0; ; turn++) {
    if (state.parcels.length == 0) {
      console.log(`Done in ${turn} turns`);
      break;
    }
    let action = robot(state, memory);
    state = state.move(action.direction);
    memory = action.memory;
    console.log(`Moved to ${action.direction}`);
  }
}

function randomPick(array) {
  let choice = Math.floor(Math.random() * array.length);
  return array[choice];
}
function randomRobot(state) {
  return { direction: randomPick(roadGraph[state.place]) };
}

VillageState.random = function(parcelCount = 5) {
  let parcels = [];
  for (let i = 0; i < parcelCount; i++) {
    let address = randomPick(Object.keys(roadGraph));
    let place;
    do {
      place = randomPick(Object.keys(roadGraph));
    } while (place == address);
    parcels.push({ place, address });
  }
  return new VillageState("Post Office", parcels);
};

// runRobot(VillageState.random(), randomRobot);
// → Moved to Marketplace
// → Moved to Town Hall
// →…
// → Done in 63 turns

const mailRoute = [
  "Alice's House", "Cabin", "Alice's House", "Bob's House",
  "Town Hall", "Daria's House", "Ernie's House",
  "Grete's House", "Shop", "Grete's House", "Farm",
  "Marketplace", "Post Office"
];
function routeRobot(state, memory) {
  if (memory.length == 0) {
    memory = mailRoute;
  }
  return { direction: memory[0], memory: memory.slice(1) };
}

function findRoute(graph, from, to) {
  let work = [{ at: from, route: [] }];
  for (let i = 0; i < work.length; i++) {
    let { at, route } = work[i];
    for (let place of graph[at]) {
      if (place == to) return route.concat(place);
      if (!work.some(w => w.at == place)) {
        work.push({ at: place, route: route.concat(place) });
      }
    }
  }
}

function goalOrientedRobot({ place, parcels }, route) {
  if (route.length == 0) {
    let parcel = parcels[0];
    if (parcel.place != place) {
      route = findRoute(roadGraph, place, parcel.place);
    } else {
      route = findRoute(roadGraph, place, parcel.address);
    }
  }
  return { direction: route[0], memory: route.slice(1) };
}

// Exercises

// Measuring a robot

// 1.  It’s hard to objectively compare robots by just letting them solve a few sce-
//     narios. Maybe one robot just happened to get easier tasks or the kind of tasks
//     that it is good at, whereas the other didn’t.
//
//     Write a function compareRobots that takes two robots (and their starting
//     memory). It should generate 100 tasks and let each of the robots solve each
//     of these tasks. When done, it should output the average number of steps each
//     robot took per task.
//
//     For the sake of fairness, make sure you give each task to both robots, rather
//     than generating different tasks per robot.


console.log("---------------------------------------------------")

// Robot efficiency

// 2. Can you write a robot that finishes the delivery task faster than goalOrientedRobot
//    ? If you observe that robot’s behavior, what obviously stupid things does it
//    do? How could those be improved?
//    If you solved the previous exercise, you might want to use your compareRobots
//    function to verify whether you improved the robot.


console.log("---------------------------------------------------")

// Persistent group

// 3.  Most data structures provided in a standard JavaScript environment aren’t
//     very well suited for persistent use.Arrays have slice and concat methods,
//     which allow us to easily create new arrays without damaging the old one.But
//     Set, for example, has no methods for creating a new set with an item added or
//     removed.
//
//     Write a new class PGroup, similar to the Group class from Chapter 6, which
//     stores a set of values.Like Group, it has add, delete, and has methods.
//     Its add method, however, should return a new PGroup instance with the given
//     member added and leave the old one unchanged.Similarly, delete creates a
//     new instance without a given member.
//
//     The class should work for values of any type, not just strings.It does not
//     have to be efficient when used with large amounts of values.
//     The constructor shouldn’t be part of the class’s interface(though you’ll def -
//     initely want to use it internally).Instead, there is an empty instance, PGroup.
//     empty, that can be used as a starting value.
//
//     Why do you need only one PGroup.empty value, rather than having a function
//     that creates a new, empty map every time ?
