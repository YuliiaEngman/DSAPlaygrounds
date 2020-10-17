//: [Previous](@previous)

import Foundation

// ============== Certification From Twitter (Interview #1) =========== //

// Given two arrays, write a function that returns all elements that appear in both arrays.

// arr1 = [1, 2, 3]
// arr2 = [2, 3, 4]
// output resultArr = [2, 3]

// Pseudo-code:
// arr1 = [1, 2, 2, 3] // can have duplicates inside
// arr2 = [2, 3, 4]
// output resultArr = [2, 3]

// DON'T scared -> go look your old code
// thinking about better names
// avoid numbers and names

// findDuplicates(in arr1...)
func duplicatesInt(arr1: [Int], arr2: [Int]) -> [Int] {
  

  // result
  var resultArr = [Int]()

  let setFromArr = Set(arr1) // [1, 2, 3] // - O(n)
  let setTwoFromArr = Set(arr2) // 2, 3, 4 // - O(n)
  // compar numbers across arrays
  for num in setFromArr { // [1, 2, 3]// - O(n)
    if setTwoFromArr.contains(num) { // - O(1)
      resultArr.append(num) // [2, 3]  // - O(1)
    }
    // if duplicate add to result
  }

  return resultArr // [2, 3]
}

print(duplicatesInt(arr1: [1, 2, 2, 3], arr2: [2, 3, 4]))

func ==(arrayLeft: [Int])



// ============== Certification From Twitter (Interview #2) =========== //

//
// Given a string str, a duplicate removal consists of choosing two adjacent and equal letters, and removing them.

// We repeatedly make duplicate removals on S until we no longer can.

// Return the final string after all such duplicate removals have been made. It is guaranteed the answer is unique.

// let input = "bookkeeper""bookkeeper"""
// let expectedOutput = "bper"
// let input = "aaabbaca"
// "aaabbaca" , stack is empty
// stack : "a", string : "aabbaca"
// stack : empty, string : "abbaca"
// "abbaca",
// "aaca"
// "ca"
// let expectedOutput = "ca"
// The input string will only contain lowercase letters in the set [a-z]*

// input only lowercased
// Pseudo-code:
// Input -> String, output -> String
// need to remove letter that has 1 duplicate
// return will be just uniq letters


// Create a stack of characters.
// Iterate of the input string. If the current character is at the top of the stack, pop from the stack. Otherwise, push the element to the stack.
// Join the stack and return it.


// var stack = [Character]()

// stack.append(char)
// stack.popLast()


let input = "abbaca"

func removeDuplicates(input: String) -> String {

  var seenChar = [Character]()

  for char in input { // "abbaca"
    if seenChar.last() == char { //
      seenChar.removeLast() // '""'
      //seenChar = ""
    } else {
      seenChar.append(char) // "ab"
    }
  }

  return seenChar // "ca"
}

print(removeDuplicates(input: input))
