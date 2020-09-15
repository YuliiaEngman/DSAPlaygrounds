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
    
    if input > 1 && input % 2 != 0 { // or >= 2
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
print(challenge20(input: 1)) // -> false
print(challenge20(input: 2)) // -> false


/*
 “Challenge 23: Integer disguised as string
 Difficulty: Tricky

 Write a function that accepts a string and returns true if it contains only numbers, i.e. the digits 0 through 9.

 Sample input and output
 The input “01010101” should return true.
 The input “123456789” should return true.
 The letter “9223372036854775808” should return true.
 The letter “1.01” should return false; “.” is not a number.
 ”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

// want to use built in func isNumber - work just for 1 character!
func challenge23(input: String) -> Bool {
    
    var intCount = [Character]()
    
    for i in input {
        if i.isNumber {
            intCount.append(i)
        }
    }
    return intCount.count == input.count
}

print(challenge23(input: "01010101")) // -> true
print(challenge23(input: "123456789")) // -> true
print(challenge23(input: "9223372036854775808")) // -> true
print(challenge23(input: "1.01")) // -> false

/*
 
 fastest solution:
 
 “func challenge23a(input: String) -> Bool {
     return UInt(input) != nil
 }”
 
 Another way:
 
 “func challenge23b(input: String) -> Bool {
     for letter in input {
         if Int(String(letter)) == nil {
             return false
         }
     }

     return true
 }
 As you can see, you can create integers from strings, and strings from characters, but you can’t create integers from characters – d’oh (can use built-in func).”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */


/*
 “Challenge 24: Add numbers inside a string
 Difficulty: Tricky

 Given a string that contains both letters and numbers, write a function that pulls out all the numbers then returns their sum.

 Sample input and output
 The string “a1b2c3” should return 6 (1 + 2 + 3).
 The string “a10b20c30” should return 60 (10 + 20 + 30).
 The string “h8ers” should return “8”.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge24(input: String) -> Int {
    
    var sum = 0
    
    for i in input {
        if i.isNumber {
            sum += Int(String(i))!
        } else {
            continue
        }
    }
    return sum
}

print(challenge24(input: "a1b2c3")) // 6
print(challenge24(input: "a10b20c30")) // The solution should be fixed!
print(challenge24(input: "h8ers"))

// Ok, so can I subsitute letters with + sign?

func challenge24a(input: String) {
    
    var newInput = String()
    
    for letter in input {
        if letter.isLetter {
            newInput = newInput + "+"
        } else if letter.isNumber {
            newInput = newInput + String(letter)
        }
    }

print(newInput)

}

/*
 “Let’s take a look at the simple solution first, which is hopefully similar to the one you came up with. The algorithm is this:

 Create an empty string that represents the current number being read.
 Create a sum value that contains the total of all numbers so far, initialized to 0.
 Loop through every letter in the input string, converting the character to a String.
 If we can convert that string to an integer, add it to the current number string.
 Otherwise it’s not a number, so convert the current number string to an integer, or 0 if it’s an invalid integer, add it to the sum and clear the current number string.
 Finally, convert any remaining value in the current number string to an integer, and add it to sum.
 Return sum.
 Here’s that list translated into code:

 func challenge24a(string: String) -> Int {
     var currentNumber = ""
     var sum = 0

     for letter in string {
         let strLetter = String(letter)

         if Int(strLetter) != nil {
             currentNumber += strLetter
         } else {
             sum += Int(currentNumber) ?? 0
             currentNumber = ""
         }
     }

     sum += Int(currentNumber) ?? 0
     return sum
 }
 ”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge24b(string: String) -> Int {
    var currentNumber = ""
    var sum = 0

    for letter in string {
        let strLetter = String(letter)

        if Int(strLetter) != nil {
            currentNumber += strLetter
        } else {
            sum += Int(currentNumber) ?? 0
            currentNumber = ""
        }
    }

    sum += Int(currentNumber) ?? 0
    return sum
}

print(challenge24b(string: "a10b20c30"))

// I am taking ny previouse func and fixing it:

func challenge24Fixed(input: String) -> Int {
    
    var sum = 0
    var currentNumberStr = ""
    
    for i in input {
        if i.isNumber {
            //sum += Int(String(i))!
            currentNumberStr += String(i)
        } else {
            sum += Int(currentNumberStr) ?? 0
            currentNumberStr = ""
        }
        sum += Int(currentNumberStr) ?? 0
    }
    return sum
}

print(challenge24b(string: "a10b20c30")) // Should get unswer 60


// Review with Alex:

// empty and nil are different things!!!
// therefore we are not taking
func minMaxFromArr(input: [Int]) -> (Int, Int)? { // result.0 and result.1

  var minNum = Int.min
  var maxNum = Int.max

  for num in input {
    if num < minNum {
      minNum = num
    } else if num > maxNum {
      maxNum = num
    }
  }
 return (minNum, maxNum)
}


// Alex solution:
func minMax (_ inputArr: [Int]) -> (min: Int, max: Int)? { // result.0 and result.1

 // guarding against empty arr
 guard let first = inputArr.first else {
   return nil // not (nil, nil)
 }

  var minNum = first
  var maxNum = first

  for num in inputArr {
    if num < minNum {
      minNum = num
    } else if num > maxNum {
      maxNum = num
    }
  }
 return (minNum, maxNum) // tuple
}

let result = minMax([3, -12, 3, 67, 0, 100, 5]) ?? (0, 0)

print("min is \(result.min)")
print("max is \(result.max)")

