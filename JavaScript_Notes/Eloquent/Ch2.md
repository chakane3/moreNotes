# Functions

```javascript

```

Theres 3 ways to define a function:
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

Bindings = properties = vars/lets. Each binding has a scope which is the space the binding exists in that part of the program. For any binding defined outside a function or block, it is a global variable that has a scope of the entire program.