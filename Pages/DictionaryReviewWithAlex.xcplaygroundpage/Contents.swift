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
  // here I want to protect my code form empty input //guard against empty array
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

    var largestValue = Int.min // (key, value) // use first elelment in the array // am I sure that we using array here and not dictionary?
    var largestKey = Int.min

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


// Abstarct data struct

class Node {
    var value: Int // if its optional we may not need initializer
    var next: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

func printNode(node: Node?) {
    var currentNode = node
    
    while let currentNodeNotOptional = currentNode {
        print(currentNodeNotOptional.value, terminator: " -> ")
        currentNode = currentNodeNotOptional.next
    }
    print("nil")
}

//1 -> 2 -> 3 -> nil

// I am creating
let node1 = Node(1)
let node2 = Node(2)
let node3 = Node(3)

node1.next = node2
node2.next = node3

printNode(node: node1)

//print(node1)



// Ask Alex or Cameron:

// Is it the same to conform to Custom String convertable vs make a printFunc
// to use for loop do we need to conform to IteratorSequence and write logic for it?
// why Node in print func should be optional???




// ================ Populate Dictionary ================== //

// 3 ways:

let array = [1, 2, 2, 3, 1, 1, 3]
var freqDict = [Int: Int]()
for num in array {

    // Way #1:
  // if let count = freqDict[num] {
  //   freqDict[num] = count + 1
  // } else {
  //   freqDict[num] = 1
  // }
    
    // Way #2:
     //freqDict[num] = (freqDict[num] ?? 0) + 1
    
    // Way #3:
    //freqDict[num, default: 0] += 1
}

print(freqDict)


// Given an array of values, return the value that appears most frequently.
// If there are multiple values, any of the most frequent values is fine.
// So:
//   mostCommonInteger([1, 2, 1, 4, 2, 2, 2, 4]) -> 2
//   mostCommonInteger([1, 1, 2, 2]) -> 1


// Sudocode: (Psuedo-code)
// input is arr of Int
// output -> Int most frequent
// create an empty dict and populate it
// go through dict and return key that has the largest value

func mostCommonInteger(numbers : [Int]) -> Int {

  // 1) create an empty dict and populate it
  var freqDict = [Int: Int]()
 
  for num in numbers {
    if let count = freqDict[num] {
      freqDict[num] = count + 1
    } else {
      freqDict[num] = 1
    }
  }

 // [5, 1, 1, 2, 3, 3, 3, 3, 3]
  // [1: 2, 2: 1, 3: 5] -> need to return 3

  // I need to create 2 properties:
  // 1 for key
  // 2 for value

  var largestValue = Int.min // we will start from min value
  var largestKey = Int.min

  for (key, value) in freqDict {
      // DON'T DO WHAT I'm ABOUT TO TYPE, IT IS NOT FOR THIS PROBLEM
      // maxValue = Math.Max(maxValue, freqDict[key]);

      if largestValue < value {
        largestValue = value
        largestKey = key
      }
  }

  return largestKey // should get return 3 (key, not value)
}

print(mostCommonInteger(numbers : [5, 1, 1, 2, 3, 3, 3, 3, 3]))
