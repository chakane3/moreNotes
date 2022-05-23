import React from "react"
import "./Components/MainContent"
import MainContent from "./Components/MainContent"
import Nav from "./Components/NavBar"
import "./style.css"


function App() {
    return (
        <div className="Content">
            <Nav />
            <MainContent />
        </div>
    )
}

export default App