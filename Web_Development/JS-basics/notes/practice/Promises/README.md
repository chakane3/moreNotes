# Promise
This is an object that represents the eventual completion or failure of an async operation and its resulting value. Think of it as a proxy for a value that isnt known when the promise is created. Theres 3 states for promises:
<ul>
    <li>Pending - The initial state, neither fulfilled or rejected. If rejected you can get a reason for it "(error)"</li>
    <li>Fulfilled - The operation was successful.</li>
    <li>Rejected - The operation failed.</li>
</ul>

When either of these 3 states happen the handlers are queued up by a promises ```then``` method. Think of a try and except. 


## Chained Promises
Theres 3 methods: ```.then()```, ```.catch()```, ```.finally()``` which are used to associate further action with a promise that becomes settled. <br>

Then .```then()``` method takes up 2 arguments: 
<ul>
<li>A callback function for the rejected case</li>
<li>A callback function for the successful case</li>
</ul>

Each ```.then()``` returns a newly generated promise object.

```javascript
const myPromise = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve("foo")
    }, 300)
})


myPromise
.then(handleResolvedA, handleRejectedA)
.then(handleResolvedB, handleRejectedB)
.then(handleResolvedC, handleRejectedC)
.catch(handleRejectedAny)
```
The ```.then()``` clause looks like this: ```.then(onfulfilled: [Any], onrejected: [Any]).```, these are 2 optional arguments. The first argument is a callback function that will be fired upon the promise succeeding. The second argument is a callback function that will be fired upon the promise failing. Processing continues to the next link of the chain when a then lacks a callback function that returns a promise object. A better explanation of chaining promises looks like this:

```javascript
doSomething()
.then(result => {
    return doSomethingElse(result)
})
.then(newResult => {
    return doThirdThing(newResult)
})
.then(finalResult => {
    console.log("Got the final result: " + final result)
})
.catch(failureCallback)
```

Here the callback in the first then takes in an argument ```result```. This result is whatever the previous promise returned. If youre going to chain your promises together then your callacks will all need to return something to the next .then(). ```.catch()``` is how we deal with error handling. <b>Each ```.then()``` returns a promise!!</b> 

## Using Promises with fetch
The Fetch API allows us to get resources especially across the network. It takes in one argument <b>the path you want get your resources from</b>. The response to that request depends on wether it was successful or not. theres also optional arguments you can pass for any methods of the request you may want. <br>

If we want POST request all we need to do is pass an object with some data as a second argument to fetch

