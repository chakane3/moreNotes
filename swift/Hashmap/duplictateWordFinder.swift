import Foundation

class DuplicateWordFinder {
    func isDuplicateWord(for arr: [String]) -> Bool {
        var result: Set<String> = []
        for word in arr {
            if result.contains(word) {
                return false
            }
            result.insert(word)
        }
        return true
    }
}

let wordArr0 = ["hello", "there", "should", "be", "no", "duplicates", "in", "here"]
let wordArr1 = ["hello", "there", "is", "a", "duplicate", "word", "so", "maybe", "we", "can", "get", "rid", "of", "a", "element"]
var df = DuplicateWordFinder() 
let resTrue = df.isDuplicateWord(for: wordArr0)
let resFalse = df.isDuplicateWord(for: wordArr1)
