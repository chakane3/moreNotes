import React from "react"
import People from "./People"
import Person from "./Components/Person"
export default function App() {
    const peopleElements = People.map(person => {
        return <Person
                name={person.name}
                age={person.age}
                town={person.town}
                state={person.state}
                />
    })
    return (
        <div>
            {peopleElements}
        </div>
    )
}
