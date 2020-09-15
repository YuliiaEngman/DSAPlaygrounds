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
        
        var sumOfChange = [Int]()
        
        for bill in bills {
            
            if bill == 5 {
                sumOfChange.append(5)
            } else if bill == 10 && bills.contains(5){
                sumOfChange.append(10)
                let billForChangeIndex = bills.firstIndex(of: 5)
                sumOfChange.remove(at: billForChangeIndex ?? 5)
            } else {
                return false
            }
        }
        return true
    }
    
    print(lemonadeChange([5, 10, 20]))


var array : [String]
array = ["one","two","one"]

let itemToRemove = "one"

while array.contains(itemToRemove) {
    if let itemToRemoveIndex = array.index(of: itemToRemove) {
        array.remove(at: itemToRemoveIndex)
    }
}

print(array)





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


