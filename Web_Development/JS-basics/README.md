# Javascript Basics

We  can use javascript to handle unser intraction on our sites; such as forms. We can add a JS file to our HTML file:
```javascript
<script src="pathToJsFile.js"></script>
```

A window object is our top-level object in the browser side JS which represens a browser window. This has properties such as:
<ul>
<li>.innerWidth</li>
<li>.innerHeight</li>
<li>.localStorage</li>
</ul>
The window has mehods such as: window.alert() or window.prompt().<br>

getelementByID() - we can use document.getElementByID() to locate a single element in the DOM.<br>
Note that when we run a script before other HTML elements are created we will get null values. To use HTML elements in JS, we need to use element objects such as:
<ul>
<li>textContent</li>
<li>addEventListener()</li>
<li>lastChild</li>
<li>children</li>
</ul>

The DOM (document object model) is a programming interface for HTML and XML documents. It models each element in an HTML page as a JS object.

We can also set elements in the DOM
```javascript
const userInput = window.prompt("Enter a name")
const htmlIDName = window.document.getElementByID("id-name")
htmlIDName.textContent += `${userInput}`
```
** to convert an HTMLElement to an int, use Number()
querySelector searches for HTML elements without an id. It selects the first element instance where:
<ul>
<li>querySelector("p")</li>
<li>To combine query selector with getElementByID: (1) querySelector("#idName"), (2) querySelector(".className")</li>
<li>To get all instances of an element: querySelectorAll("p")</li>
</ul>

Alternative loop for JS:
```javascript
for(const x of y) {}
```

If our HTML looks has this [getElementByID]
```html
<input type="text" id="name-input-text" placeholder="FN">
<button onclick="addName()">Submit</button>
<p id="top-heading"></p>
<script src="script.js"></script>
```

Our JS file could have this to add in a new p tag
```javascript
const addName = () => {
    const userInput = document.getElementByID("name-input-text")
    const userSubmission = unserInput.value
    const topHeading = document.getElementByID("top-heading")
    topHeading.textContent = `Hello, ${userSubmission}`
}
```

<br>
We can create new HTML elements by using: createElement(). If our html has this:

```html
<body>
    <p>New website</p>
</body>
```

Our JS file can add a new element to the body by implementing:
```javacript
let newP = document.createElement("p")
newP.textContent = "text here"
document.body.appendChild(newP)
```

If we want to add to a list we would:
```javascript
let listItem = document.createElement("li")
listItem.textContent = "new event"
let listElement = document.getElementById("lineupList")
listElement.appendChild(listItem)
```

We can delete elements using: removeChild()
<br>

Add new element example(duplicator)
```html
<input type="text" id="text-dup-input"/><br>
<input type="number" id="text-dup-num-input"/>
<button onclick="textDuplicator()">Submit</button>
<ul id="text-dup-list"></ul>
<script src="script.js"></script>
```

```javascript
const textDuplicator = () => {
    const wordInput = document.getElementById("text-dup-input")
    const numTimesToDup = document.getElement
    const listElement = document.getElementById("text-dup-list")

    for(var i = 0; i < Number(numTimesToDup.value); i++) {
        const listItem = document.createElement("li")
        listItem.textContent = wordInput.value
        listElement.appendChild(listItem)
    }
}
```