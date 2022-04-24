import React from "react"
import ReactDOM from "react-dom"
import react_logo from "./react_logo.png"
import "./style.css"

function Header() {
    return (
        <header>
            <nav className="nav">
                <img src={react_logo} className="reactLogo" alt="this is a react logo"/>
                <ul className="nav-items">
                    <li>Pricing</li>
                    <li>About</li>
                    <li>Contact</li>
                </ul>
            </nav>
        </header>
    )
}

export default Header