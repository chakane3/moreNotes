# Objects and Arrays
And array is represented as such:

```javascript
let listOfNumbers = [1, 2, 3, 4, 5]
```

When we do something like: listOfNumbers.length. We are acessing a **property**. We can access a property value in square brackets [].<br>

We can create an object as such:

```javascript
let person = {
    name: "Chakane",
    isHuman: true,
    workDays: ["Mon", "Tues", "Wed", "Thurs", "Fri"]
}
```
We can find out what properties an object may have by using: Object.keys. Also we can assing properties from one object to another. 
```javascript
let objA = {a:1, b:2}
Object.assign(objA, {b:3, c:4})
// objA is now -> {a:1, b:3, c:4} b was overriden here
```
We can also have an array of objects. 

```javascript
let humans = [
    {name: "Chakane", age: 26},
    {name:"Chris", age: 26},
    {name:"Mike", age: 25}
]
```