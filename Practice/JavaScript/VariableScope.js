//block of code
//var - global level/functional level
//let - global level/block level {}

var varExample = "Evening";
let letExample = "Evening";

if(1==1){
   var varExample = "afternoon"
   let letExample = "afternoon"
   console.log("block level varExample: "+varExample)
   console.log("block level letExample: "+letExample)
}

   function add(a,b){
   var varExample = "night"
   let letExample = "night"
   console.log("function level varExample: "+varExample)
   console.log("function level letExample: "+letExample)
return a+b
}

let sum = add(2,3)
console.log(sum)
console.log("varExample at End of program: "+varExample)
console.log("letExample at End of program: "+letExample)