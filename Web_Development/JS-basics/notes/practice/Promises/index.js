document.querySelector("form").addEventListener("submit", loadCountries) 

// GET request using fetch
function loadCountries(e) {
    e.preventDefault()
    const searchTerm = document.querySelector("#country-name-input").value
    fetch("https://restcountries.com/v3.1/name/" + searchTerm)
    .then((response) => {
        if(!response.ok) {
            throw Error(`Something went wrong, status ${response.status}`)
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

// POST request using fetch











// Chained promise example
const tryAdding = (num1, num2) => {
    if(num1 + num2 < 0) {
        return false
    }
    return true
}
const successMsg = (result) => {
    console.log("THIS WAS A SUCCESS")
}

const failureMsg = () => {
    console.log("THIS WAS A FAILURE")
}

const catchMsg = () => {
    console.log("You gave some weird input")
}

const aPromise = new Promise((resolve, reject) => {
    if(tryAdding(2+2) == false) {
        resolve(console.log("The 2 numbers added give a negative output"))
    } else {
        reject(Error("The 2 numbers added give a positive output"))
    }
})

// aPromise
// // .then(onsuccess, onFailure))
// .then(successMsg, failureMsg)  // 1st try
// .then(newResult => {           // 2nd try with different inputs
//     return tryAdding(2, -23)
// })
// .then(successMsg, failureMsg) 

