//: [Previous](@previous)

import Foundation

/*
 860. Lemonade Change
Easy

651

80

Add to List

Share
At a lemonade stand, each lemonade costs $5.

Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills).

Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill.  You must provide the correct change to each customer, so that the net transaction is that the customer pays $5.

Note that you don't have any change in hand at first.

Return true if and only if you can provide every customer with correct change.

 

Example 1:

Input: [5,5,5,10,20]
Output: true
Explanation:
From the first 3 customers, we collect three $5 bills in order.
From the fourth customer, we collect a $10 bill and give back a $5.
From the fifth customer, we give a $10 bill and a $5 bill.
Since all customers got correct change, we output true.
Example 2:

Input: [5,5,10]
Output: true
Example 3:

Input: [10,10]
Output: false
Example 4:

Input: [5,5,10,10,20]
Output: false
Explanation:
From the first two customers in order, we collect two $5 bills.
For the next two customers in order, we collect a $10 bill and give back a $5 bill.
For the last customer, we can't give change of $15 back because we only have two $10 bills.
Since not every customer received correct change, the answer is false.
 

Note:

0 <= bills.length <= 10000
bills[i] will be either 5, 10, or 20.
 */

/*
class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        
        var changeBills = [Int]()
        
        // I probably need to use contain
        
        if bills.first == 5 {
            changeBills.append(bills.first ?? 5)
        } else {
            return false
        }
        
        
}
 */


func lemonadeChange(_ bills: [Int]) -> Bool {
    
    var billsForChange = [Int]()
    var sumOfChange = 0
    
    for bill in bills {
        
        if bill == 5 {
            billsForChange.append(5)
            sumOfChange += 5
        } else if bill == 10 && sumOfChange % 5 == 0 { //or "bills.contains(5)"
            billsForChange.append(10)
            let billForChangeIndex = bills.firstIndex(of: 5)
            billsForChange.remove(at: billForChangeIndex ?? 5)
            sumOfChange += 5
        } else if bill == 20 && billsForChange.contains(5) && billsForChange.contains(10) {
            billsForChange.append(20)
            let billForChangeIndex = bills.firstIndex(of: 5)
            
            let billForChangeIndex2 = bills.firstIndex(of: 10)
            billsForChange.remove(at: billForChangeIndex2 ?? 10)
            billsForChange.remove(at: billForChangeIndex ?? 5)
            sumOfChange += 5
            
        } else if bill == 20 && billsForChange.contains(5) && billsForChange.contains(5) && billsForChange.contains(5) {
            billsForChange.append(20)
            let billForChangeIndex = bills.firstIndex(of: 5)
            
            let billForChangeIndex2 = bills.firstIndex(of: 5)
            let billForChangeIndex3 = bills.lastIndex(of: 5)
            billsForChange.remove(at: billForChangeIndex3 ?? 5)
            billsForChange.remove(at: billForChangeIndex2 ?? 5)
            billsForChange.remove(at: billForChangeIndex ?? 5)
            sumOfChange += 5
        } else {
            return false
        }
    }
    return true
}
    
print(lemonadeChange([5,5,5,10,20])) //true
print(lemonadeChange([5,5,10])) //true
//print(lemonadeChange([10,10])) //false
print(lemonadeChange([5,5,10,10,20])) //false
print(lemonadeChange([20,20])) //false
print(lemonadeChange([5,5,10,20])) //true
print(lemonadeChange([5,5,5,20])) //true
print(lemonadeChange([5,5,10,5,5,5,20])) //true

// Greg's real life interview solution:

// item = $5
// Array of customers, with 5, 10, or 20
// [5, 10, 20, 5, 10]
// Customers must remain in order
// starting balance is $0
// Each value is its own denomination
// return true if everyone has correct change, return false if change is not able to be made for everyone
// Array can be empty
// Psuedo code
/*
Input: [Int], output: Bool
protect an empty array, return true if empty
Array variables for 5, 10, 20 (initial value 0), balance(?)
Iterate through customers, determine the denomination they're paying, and check my balance if I have change for them
If no change, return false, otherwise remove customer and continue
Once the customers are done, I can return true
*/
// Input: [5, 5, 10]
/*
func makeChangeForFives(_ customers: [Int]?) -> Bool {
    guard var customerArray = customers else { return true } // it should be let
    var fives = [Int]()
    var tens = [Int]()
    var twenties = [Int]()
    for customer in customerArray { // 10
      switch customer {
        case 5:
        fives.append(customer) // fives = [5, 5]
        case 10:
        tens.append(customer) // tens = [10]
        case 20:
        twenties.append(customer)
        default:
        return false
      }
      var change = customer - 5 // 5
      if change == 5 {
        if !fives.isEmpty {
          fives.dropLast // fives = [5]
        } else if change == 15 {
          if !tens.isEmpty {
            if !fives.isEmpty { // change = Ten, five
              tens.dropLast
              fives.dropLast
            } if fives.count > 3 { // here is a problem and should be fixed
              fives.dropLast
              fives.dropLast
              fives.dropLast
            } else {
              return false
            }
          }
        }
      }
    }
    return true
}
 */

// Best solution for this problem:
func makeChangeForFives2(_ customers: [Int]) -> Bool {
    var fives = 0
    var tens = 0
    
    for customer in customers {
      switch customer {
        case 5:
          fives += 1
        case 10:
          tens += 1
          fives -= 1
        case 20:
          if tens > 0 { // I would write >= 1
            tens -= 1
            fives -= 1
          } else {
            fives -= 3 // -1 I owe you
          }
        default:
          return false
      }
        guard fives >= 0 else { return false } // basically if after any math there is a minus of fives return false
        // could I write that above? (before switch statement?)
    }
    return true
}
print(makeChangeForFives2([5,5,5,10,5,10,20,5,10])) // true
print(makeChangeForFives2([])) // true, because we do not have customers, we do not owe money to the customers and therefore we have enough change to everyone


/*
 MatrixSum

 Difficulty    Tags    Solution Link
 Easy    [Arrays, Matrices, Integers]    To Do
 Problem Description

 Find the sum of all elements in a two dimensional, rectangular array except for the corners.

 Sample

 Input    Output
 1 3 9 2
 3 2 0 3
 2 8 1 4
 */



