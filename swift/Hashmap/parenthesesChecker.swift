class Solution {
    func parenthesesChecker(for arr: [String]) -> Bool {
        // create an empty dictionary
        var parenDict: [String:Int] = [:]

        // add in all the values from our arr into the dictionary
        for element in arr {
            if parenDict.keys.contains(element) {
                parenDict[element] += 1
            } else {
                parenDict[element] = 1
            }
        }
        return true




    }
}


let parens1 = ["[", "(", "[", ")", "]", "}", "{", "{"]

var ppCheck = Solution() 
ppCheck.parenthesesChecker(for: parens1)