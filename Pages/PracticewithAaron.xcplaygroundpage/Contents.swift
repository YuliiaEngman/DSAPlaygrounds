//: [Previous](@previous)

import Foundation


// a = [ 5, 3, 6, 2, 1, 0]
// i = 3
// RemoveIthElement(a, i)
// a should have the numbers 5, 3, 6
// constant time!

func removeIthElement(arr : inout [Int], i : Int) {

 // arr.remove(at: i)
 let endIndex = arr.count - 1

  arr.swapAt(i, endIndex)
  arr.removeLast()
}

// func removeAtFunc(arr : inout [Int], i: int);

var arr = [ 5, 3, 6, 2, 1, 2, 3, 4, 5]
removeIthElement(arr: &arr, i: 3)
print(arr) // [5, 3, 6, 5, 1, 2, 3, 4]
