//: [Previous](@previous)

import Foundation

// Output is a tuple

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
