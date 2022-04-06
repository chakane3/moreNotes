document.querySelector("form").addEventListener("submit", loadCountries)
function loadCountries(e) {
    e.preventDefault()
    const searchTerm = document.querySelector("#country-name-input").value
    
    /*
        fetch returns a promise that we can attach a .then() to process a response once the promise is done. 
    */
    fetch("https://restcountries.eu/rest/v2/name/" + searchTerm)
    .then((response) => {

        // check if the response is not ok
        if(!response.ok) {
            throw Error(`Something went wrong: ${response.status}`)
        }
        return response.json()
    })
    .then((countries) => {
        countries.forEach((country) => {
            console.log(country)
        })
    })
    .catch((error) => {
        console.log(error)
    })
}

