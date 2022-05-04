import React from "react"
import react_logo from "./react_logo.png"

function Nav() {
    return (
        <nav className="header">
            <img src={react_logo} alt="this is a react logo"></img>
            <h1 id="nav-title">ReactFacts</h1>
            <h2 id="nav-subtitle">React Course - Project 1</h2>
        </nav>
    )
}

export default Nav