//: [Previous](@previous)

import Foundation

var jobsApplied = ["Apple", "Peloton", "Google", "Box", "Zoom", "Bloomberg"]

var anotherArr = [Int]()

print(anotherArr.isEmpty)

//anotherArr.removeLast() // will crash because arr is empty

// in func we cold guard that arr is not empty
//guard !anotherArr.isEmpty else {
//    return
//}
//anotherArr.removeLast()

if !anotherArr.isEmpty {
    anotherArr.removeLast() // does not return an optional
}

anotherArr.popLast() // return optional -> will not crash if nil, but need to unwrap the value

// So, if we want to use .removeLast() we need to guard againts empty array (in terms to our app will not crush, but result getting not optional)
// When we using .popLast() we do not need to guard againts empty array, but in result we get optional

var names = ["Bob", "Sally", "John", "Heather"]


// searching

if let index = names.firstIndex(of: "John") { // O(n) where n is lenghth of collection
    print("found John at index \(index)")
    names.remove(at: index)
}
print(names) // ["Bob", "Sally", "Heather"]

// contains:
// array is O(n)
// Set O(1) => Hashable, can have direct access to it

// prefix

let cohorts = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]

let firstThreeCohorts = cohorts.prefix(3) // takes integer

print(firstThreeCohorts)


// suffix

let selectedInCohorts = cohorts.suffix(4)

print(selectedInCohorts)


let homomeousArray1 = [1, 2] // array of Int
let homomeousArray2 = [1, 2, 4.7] // array of Double
let heteroheneousArray: [Any] = [1, 2, 4.7, "Greg", true]

// type casting different types

//for element in heteroheneousArray {
//    if let intValue =
//}




/*
===============================================
Challenge 88:
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

// Sudocode:
// 1) Assuming that m represent number of int from firat arraey to merge I plan to create new array from nums 1 with integers that equal to m
// 2) I plan to append second array to the first
// 3) Assuming that I can use build in functions I will use sort on result-array





func mergeArrays(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int] {
    // 1) Assuming that m represent number of int from first arraey to merge I plan to create new array from nums 1 with integers that equal to m
    // I will use prefix build in func
    
    var resultArr = nums1.prefix(m)
    
    // 2) I plan to append second array to the first
    
    resultArr.append(contentsOf: nums2)
    
    //3) Assuming that I can use build in functions I will use sort on result-array
    
    return resultArr.sorted()
}

// because my parameter num1 is mutable I need to use following syntax:
// ex var myNum = 10
// and call the function ex doubleInPlace(number: &myNum)

var firstArr = [1,2,3,0,0,0]
//print(mergeArrays(&firstArr, 3, [2,5,6], 3)) // result [1, 2, 2, 3, 5, 6]







//I think I solved correctly but leetcode did not accept


func mergeArrays2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // 1) Assuming that m represent number of int from first arraey to merge I plan to create new array from nums 1 with integers that equal to m
    // I will use prefix build in func
    
    var resultArr = nums1[..<m]
    
    // 2) I plan to append second array to the first
    
    resultArr.append(contentsOf: nums2)
    
    //3) Assuming that I can use build in functions I will use sort on result-array
    
    print(resultArr.sorted())
}

var firstArr22 = [1,2,3,0,0,0]
print(mergeArrays(&firstArr22, 3, [2,5,6], 3))

/*

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var writeIndex: Int = (n + m) - 1
    
    var m = m - 1
    var n = n - 1
    
    while m >= 0 && n >= 0 {
        if (nums1[m] < nums2[n]) {
            nums1[writeIndex] = nums2[n]
            n -= 1
            writeIndex -= 1
        } else {
            nums1[writeIndex] = nums1[m]
            m -= 1
            writeIndex -= 1
        }
    }
    
    while m >= 0 {
        nums1[writeIndex] = nums1[m]
        m -= 1
        writeIndex -= 1
    }
    
    while n >= 0 {
        nums1[writeIndex] = nums2[n]
        n -= 1
        writeIndex -= 1
    }
}

var firstArr2 = [1,2,3,0,0,0]
//merge(&firstArr2, 3, [2,5,6], 3)


// The best solution!
func merge3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
       nums1 = (nums1[..<m] + nums2).sorted()
   }

var firstArr3 = [1,2,3,0,0,0]
//merge(&firstArr3, 3, [2,5,6], 3)





/*
 DSA for Class with Ameni
 ShiftZeros

 Difficulty    Tags    Solution Link
 Medium    [Arrays, Duplicates]    To Do
 Problem Description

 Given an array of numbers, reset the array to put all the non-zero numbers in front of all the zeros in the array, then return the new array and the count of non-zero numbers.

 Sample

 Input    Output
 [3,0,2,0,0,1,0,4]    [3,2,1,4,0,0,0,0], 4
 */

// Sudocode:
// I would look through array and compared all numbers to zero
// Non-zero numbers I would put infront of new result-array + made count for non-zero numbers
// zeros I would put to the back of array
// returning tuple

func returnZeros(input: [Int]) -> ([Int], Int) {
    var resultArr = [Int]()
    var resultCount = 0
    
    for num in input {
        if num < 0 || num > 0 {
            resultArr.insert(num, at: 0)
            resultCount += 1
        } else {
            resultArr.append(num)
        }
    }
    
    return (resultArr, resultCount)
}

print(returnZeros(input: [3,0,2,0,0,1,0,4])) // ([4, 1, 2, 3, 0, 0, 0, 0], 4)
// solved the challenge according to description, nut numbers are not in the same order as in output...

func returnZeros2(input: [Int]) -> ([Int], Int) {
    var resultIntArr1 = [Int]()
    var result0Arr2 = [Int]()
    var resultArr = [Int]()
    var resultCount = 0
    
    for num in input {
        if num < 0 || num > 0 {
            resultIntArr1.append(num)
            resultCount += 1
        } else {
            result0Arr2.append(num)
        }
    }
    
    resultArr = (resultIntArr1+result0Arr2)
    
    return (resultArr, resultCount)
}

print(returnZeros2(input: [3,0,2,0,0,1,0,4])) // ([3, 2, 1, 4, 0, 0, 0, 0], 4)


*/


// =================== Practice ================= //

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


// ====================== Reverse Array Challenge ================ //

/*
 unction Description
 Complete the function reverseArray in the editor below.
 reverseArray has the following parameter(s):
 int A[n]: the array to reverse
 Returns
 int[n]: the reversed array

 */

// Complete the reverseArray function below.
func reverseArray(a: [Int]) -> [Int] {


}
