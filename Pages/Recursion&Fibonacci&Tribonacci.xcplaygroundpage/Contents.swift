import UIKit

//Recursion Exercises

//1. Find the factorial of a given number (review)
//Factorial definition:
//
//5 factorial = 5! = 5 * 4 * 3 * 2 * 1 = 120

func factorial(value: Int) -> Int {
    if value == 0 {
        return 1
    }
    print(value)
    return value * factorial(value: value - 1)
}

factorial(value: 5)

//FIBONACCI:

func fibRecursion(numSteps: Int, first: Int, second: Int) -> [Int] {
    if numSteps == 0 {
        return []
    }
    return [first + second] + fibRecursion(numSteps: numSteps - 1, first: second, second: first + second)
}

[0, 1] + fibRecursion(numSteps: 9, first: 0, second: 1)


//func factorial(value: Int) -> Int {
//    if value == 0 {
//        return 1
//    }
//    print(value)
//    return value * factorial(value: value - 1)
//}
//
//factorial(value: 5)

//func fibRecursionNum(num: Int) {
//    if num >= 1  else {
//        return 1
//    }
//        (num - 1) + (num - 2) * fibRecursionNum(num: num - 1)
//}
//
//fibRecursionNum(num: 4)



// formula fib(n) = (n-1) + (n-2)
//func fibonacci(_ n: Int) -> Int {
//    // base case
//    guard n > 2 else {
//        return 1
//    }
//    return fibonacci(n - 1) + fibonacci(n - 2)
//}
//
//fibonacci(4)
//fibonacci(8)
//fibonacci(20) // runs 6786 times


//TRIBONACCI:

//func tribonacci(_ n: Int) -> Int {
//    if n == 0 {
//        return 0
//    }
//    guard n > 2 else {
//        return 1
//    }
//    return tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
//}
//
//tribonacci(6)

//  we have to catch those reuslts - Dynamic memoization
// WE ARE NOT USING RECURSION ALREADY, BUT INSTEAD ARE DOUNG DICTIONARY

//var fibDict = [Int:Int]()
//func dynamicFib(_ n: Int) -> Int {
//    // do we already have the fib value?
//
//    //retrieving
//    if let fibResult = fibDict[n] { // [4:3]
//        return fibResult
//    }
//    guard n > 2 else {
//        return 1
//    }
//    let fibResult = dynamicFib(n-1) + dynamicFib(n-2)
//    fibDict[n] = fibResult // cache (saving) the results (memoization)
//    return fibResult
//}
//
//dynamicFib(20)

var triDict = [Int:Int]()
func dynamicTri(_ n: Int) -> Int {
    if let triResult = triDict[n] {
        return triResult
    }
    if n == 0 {
        return 0
    }
    guard n > 2 else {
        return 1
    }
    let triResult = dynamicTri(n-1) + dynamicTri(n-2) + dynamicTri(n-3)
    triDict[n] = triResult
    return triResult
}

dynamicTri(8)
