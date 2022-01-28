import Foundation

class MyMath {
    func powerOfX(_ n: Int, _ nth: Int) -> Int {

        // check if nth is greater than 1 otherwise 
        // break out of our recursive loop
        guard nth > 1 else {
            return n
        }
        return n * powerOfX(n, nth-1)
    }

    func factorial(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        return n * factorial(n-1)
    }
}

var p = MyMath()
let powerRresult = p.powerOfX(2, 3)
let factorialResult = p.factorial(3)
print(factorialResult)
