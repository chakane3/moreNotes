const addNewParagraph = () => {
    const newParagraph = document.createElement("p")
    newParagraph.textContent = "This a newly added paragraph element"
    document.body.appendChild(newParagraph)
}

const logAParagraph = () => {
    const secondParagraph = document.body.querySelector(".second")
    console.log(secondParagraph.textContent)
}

const updateTheFirstParagraph = () => {
    const firstParagraph = document.body.querySelector("#para1")
    firstParagraph.textContent = "The paragraph has just been changed"
}

const deleteFirstParagraph = () => {
    const divisionOne = document.getElementById("div1")
    const paraOne = document.getElementById("para1")
    divisionOne.removeChild(paraOne)
    console.log("You just deleted the first paragraph")
}

