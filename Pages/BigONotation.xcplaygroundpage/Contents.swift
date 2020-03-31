import UIKit

//=================================================================================
//                Questions: Big O Notation
//=================================================================================

// problem 1: what is the runtime
// runtime O(1)
//func exampleOne(arr: [String]) {
//  for _ in 0..<1_000_000 {
//    print("Many printings!")
//  }
//
//}
//
//// arr 5 elements
//// print million times
//
//// arr 200 elements
//// print million times
//
//
//// problem 2: what is the runtime
//func exampleTwo(arr: [String]) {
//  for string in arr {
//    print(string)
//  }
//}
//
//// runtime of O(n)
//
//
//// problem 3: what is the runtime
//func exampleThree(arr: [String]) {
//  for stringOne in arr {
//    for stringTwo in arr {
//      print("Player One: \(stringOne), Player Two: \(stringTwo)")
//    }
//  }
//}
//
//// runtime of O(n^2)
//
//
//// problem 4: what is the runtime
//func exampleFour(arr: [String]) {
//  guard arr.count > 0 else {
//    return
//  }
//  print(arr[0])
//
//  // constnat = O(1)
//  // linear = O(n)
//  // quadratic = O(n^2)
//}
//
//
//// problem 5: what is the runtime
//func exampleFive(arr: [Int]) -> Int {
//  var counter = 0
//  for num in arr {
//    if arr.contains(num+1) {
//      counter += 1
//    }
//  }
//  return counter
//}
//// runtime is O(n^2)
//
//// for arrays = .contains is always O(n)
//// dictionarys & sets, .contains is always O(1)
//
//// problem 6: what is the runtime
//func exampleSix(string str: String, withCharacter c: Character) -> Bool {
//
//  for char in str { //O(n)
//    if char == c {
//      return true
//    }
//  }
//  return false
//}
//
////exampleSix(string: "Chocolate", withCharacter: "c")
//
//// best case O(1)
//// average O(logn)
//// worst O(n)
//
//// Choc -> True
//// O(n)
//
//// O(logn) better than O(n)
//// worse than O(1)
//
//
//// problem 7: what is the runtime
//func example7(arr: [Int]) {
//  for num in arr {
//    print(num)
//  }
//
//  for _ in arr {
//    for num in arr {
//      print(num)
//    }
//  }
//
//  for num in arr {
//    print(num)
//  }
//
//  //O(n^2)
//}
//
//
//// problem 8: what is the runtime
//func secondSmallest(myArr: [Int]) -> Int? {
//  guard myArr.count > 1 else {
//    return nil
//  }
//  var min = myArr[0]
//  var minIndex = 0
//  for (index, num) in myArr.enumerated() { O(n)
//    if num < min {
//      min = num
//      minIndex = index
//    }
//  }
//  var secondMin = (myArr[0] != min ? myArr[0] : myArr[1])
//  for (index, num) in myArr.enumerated() {
//    if num < secondMin && index != minIndex {
//      secondMin = num
//    }
//  }
//  print(min, minIndex, secondMin)
//  return secondMin
//}

// O(n)
// O(1)

//=================================================================================
//                          Solutions: Big O Notation
//=================================================================================

/*
 problem 1: O(1) - constant time
 problem 2: O(n) - linear time
 problem 3: O(n ^ 2) - quadratic time
 problem 4: O(1) - constant time
 problem 5: O(n ^ 2) - quadratic time
 problem 6: O(n) - linear time
 problem 7: O(n ^ 2) - quadratic time
 problem 8: O(n) - linear time
*/


//? what is a runtime for this code?
func foo(arr: [Int]) {
  for val in arr {
    print(val)
  }
}
print(foo(arr: [1,3,4,5,610]))

func bar(arr: [Int]) {
  for val in arr {
    foo(arr: arr)
  }
  for val in arr {
    foo(arr: arr)
  }
}
