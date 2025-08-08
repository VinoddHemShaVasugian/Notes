let fruits = ["apple", "mango", "cherry", "banana"];
var marks = [20, 40, 35, 12, 37, 120, 100, 80, 90, 70];

fruits.sort();
console.log("After sorted: "+fruits)
fruits.reverse()
console.log("After reversed: "+fruits)

marks.sort((a,b)=>a-b); //Bubble sort in recursive manner
console.log("Sorted marks: "+marks)

marks.sort((a,b)=> b-a); //to reverse the numbers
console.log("After reversed: "+marks)