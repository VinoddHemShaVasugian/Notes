let a = 10;
let b = 20;
let c="Hello"
// var c="Hello"

// let c = a + b; (It wont work because 'let' is block scoped - We cannot redeclare variable with let keyword but possible with var)
// var c= a + b; // This will work because 'var' is function scoped and allows redeclaration
c = a + b; // reassigning value to c is allowed with let
console.log("c: " + c);

let d=true
console.log("d: "+!d)
