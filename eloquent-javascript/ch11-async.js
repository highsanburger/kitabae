// Tracking the scalpel

// The village crows own an old scalpel that they occasionally use on special
// missions—say, to cut through screen doors or packaging. To be able to quickly
// track it down, every time the scalpel is moved to another nest, an entry is
// added to the storage of both the nest that had it and the nest that took it,
// under the name "scalpel", with its new location as the value.
// This means that finding the scalpel is a matter of following the breadcrumb
// trail of storage entries, until you find a nest where that points at the nest itself.
// Write an async function locateScalpel that does this, starting at the nest
// on which it runs. You can use the anyStorage function defined earlier to access
// storage in arbitrary nests. The scalpel has been going around long enough that
// you may assume that every nest has a "scalpel" entry in its data storage.
// Next, write the same function again without using async and await.
// Do request failures properly show up as rejections of the returned promise
// in both versions? How?

async function locateScalpel(nest) {
  // Your code here.
}

function locateScalpel2(nest) {
  // Your code here.
}

locateScalpel(bigOak).then(console.log);
// → Butcher Shop


// Building Promise.all

// Given an array of promises, Promise.all returns a promise that waits for all of
// the promises in the array to finish. It then succeeds, yielding an array of result
// values. If a promise in the array fails, the promise returned by all fails too,
// with the failure reason from the failing promise.
// Implement something like this yourself as a regular function called Promise_all
// .
// Remember that after a promise has succeeded or failed, it can’t succeed or
// fail again, and further calls to the functions that resolve it are ignored. This
// can simplify the way you handle failure of your promise.
