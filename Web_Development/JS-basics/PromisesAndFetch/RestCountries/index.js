// document.querySelector("form").addEventListener("submit", loadCountries)
// function loadCountries(e) {
//     e.preventDefault()
//     const searchTerm = document.querySelector("#country-name-input").value
    
//     /*
//         fetch returns a promise that we can attach a .then() to process a response once the promise is done. 
//     */
//     fetch("https://restcountries.eu/rest/v2/name/" + searchTerm)
//     .then((response) => {

//         // check if the response is not ok
//         // note that .ok returns a boolean value
//         // we can also have response.stataus which will return a 300+ error
//         if(!response.ok) {
//             throw Error(`Something went wrong: ${response.status}`)
//         }
//         window.alert(response.json())
//         return response.json()
//     })
//     .then((countries) => {
//         countries.forEach((country) => {
//             console.log(country)
//         })
//     })
//     .catch((error) => {
//         console.log(error)
//     })
// }


// const loadCountries = () => {
//     document.querySelector("form").addEventListener("submit", loadCountries,)
//     const searchTerm = document.querySelector("#country-name-input").value
    
//     /*
//         fetch returns a promise that we can attach a .then() to process a response once the promise is done. 
//     */
//     fetch("https://restcountries.eu/rest/v2/name/" + searchTerm)
//     .then((response) => {

//         // check if the response is not ok
//         // note that .ok returns a boolean value
//         // we can also have response.stataus which will return a 300+ error
//         if(!response.ok) {
//             throw Error(`Something went wrong: ${response.status}`)
//         }
//         window.alert(response.json())
//         return response.json()
//     })
//     .then((countries) => {
//         countries.forEach((country) => {
//             console.log(country)
//         })
//     })
//     .catch((error) => {
//         console.log(error)
//     })
// }
