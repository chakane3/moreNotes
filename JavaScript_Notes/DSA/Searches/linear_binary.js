let arr = [1, 2, 3, 4, 5, 6, 7]

function linearSearch(arr, target) {
    for(let i = 0; i < arr.length; i++) {
        if(arr[i] == target) {
            return true
        }
    }
    return false
}


let myFunc = {
    showArgs() {
        console.log(arguments)
    }
}

let x = myFunc.showArgs(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)
console.log(x[0])
