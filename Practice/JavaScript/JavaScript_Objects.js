//object is collection of properties
let person = {
    firstName:'Vinoth',
    lastName: 'Kumar',
    age: 24,
    fullname : function(){
        console.log(this.firstName+this.lastName)
    }
}


console.log(person.fullname())

console.log("***********************************************")

console.log(person.firstName) //Can access via Dot notation
console.log(person['lastName']) //Can access via Array notation

person.firstName = 'Shashwanth'
console.log(person.firstName)

person.gender = 'male'
console.log(person)

delete person.gender
console.log(person)

if('gender' in person)
    console.log("present")
else
    console.log("not present")

for(let key in person){
console.log(person[key])
}

