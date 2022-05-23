# Functions

Theres 3 ways to define a function:<br>
A functions arguments are optional.
```javascript
const square function(x) {
    return x * x
}
```

```javascript
function square(x) {
    return x*x
}
```

** The difference between arrow functions and normal functions is that <b>arrow functions</b> don't have an arguments binding. The have access to the arguments object of the closest non-arrow parent function. <b>Arguments</b> is an object in this case where it is an array-like object (you are able to convert it into a real array) inside function which contain values passed to that function. Arrow functions do not have a this. keyword. The value of "this" inside an arrow function is the same throughout the lifecycle of the function and is always bound to the value of "this" in the closest non-arrow parent function. Regular function are constructable and callable meaning they can be called using the "new" keyword, arrow functions are not. 
```javascript
const power = (base, component) => {
    let result = 1
    for(let count = 0; count < component; count++) {
        result *= base
    }
    return result
}
```

Bindings = properties = vars/lets. Each binding has a scope which is the space the binding exists in that part of the program. For any binding defined outside a function or block, it is a global variable that has a scope of the entire program.<br>

The call stack: Everytime a function is called, the current context is stored on the top of the stack. When the function returns it removes the top context from the stack and uses that context to continue execution. <br>

Closures give us the ability to treat functions as values combined with the fact that local bindings are re-created everytime a function is called. Being able to reference a specific instance of a local binding in an enclosing scope is a closure. A function that references bindings from local scopes around it is called a closure. 
```javascript
function wrapValue(n) {
    let local = n
    return () => local
}
let wrap1 = wrapValue(1)
let wrap2 = wrapValue(2)
```

```javascript
function multiplier(factor) {
    return number => number * factor
}
let twice = multiplier(2)
console.log(twice(5)) // prints 10
console.log(twice) // prints null
```


