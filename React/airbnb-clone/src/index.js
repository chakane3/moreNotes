import React from "react"
import ReactDom from "react-dom"

function App() {
    const firstName = "Chakane"
    const date = new Date()
    const hours = date.getHours()
    const minutes = date.getMinutes()
    let timeOfDay

    if(hours < 12) {
        timeOfDay = "morning"
    } else if(hours >= 12 && hours < 17) {
        timeOfDay = "afternoon"
    } else {
        timeOfDay = "evening"
    }


    return (
        <h1>Good {timeOfDay}, {firstName}! The time right now is: {hours}:{minutes} </h1>
    )
}

ReactDom.render(<App />, document.getElementById("root"))