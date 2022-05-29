# Components & Props
Components allow us to reuse our code. Our components can accept "props" which stand for properties we may want to pass to our components. Think of a twitter page, there are many pieces of the user interface in which have the same look, but different data. Theres 2 ways we can look at this. We could have a component that looks like this:

```javascript
function App() {
    return (
        <div className="contacts">
            <Contact 
                img="./images/mr-whiskerson.png" 
                name="Mr. Whiskerson"
                phone="(212) 555-1234"
                email="mr.whiskaz@catnap.meow"
            />
            <Contact 
                img="./images/fluffykins.png"
                name="Fluffykins"
                phone="(212) 555-2345"
                email="fluff@me.com"
            />
        </div>
    )
}
```

What we have here is a component called Contact which has data we want to add. We can repeat Contact to add in different data for each instance. At this point we have properties for the Contact component. Our contact component will have the jsx to render our page using the props we see above.<br>



## .map()
This method creates a new array. Heres some examples of how we use them.

```javascript
const arr1 = [2, 3, 4]
const map1 = arr1.map(x => x+1)
// map1 -> [3, 4, 5]
```

```javascript
const names = ["chakane", "chris", "mike"]
const namesMapCapitalized names.map((name) => {
    return name[0].toUpperCase() + name.slice(1)
})
```

```javascript
const pokemon = ["Bulbasaur", "Charmander", "Squirtle"]
const pokemonMap = pokemon.map(x => `<p>${x}</p>`)

// or we can do
const pokeminMap = pokemon.map((x) => {
    return `<p>${x}</p>`
})
```

# Mapping Components
Another way of doing this is by using the map method. Think of how in ios development where we have some json data either locally or via an API. We have to parse through the JSON to fill in our cells. The JS map method will allow us to do the same. 



