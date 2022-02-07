/*
given a list of of integers and another integer k
find 2 pairs of numbers that sum to k
this algorithm must run in O(n)
*/

class Solution {
    func kSums(for arr: [Int], target: Int) -> [[Int]] {
        // create an empty dictionary
        var result: [Int : Int] = [:]
        var ret: [[Int]] = [[]]

        // traverse through an enumerated version of the array
        for (idx, value) in arr.enumerated() {

            // calculate our difference
            let res = target - value

            // check if res exists in our dictionary
            if result.keys.contains(res) {
                ret.append(contentsOf: [[idx, result[res]!]])  
                print(result[res]!)
            }

            // if it doesnt, then add it to the dictionary
            result[value] = idx
        }
        return ret
    }
}

var twoSum = Solution()
var arr = [1, 2, 3, 4, -2, -3]
let res = twoSum.kSums(for: arr, target: 1)
print(res)

