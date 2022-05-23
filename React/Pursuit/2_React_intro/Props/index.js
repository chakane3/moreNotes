/*
Props are a way to reuse the components we make
Just like how we can use a function to use it in our codebase.

Formally, props allow us to pass info to child components that theyre rendering.
Think of a basic user profile. Instead of creating a profile with hard coded data for each user,
we can instead use a template. 

Props are short for properties. We can pass a property into a component by doing this:
export default function ACoponent(props) {
    return(
        <div>
            <p>{props.propertyName}</p>
            <p>{props.anotherPropertyName}
        </div>
    )
}

We cannot pass custom props to native DOM elements because the JSX used to describe native DOM elements will we turned to real
DOM elments by react. Real DOM elements dont have the custom properties we defined in react. 


*/

prompt("Hello")