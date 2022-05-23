import React from "react"
import Jokes from "./Components/Jokes"

export default function App() {
    return(
        <div>
            <Jokes 
                setup="Why did the bird not cross the road"
                punchline="Because its chicken"
                isString = {true}
                aNumber = {32}

            />
            <Jokes
                setup="Its hard to explain things to kleptomaniacs because"
                punchline="They always take things so literally" 
                isString = {true}
                aNumber = {1}
            />
            <Jokes
                setup="Are you from Tenessee?"
                punchline="Because im on the tenesee sex offerder registry"
                isString = {true}
                aNumber = {12}
            />
            <Jokes 
                setup="Who killed bill"
                punchline="Me. I did"
                isString = {true}
                aNumber = {0.5449}
            />
        </div>
    )
}
