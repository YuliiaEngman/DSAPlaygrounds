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
 “Challenge 18: Recreate the pow() function
 Difficulty: Easy

 Create a function that accepts positive two integers, and raises the first to the power of the second.

 Tip: If you name your function myPow() or challenge18(), you’ll be able to use the built-in pow() for your tests. The built-in pow() uses doubles, so you’ll need to typecast.

 Sample input and output
 The inputs 4 and 3 should return 64, i.e. 4 multiplied by itself 3 times.
 The inputs 2 and 8 should return 256, i.e. 2 multiplied by itself 8 times.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */


func challenge18(base: Int, power: Int) -> Int {
    
    for
    
    return
}
