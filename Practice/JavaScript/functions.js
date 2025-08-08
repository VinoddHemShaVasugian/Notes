//block of code

function add(a,b){
return a+b
}

let sum = add(2,3)
console.log("sum: "+sum)

//do not have name => Anyonymus functions

// let sumTotal = function(a,b){
//     return a+b
// }

let sumTotal = (c,d)=>c+d
console.log("sumTotal(2,3): "+sumTotal(2,3));