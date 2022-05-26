let arr = [1, 2, 3, 4, 5, 6, 7, 8]

function linearSearch(arr, target) {
    for(let i = 0; i < arr.length; i++) {
        if(arr[i] == target) {
            return true
        }
    }
    return false
}


function binarySearch(arr, target) {
    let upperBound = arr.length
    let lowerBound = 0
    while(upperBound >= lowerBound) {
        let mid = Math.floor(lowerBound + (upperBound - lowerBound) / 2)
        if(arr[mid] === target) {
            return true
        } else if(arr[mid] > target) {
            upperBound = mid-1
        } else if(arr[mid] < target) {
            lowerBound = mid+1
        }
    }
    return false
}