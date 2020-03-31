import UIKit

//BubbleSort - sorting algorithm (sorting in place)
// runtime: looking for worst runtime - O(n ^ 2) - quadratic (considered as the worse sorting algorithm),
// best case it would be On - when our array is sorted already
//spacecomplexity: Constant O(1) - constant - sorts in place (inout function)


//we are not returning a new array!
//using inout - means that we have referance to the same array and returning the same array

func bubbleSort(_ arr: inout [Int]) { //inout indicates in place manipulation
    
    for _ in 0..<arr.count { // runtime outter loop O(n)
        guard arr.count >= 2 else { return }
        for j in 1..<arr.count { // runtime inner loop O(n)
            // j is basically the number in position that we compare with previous nuber
            if arr[j] < arr[j - 1] {
                //swap
                //implement swap without using the build-in swap function
                let temp = arr[j]
                arr[j] = arr[j - 1]
                arr[j - 1] = temp
            }
        }
    }
}

var list = [10, 2, -8, 4] //list needs to be a var since we changing list itself

//bubbleSort(<#T##arr: &[Int]##[Int]#>) -> to use it we should write like below
bubbleSort(&list)
print(list)

//////////////
///////////////////////
//Given an array of integers nums, sort the array in ascending order.
//Input: nums = [5,2,3,1]
//Output: [1,2,3,5]

//sort by ascending order

public func bubbleSort<T: Comparable>(_ array: inout [T]) {
  guard array.count >= 2 else {
    return
  }

  for end in (1..<array.count).reversed() {
    var swapped = false

    for current in 0..<end {
      // array[0] > array[1]
      // input [ 5, 2, 3, 1]
      // array[0] = 5, array[1] = 2
      // 5 > 2
      // array[0] = 2, array[1] = 5
      // array[1] > array[2]
      // array[2] = 5, array[1] = 3

      if array[current] > array[current + 1] {
        array.swapAt(current, current + 1)
        swapped = true
      }
    }

    if !swapped {
      return
    }
  }
}

print()
print(sortArray(input) == output)
print(sortArray(input))
print(output)

bubbleSort(&input)
print(input)
print(input == output)
