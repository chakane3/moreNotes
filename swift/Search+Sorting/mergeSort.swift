import Foundation
class MergeSort {
    /*
        mergeSort breaks down our array into single element arrays and then merges back together the 
        arrays into a sorted element. 

        1. we return the array if theres only 1 or zero elements
        2. capture the middle index
        3. split the array into a left and right sided array
        4. return our merge function

    */
    func mergeSort(_ arr: [Int]) -> [Int] {
        guard arr.count > 1 else { return arr }
        let middleIndex = arr.count / 2

        let leftArray = mergeSort(Array(arr[0..<middleIndex]))
        // print("leftArray: ", terminator: " ")
        // for i in leftArray {
        //     print(i, terminator: " ")
        // }
        // print()
        
        let rightArray = mergeSort(Array(arr[middleIndex..<arr.count]))
        // print("rightArray: ", terminator: " ")
        // for i in rightArray {
        //     print(i, terminator: " ")
        // }
        // print()

        return merge(leftArray, rightArray)
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0

        var orderedArray: [Int] = []

        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]

            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } 
            else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }

        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }

        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }

        return orderedArray
    }
}


var arr = [5, 8, 9, 1, 0, 2, 4, 3, 6, 7]
var mergeSortFunction = MergeSort()
let newArr = mergeSortFunction.mergeSort(arr)
for i in newArr {
    print(i, terminator: " ")
}

// mergeSortFunction.mergeSort(arr)