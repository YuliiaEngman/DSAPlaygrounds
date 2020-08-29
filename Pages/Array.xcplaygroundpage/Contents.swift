//: [Previous](@previous)

import Foundation

/*
 “Challenge 37: Count the numbers
 Difficulty: Easy

 Write an extension for collections of integers that returns the number of times a specific digit appears in any of its numbers.

 Sample input and output
 The code [5, 15, 55, 515].challenge37(count: "5") should return 6.
 The code [5, 15, 55, 515].challenge37(count: "1") should return 2.
 The code [55555].challenge37(count: "5") should return 5.
 The code [55555].challenge37(count: "1") should return 0.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge37(input1: [Int], input2: Int) -> Int? {
    
    //let strFromArr: String = input1
    //let oneStr = strFromArr.replacingOccurrences(of: ", ", with: "")
    
    let arrOfStr = input1.map { String($0) }
    var strFromArr = ""
    var result = ""
    
    
    for num in arrOfStr {
        strFromArr += num
    }
    
    for strNum in strFromArr {
        if strNum == Character(String(input2)) {
            result += String(strNum)
        }
    }
    return result.count
}
