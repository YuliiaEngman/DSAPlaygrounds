//: [Previous](@previous)

import Foundation

/*
*/

// What is the runtime of the following code? Explain your reasoning.

// func foo(arr: [Int]) {
//   for val in arr { // O(n )
//     print(val)
//   }
// }

// func bar(arr: [Int]) {
//   for val in arr { // O(n)
//     foo(arr) // O(n )
//   } // O(n ^ 2)

//   for val in arr {
//     foo(arr)
//   }
// }



// dict

let arr = [1,1,2,3,3,4,4,5,3,3,3,2,3,3,2]

// write a function that takes an array and returns a dictionary of key, value pairs
// where the key is the value in the array and the value is the number of times the value appears
func frequentlyDict(input: [Int]) -> [Int: Int] {
  var result = [Int: Int]()

  // for (key, value) in input {
    
  // }

  for num in input {
    // if result.key = num {
      
    // }
    // look to see if the num is existing as a key in the dictionary
    if let count = result[num] {
      result[num] = count + 1
    } else {
      result[num] = 1
    }
  }

  return result
}

print(frequentlyDict(input: arr))

func frequentlyDictKey(input: [Int]) -> Int? {
  // here I want to protect my code form empty input //guard against empy array
  guard !input.isEmpty else {
    return nil
  }

  
  var result = [Int: Int]()

  // for (key, value) in input {
    
  // }

  for num in input {
    // if result.key = num {
      
    // }
    // look to see if the num is existing as a key in the dictionary
    if let count = result[num] {
      result[num] = count + 1
    } else {
      result[num] = 1
    }
  }

 // loop through the dict
 // look tha values
 // compare values
 // find the kay and value
 // [3: 7, 4: 2, 5: 1, 1: 2, 2: 3]

  var largestValue = input[0] // (key, value) // use first elelment in hte array
  var largestKey = 0

  for (key, value) in result {
    if largestValue < value { // 1 < 7
      largestValue = value // 7
      largestKey = key
    }
  }
  return largestKey
}

print(frequentlyDictKey(input: arr) ?? 0)


/*
func someFunc(variableName: DataType) {

}*/

// print(frequetlyDict(input: arr))



// Home work

// redo what we did today

// linked list

// 1. print the values of a linked list
// 2. find a value from a linked list and return the node
// 3. https://leetcode.com/problems/merge-sorted-array/

