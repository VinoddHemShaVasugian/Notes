const PersonDetails = require('./Classes')

class Pet extends PersonDetails{
    get Location()
    {
        return "BlueCross"
    }

    constructor(firstName, lastName){
        super(firstName, lastName)
    }

}
let petOne = new Pet("QA", "test");
petOne.fullName();
