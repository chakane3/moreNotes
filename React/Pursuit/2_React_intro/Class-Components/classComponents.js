// Heres a definition of an animal class
class Animal {
    constructor(name, age) {
        this.name = name
        this.age = age
    }

    speak(words) {
        return `${this.name} says "${words}.`
    }
}

const aDog = new Animal("Luna", 21)
const birb = new Animal("Big Bird", 45)
console.log(birb.speak("cheep cheep"))

// We use the "extends" keyword to define a type of object with the same methods, and we can add on
// new methods for the usecase we want

class Dog extends Animal {
    constructor(name, breed) {
        super(name) // super calls the constructor in Animal
        this.breed = breed
    }

    bark() {
        return `${this.name} had barked`
    }
}

let myDog = new Dog("Luna")
console.log(myDog.speak("haha!"))


class Cat extends Animal {
    constructor(name, breed) {
        super(name) 
        this.breed = breed
    }

    meow() {
        return `${this.name} has meowed`
    }
}

let myCat = new Cat("Nala")
console.log(myCat.meow())
