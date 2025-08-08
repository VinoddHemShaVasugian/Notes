const flag = true;
if (!flag) {
    console.log("Flag is true");
}else {
    console.log("Flag is false");
}

while(true) {
    console.log("This will run at least once");
    break; // To prevent an infinite loop
}

let i=0;
// while(i<10) {
//     i++;
//     console.log("i: " + i);
// }

// do{
//     console.log("This do loop will run at least once");
//     i++;
// }while(i<10);
// console.log("i after do-while: " + i);

for(let j=0; j<5; j++) {
    console.log("j: " + j);
}