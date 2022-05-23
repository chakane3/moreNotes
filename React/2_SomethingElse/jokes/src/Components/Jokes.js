import React from "react"

export default function Jokes({setup, punchline, isString, aNumber}) {
    return (
        
        <div className="jokes">
            <ul>
                <p>Joke No. {aNumber}</p>
                <li>{setup}</li>
                <li>{punchline}</li>
            </ul>
        </div>   
    )
} 