//: [Previous](@previous)

import Foundation

/*
 215. Kth Largest Element in an Array
 Medium

 4282

 283

 Add to List

 Share
 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Example 1:

 Input: [3,2,1,5,6,4] and k = 2
 Output: 5
 Example 2:

 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4
 Note:
 You may assume k is always valid, 1 ≤ k ≤ array's length.
 */

// Sudocode:
// If I can use build it func I would do following steps:
// 1) Sorted array
// 2) MAde it reverse
// 3) Find correct index for the Int I am looking for

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sortedArr = nums.sorted() // step 1 -> [1,2,3,4,5,6]
       
        // step 2
     // I will not do reversed array but instead I will work with array indexes
        // count is 6, I need to return 2nd element in array from back
        
        var resultIndex = 0
        
        resultIndex = sortedArr.count - k
        
        return sortedArr[resultIndex]
    }

print(findKthLargest([3,2,1,5,6,4], 2)) // 5
print(findKthLargest([3,2,3,1,2,4,5,5,6], 4)) // 4
