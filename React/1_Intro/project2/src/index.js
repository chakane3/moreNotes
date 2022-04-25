import React from "react"
import ReactDom from "react-dom"
import "./Components/MainContent"
import MainContent from "./Components/MainContent"
import NavBar from "./Components/NavBar"
import "./style.css"

function App() {
    return (
        <div className="container">
            <NavBar />
            <MainContent />
        </div>
    )
}

ReactDom.render(<App />, document.getElementById("root"))


