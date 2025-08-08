let msg : string = "hello";
msg = "test";
console.log("msg: "+msg);

let age1:number = 20;
console.log("age1: "+age1);

let isActive:boolean = false;
console.log("isActive: "+isActive);

let numArray:number[] = [1,2,3];
console.log("numArray: "+numArray);

let data : any = "this could be anything";
console.log("data: "+data);
data =42;
console.log("data: "+data);

console.log("*************************************Functions************************************************************");

function add(a:number, b:number): number
{
    return a+b;
}

add(3,4);
console.log("add(3,4): "+add(3,4));

let user: {name:string,age:number,location:string} = {name: "Bob", age:30, location:"Chennai"}
user.location="Mumbai";

console.log("user.location: "+user.location);
console.log("user.age: "+user.age);
