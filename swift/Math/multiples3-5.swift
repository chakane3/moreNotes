import Foundation

/*
If we list all the natural numbers below 10 that are 
multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these 
multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*/
public class Multiples {
    func threeToFiveSum(forNum num: Int) -> Int {
        var sum = 0
        for number in 0..<num {
            if number % 3 == 0 {
                sum += number
            }
            if number % 5 == 0 {
                sum += number
            }
        }
        return sum
    }
}

var solution = Multiples()
print(solution.threeToFiveSum(forNum: 10))