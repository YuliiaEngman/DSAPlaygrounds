import UIKit

// binary search - implemented using recursion

//binary search - we use searching algorithm to search for a ginen value

//runtime - 0(lon n) - as array is dividing on each pass

//array must be sorted
// array is devided in halves to find the middle index
//based in the current value at the middle index we either continue searching to the left of the middle index
// or
// continue searching for the value to the rignt of the middle index
// we use divide and conquer and implement the steps above
// until we find our value or do not find a value when steps
// have been exhausted

// implementing binary search using recursion

func binarySearch<T: Comparable>(_ arr: [T], searchKey: T, range: Range<Int>) -> Int? {
    
    //check to ensure that the upper bound is higher than the lower bound
    
   // if 5 > 0 return nil - > [4, 5, 8] - > lower bound would be index [0], upper bound would be index [2]
    if range.lowerBound >= range.upperBound {
        return nil
    }
    
    // calculate middle index
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    // need 3 checks to do:
    // 1. is middle index value equal to searchKey (if it is we have found the search key)
    // 2. if the value at the middle index is greater than the search key we will now look at the left side of the middle index
    // 3. if the value at the middle index is less than search value, we look to the right
    
    // check 1
    if arr[middleIndex] == searchKey {
        return middleIndex
    }
    
    // check 2 (looking at left side)
    else if arr[middleIndex] > searchKey { // left side of middle index, (we are not including middle index)arr
        return binarySearch(arr, searchKey: searchKey, range: range.lowerBound..<middleIndex)
    }
    
    // check 3 - look at the right side of the middle index (we are not including middle index)
    else  if arr[middleIndex] < searchKey {
        return binarySearch(arr, searchKey: searchKey, range: middleIndex + 1..<range.upperBound)
    }
    
    // did not find the value
    return nil
}

let sortedList = [1, 6, 9, 13, 34, 99, 101]

let index = binarySearch(sortedList, searchKey: 99, range: (0..<sortedList.count))

print("found index \(index ?? -999)") // should return index 5

let characters = ["a", "b", "c", "y"]
let charIndex = binarySearch(characters, searchKey: "y", range: (0..<characters.count))
print("found char index: \(charIndex ?? -1)")



//Review of Binary Search Tree

class TreeNode {
  var left: TreeNode?
  var right: TreeNode?
  var value: Int
  init(_ value: Int) {
    self.value = value
  }
}

extension TreeNode {
  func insert(_ newValue: Int) {
    if newValue < value { // go left if newValue is greater than current node's value
      if left != nil {
        // keep calling insert recursively on left node
        left!.insert(newValue)
      } else {
        // create a new node and attach as left child
        left = TreeNode(newValue)
      }
    } else { // go right
      if right != nil {
        // call insert recursively on right child
        right!.insert(newValue)
      } else {
        right = TreeNode(newValue)
      }
    }
  }

  // search logic
  /*
   1. check current node to verify if target value
   2. if target value is less than current node value then search left
   3. else search right
  */

  func contains(_ targetValue: Int) -> Bool {
    // 1. check current node to verify if target value
    if targetValue == value { // equal to current node value
      return true
    }
    // 2. if target value is less than current node value then search left
    if targetValue < value { // search left
      if left != nil {
        // call contains recursively on left child
        return left!.contains(targetValue)
      } else {
        return false
      }
    } else { // search right
      if right != nil {
        // visit recursively
        return right!.contains(targetValue)
      } else {
        return false
      }
    }
  }

  func inOrderTraversal() {
    left?.inOrderTraversal() // vist left
    print("\(value)", terminator: " ") // visit current node
    right?.inOrderTraversal() // visit right
  }
}

/*
        12
      /    \
     5     32
*/


// 5 12 32


let rootNode = TreeNode(12)
rootNode.insert(5)
rootNode.insert(32)

rootNode.inOrderTraversal() // 5 12 32

rootNode.contains(5) // true

rootNode.contains(-5) // false
