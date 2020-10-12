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

func challenge37(input1: [Int], input2: String) -> Int {
    
    //let strFromArr: String = input1
    //let oneStr = strFromArr.replacingOccurrences(of: ", ", with: "")
    
    let arrOfStr = input1.map { String($0) }
    var strFromArr = ""
    var result = ""
    
    
    for num in arrOfStr {
        strFromArr += num
    }
    
    for strNum in strFromArr {
        if strNum == Character(input2) {
            result += String(strNum)
        }
    }
    return result.count
}

print(challenge37(input1: [5, 15, 55, 515], input2: "5")) // expected 6
print(challenge37(input1: [5, 15, 55, 515], input2: "1")) // expected 2
print(challenge37(input1: [55555], input2: "5")) // expected 5
print(challenge37(input1: [55555], input2: "1")) // expected 0

/*
 “Challenge 38: Find N smallest
 Difficulty: Easy

 Write an extension for all collections that returns the N smallest elements as an array, sorted smallest first, where N is an integer parameter.

 Sample input and output
 The code [1, 2, 3, 4].challenge38(count: 3) should return [1, 2, 3].
 The code ["q", "f", "k"].challenge38(count: 10) should return [“f”, “k”, “q”].
 The code [256, 16].challenge38(count: 3) should return [16, 256].
 The code [String]().challenge38(count: 3) should return an empty array.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

//func challenge38<T>(input1: [T], input2: Int) -> [T] {
//    let value = input1
//    let sortedArr = value.sorted(by: < )
//
//
//    return result
//}
//
//print(challenge38(input1: [1, 2, 3, 4], input2: 3))

/*
 func f<T>(_ input: T) -> T {
     let value = input
     return value
 }

 print(f(45))
 print(f(false))
 */


// Default parameter!!!

func currentCohort(_ cohort: Double = 6.0) {
    print("current cohort is \(cohort)")
}

currentCohort() // current cohort is 6.0
currentCohort(7.0) // current cohort is 7.0


// Leetcode problem
// Homework - review inout parameters

/*
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

 Note:

 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is equal to m + n) to hold additional elements from nums2.
 Example:

 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 Output: [1,2,2,3,5,6]
 */


    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        for num in nums2 {
            nums1.append(num)
        }
       nums1.sorted()
    }
    
    var input = [1,2,3,0,0,0]
    print(merge(&input, 3, [2,5,6], 3))


// Input 2 arrays of Int [1, 2, 3] [2, 2, 0] => [2]
// return 1 [Int] that contain matching Int

func returnMatchingInt(input1: [Int], input2: [Int]) -> [Int] {
    // if we can use built-in func I would use contains
    
    var result = [Int]()
    
    //let uniqArr = Set()
    //let setInput2 = Set(input2)
    
    for num in Set(input1) {
        if Set(input2).contains(num) {
            result.append(num)
        }
    }
    return result
}

print(returnMatchingInt(input1: [1, 2, 2, 3], input2: [2, 2, 0]))

// merge into 1 and return that double and triples

/*
448. Find All Numbers Disappeared in an Array
Easy

3332

264

Add to List

Share
Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

Find all the elements of [1, n] inclusive that do not appear in this array.

Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

Example:

Input:
[4,3,2,7,8,2,3,1]

Output:
[5,6]
 */

class Solution {
    // Sudocode:
    // I have an array of Ints (range) and need tofind Int that are not apperaed as input but are in range
    // Ex.: input [1, 2, 5], output will be 3, 4
    // I would sorth the array first
    // I would loop through array starting from first index and check all Int + 1
    // I would create an empty result array
    
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var resultArr = [Int]()
        let sortedInputArr = nums.sorted()
        let range = (sortedInputArr.last + 1) - sortedInputArr.first
        
        for num in sortedInputArr {
            if sortedInputArr[1] = num + 1
            continue
        } else {
            resultArr.append(num)
        }
        
        
    }
}
