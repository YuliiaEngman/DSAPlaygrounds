import UIKit

// merge sort
// worst, best and average runtime in O(n log n)
// uses divide and conquer
// splits the array in two using the middle index
// uses recurion until a base case count is > 1
// then merges individual arrays back together while sorting

func mergeSort(_ arr: [Int]) -> [Int] {
    // base case count is greatrer than 1
    guard arr.count > 1 else { return arr }
    let middleIndex = arr.count / 2
    
    //left array includes beginning array up to but not including the middle index
    let leftArray = mergeSort(Array(arr[..<middleIndex]))
    let rightArray = mergeSort(Array(arr[middleIndex]...))
    
    return [Int]()
}

// HELPER FUNC - combine two sorted arrays (HERE IS A MAGORITY OF WORK HAPPENS HERE
func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var resultsArray = [Int]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        //compare
        if leftElement < rightElement {
            resultsArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultsArray.append(rightElement)
            rightIndex += 1
        } else {
            resultsArray.append(leftElement)
            leftIndex += 1
            resultsArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    if leftIndex < leftArray.count {
        resultsArray.append(contentsOf: leftArray[leftIndex...])
    }
    if rightIndex < rightArray.count {
        resultsArray.append(contentsOf: rightArray[rightIndex...])
    }
    return resultsArray
}

let list = [12, 8, 29, -100, 0, 234]
let sortedList = mergeSort(list)
print(sortedList) //[-100, 0, 8, 12, 29, 234]


//GENERIC:

func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    // base case count is greatrer than 1
    guard arr.count > 1 else { return arr }
    let middleIndex = arr.count / 2
    
    //left array includes beginning array up to but not including the middle index
    let leftArray = mergeSort(Array(arr[..<middleIndex]))
    let rightArray = mergeSort(Array(arr[middleIndex...]))
    
    return [T]()
}

// HELPER FUNC - combine two sorted arrays (HERE IS A MAGORITY OF WORK HAPPENS HERE
func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var resultsArray = [T]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        //compare
        if leftElement < rightElement {
            resultsArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultsArray.append(rightElement)
            rightIndex += 1
        } else {
            resultsArray.append(leftElement)
            leftIndex += 1
            resultsArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    if leftIndex < leftArray.count {
        resultsArray.append(contentsOf: leftArray[leftIndex...])
    }
    if rightIndex < rightArray.count {
        resultsArray.append(contentsOf: rightArray[rightIndex...])
    }
    return resultsArray
}

let list2 = [12, 8, 29, -100, 0, 234]
let sortedList2 = mergeSort(list)
print(sortedList2) //[-100, 0, 8, 12, 29, 234]



//Given an array of integers nums, sort the array in ascending order.
//Input: nums = [5,2,3,1]
//Output: [1,2,3,5]

//sort by ascending order

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
// integers are comparable

guard array.count > 1 else {
  return array
}

  let middle = array.count / 2

  let left = mergeSort(Array(array[..<middle]))
  let right = mergeSort(Array(array[middle...]))

  return merge(left, right)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
  var leftIndex = 0
  var rightIndex = 0

  var result = [T]()

  while leftIndex < left.count && rightIndex < right.count {
    let leftElement = left[leftIndex]
    let rightElement = right[rightIndex]

    if leftElement < rightElement {
      result.append(leftElement)
      leftIndex += 1
      // [0], now we're gonna be at [1]
    } else if leftElement > rightElement {
      result.append(rightElement)
      rightIndex += 1
    } else {
      result.append(leftElement)
      leftIndex += 1
      result.append(rightElement)
      rightIndex += 1
    }
  }

  // its possible we went through the entire left array, or right array
  // left.count = 92
  // leftIndex = 7
  if leftIndex < left.count {
    result.append(contentsOf: left[leftIndex...])
    //result.append all the contents from left[7...92], [1, 3, 5, 3, 5]
  }

  if rightIndex < right.count {
    result.append(contentsOf: right[rightIndex...])
  }

  return result
}

var input2 = [5,1,1,2,0,0]
var output2 = [0,0,1,1,2,5]

print()
print(output2)
print(mergeSort(input2) == output2)

// mergeSort(input2)
// left = [5, 1, 1], right = [2, 0, 0]
// left = [5, 1] & [1] right = [2, 0] & [0]
// [1] [5] & [1].    [2] [0] & [0]
// [1, 5] & [1].  [0, 2] & [0]
// [1, 1, 5] & [0, 0, ,2]
// [0, 0, 1, 1, 2, 5]
