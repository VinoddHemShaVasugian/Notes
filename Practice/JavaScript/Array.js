// let marks = Array(6)
var marks = new Array(20,40,35,12,37)

var marks = [20, 40, 35, 12, 37]
console.log("marks: " + marks);
console.log("marks[2]: " + marks[2]);
marks[2] = 50; // Update the value at index 2
console.log("Updated marks[2]: " + marks[2]);
console.log("Length of marks: " + marks.length);

marks.push(60); // Add a new element at the end
console.log("After push, marks: " + marks);

marks.pop(); // Remove the last element
console.log("After pop, marks: " + marks);

marks.unshift(10); // Add a new element at the beginning
console.log("After unshift, marks: " + marks);

marks.shift(); // Remove the first element
console.log("After shift, marks: " + marks);

console.log("After push/pop/unshift/shift in marks: " + marks);

console.log(marks.indexOf(12)); // Find the index of 35
console.log(marks.includes(12)); // Check if 12 is in the array

console.log("marks.slice(1, 3): " + marks.slice(1, 3)); // Slice from index 1 to 2