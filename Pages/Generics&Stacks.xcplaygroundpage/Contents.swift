import UIKit


// Objective
/*
 - inout functions
 - generics, generics function
 - stack: using a generic type
 */

// inout function (inout = I am able to change those variables outside the function)
//in-place means that our function should be an inout function
func swapTwoInt(int1: inout Int, int2: inout Int) {
    let temp = int1 // we saved value of int1 to avoid overriden it
    int1 = int2
    int2 = temp
}

var num1 = 4
var num2 = 13

print("values of ints before swap is \(num1) \(num2)")
swapTwoInt(int1: &num1, int2: &num2)
print("values of ints after swap is \(num1) \(num2)")

// WITH GENERICS WE CAN WRITE FUNCTON TAHT WILL TAKE INT, DOUBLE, STRINGS ETC. (IT EXPECTS THE SAME TYPES)

//GENERIC FUNCTION

func swapTwoValues<T>(value1: inout T, value2: inout T) { // in this brackets <> we can write our generic type/element, here we use T = Type
    let temp = value1
    value1 = value2
    value2 = temp
}

// if we startem with string we have to continue with string, if with Int continue with Int
var name1 = "Alex"
var name2 = "Paul"

print("values of ints before swap is \(name1) \(name2)")
swapTwoValues(value1: &name1, value2: &name2)
print("values of ints after swap is \(name1) \(name2)")


// GENERICS AND TYPE ANY IT IS DIFFERENT
//Any is not type-safe
//Generic enforces type-safety

var arr: [Any] = [45, 7, 9, "Alex", 80.9]
arr.append("fellow")



// Implement a Generic Stack using an array

struct IntStack {
    private var elements = [Int]()
}

// generic type
struct Stack<T> {
    private var elements = [T]() // works with any type (not Any)
    
    public var peek: T? {
        return elements.last
    }
    
    public mutating func push(item: T) {
        elements.append(item)
    }
    
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast()
    }
}

var cohorts = Stack<Double>()
cohorts.push(item: 1.0)
cohorts.push(item: 2.0)
cohorts.push(item: 3.0)
cohorts.push(item: 4.0)
cohorts.push(item: 5.0)
cohorts.push(item: 6.3)

print(cohorts.peek) // 6.3

cohorts.pop()
cohorts.pop()

print(cohorts.peek) // 4.0

struct Fellow {
    let name: String
    let language: String
    let isEmployed: Bool
}

let ameni = Fellow(name: "Ameni", language: "Swift", isEmployed: true)
let tom = Fellow(name: "Tom", language: "Kotlin", isEmployed: false)

var fellows = Stack<Fellow>()
fellows.push(item: tom)
print(fellows) // ["Tom"]


//NEW PROBLEM:

class MinStack {
  init() {
     
  }
  var arrOfInts = [Int]()
  var minNum = [Int]()
   
  func push(x: Int) {
    arrOfInts.append(x)
     
    if minNum.count == 0 {
      minNum.append(x)
    } else {
      if let minNumber = minNum.last, let lastNum = arrOfInts.last {
        if lastNum <= minNumber {
         minNum.append(lastNum)
      }
    }
  }
   
     
  }
  func pop() -> Int {
    guard !arrOfInts.isEmpty else {
      return 0
    }
    let removedNum = arrOfInts.popLast()
    if let numRemoved = removedNum {
        
      //  let min1 = minNum.last {
        if numRemoved == arrOfInts.last {
        minNum.popLast()
      }
    }
    return arrOfInts.last ?? 0
  }
   
  func top() -> Int? {
    guard !arrOfInts.isEmpty else {
      return nil
    }
      return arrOfInts.last
     
  }
   
  func getMin() -> Int? {
    return minNum.last ?? 0
  }
}
let obj = MinStack()
//
obj.push(x: -8)
obj.push(x: 10)
obj.push(x: -5)
obj.push(x: 100)
obj.top()
obj.getMin()
obj.pop()
obj.top()
obj.getMin()

//class MinStack {
//  init() {
//
//  }
//  var arrOfInts = [Int]()
//  var minNum = [Int]()
//
//  func push(_ x: Int) {
//    arrOfInts.append(x)
//
//    if minNum.count == 0 {
//      minNum.append(x)
//    } else {
//      if let minNumber = minNum.last, let lastNum = arrOfInts.last {
//        if lastNum <= minNumber {
//         minNum.append(lastNum)
//      }
//    }
//  }
//
//
//  }
//  func pop() -> Int {
//    guard !arrOfInts.isEmpty else {
//      return 0
//    }
//    let removedNum = arrOfInts.popLast()
//    if let numRemoved = removedNum, let min1 = minNum.last {
//      if numRemoved == min1 {
//        minNum.removeLast()
//      }
//    }
//    return removedNum ?? 1000
//  }
//
//  func top() -> Int {
//    guard !arrOfInts.isEmpty else {
//      return 0
//    }
//      return arrOfInts.last ?? 1000
//
//  }
//
//  func getMin() -> Int {
//    return minNum.last ?? 1000
//  }
//}


struct Stack<T: Equatable>: Equatable {
  private var elements = [T]()
  
  static func ==(lhs: Stack, rhs: Stack) -> Bool {
    return lhs.elements == rhs.elements
  }
  
  public var peek: T? {
    return elements.last
  }
  
  public var count: Int {
    return elements.count
  }
  
  public var isEmpty: Bool {
    return elements.isEmpty
  }
  
  // add to the top of the stack (end)
  public mutating func push(_ value: T) {
    elements.append(value) // O(1)
  }
  
  // remove from the top of the stack
  public mutating func pop() -> T? {
    guard !elements.isEmpty else {
      return nil
    }
    return elements.removeLast() // O(1)
  }
}

var stack = Stack<Int>()
stack.push(5)
stack.push(9)
stack.push(17)
stack.push(30)

var otherStack = Stack<Int>()
otherStack.push(15)
otherStack.push(120)
otherStack.push(2)

//Problem One:
//Find the largest integer in a Stack of Ints

//var stack = stack
//var largest = Int.min ex: -53463456323
//var smallest = Int.max ex: 592235235235
//while loop


func largest(stack: Stack<Int>) -> Int {
  var stack = stack
  var largest = Int.min

  while let pop = stack.pop() {
    if pop > largest {
      largest = pop
    }
  }
  return largest
}

assert(largest(stack: stack) == 30, "should be equal to 30")
assert(largest(stack: otherStack) == 120, "should be equal to 120")



//Problem Two:
//Find the sum of a Stack of Ints
// Set<Int>
// Queue<Int>

func sum(stack: Stack<Int>) -> Int {
  var stack = stack
  var sumInt = 0

  while let pop = stack.pop() {
    sumInt += pop
  }
  return sumInt
}


assert(sum(stack: stack) == 61, "should be equal to 61")
assert(sum(stack: otherStack) == 137, "should be equal to 137")



//Problem Three:
//Reverse a Stack without using an Array
//Sample input:
/*
 4
 2
 9
 3
 */

//Sample output:
/*
 3
 9
 2
 4
 */

 // 3   4   we say stack.pop ... = 3
 // 9   2                          9
 // 2   9                          2
 // 4   3
 //
 

 //create a new empty stack
 //remove elements from first stack and put them on order to second stack w

func reverse<T: Comparable>(stack: Stack<T>) -> Stack<T> {
  var stack = stack
  var newStack = Stack<T>()

  // singleton = db.Database()
  // array = [Int]()

  while let pop = stack.pop() {
    newStack.push(pop)
  }
  return newStack
}

var originalStack = Stack<Int>()
originalStack.push(4)
originalStack.push(2)
originalStack.push(9)
originalStack.push(3)

var reversedStack = Stack<Int>()
reversedStack.push(3)
reversedStack.push(9)
reversedStack.push(2)
reversedStack.push(4)

assert(reverse(stack: originalStack) == reversedStack, "should be equal to reversedStack")



//Problem Four:
//Write a function that pushes a new element to the bottom of a Stack

// -8  -8
// 7. 7
// 3. 3
// 10 10
//    17

// var stack = stack
// newStack
// newStack.push new element

// while newStack.pop, stack.push
// return stack

func pushBottom<T>(stack: Stack<T>, newElement: T) -> Stack<T> {
  var stack = stack
  var newStack = Stack<T>()

  while let pop = stack.pop() {
    newStack.push(pop)
  }

  newStack.push(newElement)

  while let pop = newStack.pop() {
    stack.push(pop)
  }

  return stack
}

var stackWithoutNewElement = Stack<Int>()
stackWithoutNewElement.push(10)
stackWithoutNewElement.push(3)
stackWithoutNewElement.push(7)
stackWithoutNewElement.push(-8)

var stackWithNewElement = Stack<Int>()
stackWithNewElement.push(17)
stackWithNewElement.push(10)
stackWithNewElement.push(3)
stackWithNewElement.push(7)
stackWithNewElement.push(-8)

assert(pushBottom(stack: stackWithoutNewElement, newElement: 17) == stackWithNewElement, "should be equal stack with new element")

// Bonus Question: https://leetcode.com/problems/valid-parentheses/
}



