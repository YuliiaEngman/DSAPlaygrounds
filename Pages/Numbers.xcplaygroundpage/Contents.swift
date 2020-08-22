//: [Previous](@previous)

import Foundation

/*
 “Challenge 16: Fizz Buzz
 Difficulty: Easy

 Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.

 Sample input and output
 1 should print “1”
 2 should print “2”
 3 should print “Fizz”
 4 should print “4”
 5 should print “Buzz”
 15 should print “Fizz Buzz”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge16() {
    
    for num in 1...100 {
        if num % 3 == 0 && num % 5 == 0  {
            print("Fizz Buzz")
        } else if num % 5 == 0 {
            print("Buzz")
        } else if num % 3 == 0 {
            print("Fizz")
        } else {
            print(num)
        }
    }
}

print(challenge16())


/*
 “Challenge 17: Generate a random number in a range
 Difficulty: Easy

 Write a function that accepts positive minimum and maximum integers, and returns a random number between those two bounds, inclusive.

 Sample input and output
 Given minimum 1 and maximum 5, the return values 1, 2, 3, 4, 5 are valid.
 Given minimum 8 and maximum 10, the return values 8, 9, 10 are valid.
 Given minimum 12 and maximum 12, the return value 12 is valid.
 Given minimum 12 and maximum 18, the return value 7 is invalid.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge17(input1: Int, input2: Int) -> Int {
    
    var arr = [Int]()
    
    for num in input1...input2 {
        arr.append(num)
    }
    
    return arr.randomElement()!
}

print(challenge17(input1: 1, input2: 5))
print(challenge17(input1: 8, input2: 10))
print(challenge17(input1: 12, input2: 12))
print(challenge17(input1: 12, input2: 18))

// Simplies solution:

// However, we did not guard against negative numbers

//“func challenge17a(min: Int, max: Int) -> Int {
//    return Int.random(in: min...max)
//}”
//
//Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.


/*
 “Challenge 19: Swap two numbers
 Difficulty: Easy

 Swap two positive variable integers, a and b, without using a temporary variable.!

 Sample input and output
 Before running your code a should be 1 and b should be 2; afterwards, b should be 1 and a should be 2.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */


func challenge19(a: Int, b: Int) -> (a: Int, b: Int) {
    var a = a
    var b = b
    
    a = a + b // sum a = 1 + 2 -> 3
    b = a - b // b = 3 - 2 -> 1
    a = a - b // a = 3 - 1 -> 2
    
    return (a, b)
}

print(challenge19(a: 1, b: 2))


/*
 “Challenge 20: Number is prime
 Difficulty: Tricky

 Write a function that accepts an integer as its parameter and returns true if the number is prime.

 Tip: A number is considered prime if it is greater than one and has no positive divisors other than 1 and itself.

 Sample input and output
 The number 11 should return true.
 The number 13 should return true.
 The number 4 should return false.
 The number 9 should return false.
 The number 16777259 should return true.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge20(input: Int) -> Bool {
    
    if input >= 1 && input % 2 != 0 { // or > 0
        if input % 3 != 0 && input % 5 != 0 {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
}

print(challenge20(input: 11)) // -> true
print(challenge20(input: 13)) // -> true
print(challenge20(input: 4)) // -> false
print(challenge20(input: 9)) // -> false
print(challenge20(input: 16777259)) // -> true
print(challenge20(input: 1)) // -> true
