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

const addNameToHeading = () => {
    const nameInputElement = document.getElementById("name-input-text")
    const userSubmittedName = nameInputElement.value
    const topHeadingElement = document.getElementById("top-heading")
    topHeadingElement.textContent = `My website: Made especially for ${userSubmittedName}`
}

