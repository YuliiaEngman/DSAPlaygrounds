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


//=================================================================================
//                          Questions: Recursion
//=================================================================================


// problem 1
/*
 Multiply two given Ints.  Do not use for/while loops or the * operator.
​
 Sample Input: 5 * 6
​
 Sample Output: 30
*/

// 5, want to add recursively 6 times.


func multiply(_ x:Int, _ y: Int) -> Int {
  guard y > 1 else {
    return x
  }

  return x + multiply(x, y - 1)
}

// return 5 + multiply(5, 5)
// return 5 + 5 + multiply(5, 4)
// return 5 + 5 + 5 + multiply(5, 3)
// return 5 + 5 + 5 + 5 + multiply(5, 2)
// return 5 + 5 + 5 + 5 + 5 + multiply(5, 1)
// return 5 + 5 + 5 + 5 + 5 + 5

// returns 30

print(multiply(5, 6))


// problem 2 // hint: you can use function arguments to hold variable states
/*
 Find the sum of all the even numbers in an array

 Sample Input: [3,6,1,3,2, 10]

 Sample Output: 18
*/

//in swift we can give functions default values


func sumOfArray(_ arr: [Int], index: Int = 0, sum: Int = 0) -> Int {
  var sum = sum

  guard index < arr.count else {
    return sum
  }

  // only valid indices are 0..<arr.count
  // an index at arr.count isnt valid, we would get a fatal error

  if arr[index] % 2 == 0 {
    sum += arr[index]
  }
  
  return sumOfArray(arr, index: index + 1, sum: sum)
  
}

// return sumOfArray(arr, index: index, sum: sum)
// return sum(index: 0, sum :0)
// return sum(index: 1, sum: 0)
// return sum(index: 2, sum 6)
// ...
// return sum(index: 5, sum: 8)
// return sum(index: 6, sum: 18)
// return 18


print(sumOfArray([3,6,1,3,2,10]))


// problem 3
// https://www.hackerrank.com/challenges/30-recursion/problem

// Complete the factorial function below.
func factorial(n: Int) -> Int {
guard n > 1 else {
  return n
}

return n * factorial(n: n-1)
}

// 0, 1, 1, 2, 3, 5, 8....
// finding fibonacci sum at the nth
// nth number the 8000th number, millionth

// OLD
// 3 * factorial(2)
// 3 * 2 * factorial(1)
// 3 * 2 * 1 * factorial(0)
// 3 * 2 * 1 * 1
// 6

// NEW
// 3 * factorial(2)
// 3 * 2 * factorial(1)
// 3 * 2 * 1
// 6


print(factorial(n: 3))

//input 3!
// output 6
