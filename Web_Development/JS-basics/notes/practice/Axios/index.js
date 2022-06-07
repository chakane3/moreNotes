
const axios = require('axios').default;

const button = document.body.querySelector("button")
button.addEventListener("click", fireRequest);

function fireRequest() {
    axios
    .get("https://jsonplaceholder.typicode.com/posts")
    .then(response => {
        console.log(response)
    })
    .catch(err => {
        console.log(err)
        debugger
    })
}