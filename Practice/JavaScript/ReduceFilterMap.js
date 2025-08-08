var marks = [20, 40, 35, 12, 37, 120, 100, 80, 90, 70];

var sum=0;
for(let i = 0; i < marks.length; i++) {
    sum += marks[i];
}
console.log("Sum of marks: " + sum);

//reduce filter map
let total = marks.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
console.log("Total using reduce: " + total);


var evenScores = [];
for(let i = 0; i < marks.length; i++) {
    if(marks[i] % 2 === 0) {
        evenScores.push(marks[i]);
    }
}
console.log("Even scores using for loop: " + evenScores);

let newMarks = marks.filter(mark=>mark%2==0);
console.log("Even marks using filter: " + newMarks);

let mappedArray = newMarks.map(mark => mark*3);
console.log("Marks multiplied by 3 using map: " + mappedArray);

let reducedArray = newMarks.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
console.log("Sum of even marks using reduce: " + reducedArray);

// Chaining filter and map
let amount = [10, 20];
let chainedResult = amount.filter(amt=>amt%2==0).map(amt=>amt*3).reduce((accumulator, currentValue) => accumulator+currentValue, 0);
console.log("Chained filter, map and reduce result: " + chainedResult);