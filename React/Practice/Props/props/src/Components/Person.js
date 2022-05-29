import React from "react"


export default function Person(props) {
    return (
        <div>
            <h1>{props.name}</h1>
            <h3>Age: {props.age}</h3>
            <h3>Location: {props.town}, {props.state}</h3>
        </div>
    )
}