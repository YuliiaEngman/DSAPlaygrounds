import UIKit

// Sorting algorythms:
// slower: O(n ^ 2) - bubble sort, insertion sort
// faster: n log n - will review later

//Insertion sort:
// Runtime: O(n ^ 2)
//space complexity: O(1) - Constant, because sorts in place
// Slightly more performant than buuble sort
// given a partially sorted ([4, 5, 9, -2]) array and smaller (about 100) sized array could be a good choice sorting algorithm

//Swift's sorting algoriths (hybrid algorythm) is n log n, uses insetion
//sort on small, partiallt sorted arrays


func insertionSort(_ arr: inout [Int]) {
    
    for current in 1..<arr.count {
        guard arr.count >= 2 else { return }
        for j in (1...current).reversed() {
            if arr[j] < arr[j - 1] {
                // swap - using bult-in swap (you can use swap at interview, if interviewer asked do not use - see how we used it in BubbleSort)
                //arr.swapAt(<#T##i: Int##Int#>, <#T##j: Int##Int#>)
                arr.swapAt(j, j-1)
            } else { // left side of array is sorted
                break // (does not break entire func but inner loop) OR continue to outer loop
                // continue to outer loop OR break
            }
        }
    }
}

var list = [4, 5, 9, -2]
insertionSort(&list)

print(list)

///////////////////////
//Given an array of integers nums, sort the array in ascending order.
//Input: nums = [5,2,3,1]
//Output: [1,2,3,5]

//sort by ascending order


func sortArray(_ nums: [Int]) -> [Int] {
  var nums = nums
  insertionSort(&nums)
    
    func insertionSort(_ arr: inout [Int]) {
      // arr = [1]
    guard arr.count >= 2 else { return }

    for current in 1..<arr.count {
      for j in (1...current).reversed() {
        if arr[j] < arr[j-1] {
          arr.swapAt(j, j-1)
        } else {
          break
        }
       }
      }
    }

  return nums
}
