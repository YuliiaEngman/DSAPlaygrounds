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


