module.exports = class PersonDetails{
    age = 25
    // location = "canada"
    get location()
    {
        return "canada"
    }

    //constructor is method which executes by default when we create object of the class
    constructor(firstName, lastName)
    {
        this.firstName = firstName;
        this.lastName = lastName;
    }
    //Method
    fullName()
    {
        console.log(this.firstName+" "+this.lastName)
    }
}

// let p = new PersonDetails("Vinoth", "Kumar")
// let p1 = new PersonDetails("Sha", "Vas")
// let p2 = new PersonDetails("hem", "Vas")
// console.log("person.age: "+p.age)
// console.log("person.location: "+p.location)
// console.log(p.fullName())
// console.log(p1.fullName())
// console.log(p2.fullName())