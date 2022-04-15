const newElement = document.createElement("h1")
const elementToAppendTo = document.getElementById("root")
newElement.textContent = "This is a brand new h1 element that was added to our div"
elementToAppendTo.appendChild(newElement)

console.log(newElement)

