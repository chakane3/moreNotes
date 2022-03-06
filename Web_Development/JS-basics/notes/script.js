console.log("Hello, now we can get to rockin'!")

// access elements
// window.alert("YEAT IS ASS")
// const userSubmittedName =  window.prompt("Whos a GOAT rapper?")
// window.alert(`It's ${userSubmittedName} bro`)

// const getYeated = document.getElementById("yeatBoi")
// window.alert(`${getYeated.textContent}`);
// console.log(getYeated.textContent)

// set elements in the DOM
// const userSubmittedName = window.prompt("Enter a good rapper")
// const rapper = document.getElementById("lastPara")
// rapper.textContent += `, ${userSubmittedName}`

// const addNameToHeading = () => {
//     const nameInputElement = document.getElementById("name-input-text")
//     const userSubmittedName = nameInputElement.value
//     const topHeadingElement = document.getElementById("top-heading")
//     topHeadingElement.textContent = `My website: Made especially for ${userSubmittedName}`
// }

// create new elements in the DOM
// let newP = document.createElement("p")
// newP.textContent = "YB diss song goated"
// document.body.appendChild(newP)"

// count how many paragraphs we have
// document.addEventListener("DOMContentLoaded", () => {
//     let p = document.querySelectorAll("p")
//     window.alert(`There are ${p.length} paragraphs`)
//     let headings = document.querySelectorAll("p")
//     let str = ""
//     for(let heading of headings) {
//         str += heading.innerText
//         str += "\n"
//     }
//     window.alert(str)
// })

// event listeners for click and mouseover
// document.addEventListener("DOMContentLoaded", () => {
//     let favbtn = document.querySelector("#favoriteBtn")
//     favbtn.addEventListener("click", () => {
//         window.alert("You clicked on my fav button!!!")
//     })
// })
// document.addEventListener("DOMContentLoaded", () => {
//     let pushinP = document.querySelector("#specialP")
//     pushinP.addEventListener("mouseover", () => {
//         window.alert("You hovered over a p tag")
//     })
// })

// alternative take on adding event listeners by splitting up in seperate functions
// document.addEventListener("DOMContentLoaded", () => {
//     configureButtonClickEvent()
// })
// function configureButtonClickEvent() {
//     let favbtn = document.querySelector("#favoriteBtn")
//     favbtn.addEventListener("click", showButtonAlert)
// }
// function showButtonAlert() {
//     window.alert("You clicked on my favorite button")
// }

// we can have a submit event fired off when a form is submitted
// document.addEventListener("DOMContentLoaded", () => {
//     let form = document.querySelector("form")
//     let userInput = document.querySelector("#userInput")
//     form.addEventListener("submit", (event) => {
//         window.alert(`You have submitted your form, thank you a ton ${userInput.value}`)
//     })
// })

document.addEventListener("DOMContentLoaded", () => {
    let form = document.querySelector("form")
    form.addEventListener("submit", (event) => {
        event.preventDefault()
        window.alert("You have submitted your form")
    })
})








