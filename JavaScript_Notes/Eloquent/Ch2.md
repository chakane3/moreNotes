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

```javascript
const power = (base, component) => {
    let result = 1
    for(let count = 0; count < exponent; count++) {
        result *= base
    }
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
