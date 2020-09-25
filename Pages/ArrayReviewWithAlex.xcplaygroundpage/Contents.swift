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

//

var names = ["Bob", "Sally", "John", "Heather"]


// searching

if let index = names.firstIndex(of: "John") { // O(n) where n is lenghth of collection
    print("found John at index \(index)")
    names.remove(at: index)
    
    
}

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


func mergeArrays2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int] {
    // 1) Assuming that m represent number of int from first arraey to merge I plan to create new array from nums 1 with integers that equal to m
    // I will use prefix build in func
    
    var resultArr = nums1[..<m]
    
    // 2) I plan to append second array to the first
    
    resultArr.append(contentsOf: nums2)
    
    //3) Assuming that I can use build in functions I will use sort on result-array
    
    return resultArr.sorted()
}

var firstArr22 = [1,2,3,0,0,0]
print(mergeArrays(&firstArr22, 3, [2,5,6], 3))


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
merge(&firstArr2, 3, [2,5,6], 3)


// The best solution!
func merge3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
       nums1 = (nums1[..<m] + nums2).sorted()
   }

var firstArr3 = [1,2,3,0,0,0]
merge(&firstArr3, 3, [2,5,6], 3)





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



 

