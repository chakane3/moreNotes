# Promise
This is essentially a return object representing an eventual success or failure of an async operation. We see this alot with API calls. We attach promises to callbacks instead of passing callbacks into a function. It allows us to WAIT for some block of code to finish execution. Promises have 3 states:
<ul>
<li>Fulfilled - The success case</li>
<li>Rejected -  The failure case</li>
<li>Pending - Still being handled (some other error)</li>
</ul>

## Promise Chaining
Adding a ```.then()``` creates a promise chain. We can attach our callbacks to the returned promises instead. ```.then()``` takes in 2 optional arguments. The first being a callback function that will be fired upon the promise being successful, the second argument is a callback function that will be fired upon the promise failing. Each .then() returns a promise. <br>
So basically instead of doing this:

```javascript
doSomething(result =>  {
    doSomethingElse(result, newResult => {
        doAThirdThing(newResult, finalResult => {
            console.log("we reached a solution: " + finalResult)
        }, failureCallback)
    }, failureCallback)
}, failureCallback)
```

We can actually do this instead with promises:

```javascript
doSomething().then(result => {
    return doSomethingelse(result)
})
.then(newResult => {
    return doAThirdThing(newResult)
})
.then(finalResult => {
    console.log("We reached a solution: " + finalResult)
})

// this is how we deal wth error handling
.catch(failureCallback)
```

