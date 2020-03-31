import UIKit


//quick sort implementation using Lomuto's Partitionong algorithm

//Quick sort uses a pivot in our example we use the last element as the pivot
//Using this pivot we split the array to the left of the pivot and to the right of the pivot
// example 10, -9, 0, -11, (pivot is 13), 80
//Quick sort uses devide and conquer is spliting the problem in half on every interaction (for recursive call)
// runtime: O(n log n)

//IMPLEMENTING LOMOTO"S PARTITIOINING

// return new index which we will use as the pivot to partition
//the array into a left and rignt side array

//FUNC 1 - partitioning
//low - beginning of the array
//high - end of array
func lomutoPartition(_ arr: inout[Int], low: Int, high: Int) -> Int {
    let pivot = arr[high] // using last element in array
    var i = low
    
    //
    for j in low..<high {
        if arr[j] <= pivot {
            // swap and increment i
            arr.swapAt(i, j)
            i += 1
        }
    }
    //last swapping high (last element) with i
    arr.swapAt(i, high)
    return i
}

//FUNCTION 2
// & - because inout
func quicksortLomuto(_ arr: inout [Int], low: Int, high: Int) {
    if low < high {
        // get a new pivot
        let pivot = lomutoPartition(&arr, low: low, high: high)
        
        // recursive calls
        //left array
        quicksortLomuto(&arr, low: low, high: pivot - 1)
        
        //right array
        quicksortLomuto(&arr, low: pivot + 1, high: high)
    }
}

var list = [80, 10, -9, 0, -11, 13, 90, -8, 1, -90, 80, 10, -9, 0, -11, 13, 90, -8, 1, -90,]
quicksortLomuto(&list, low: 0, high: list.count - 1)
print(list)


// COMPARISON TO BUBBLE SORT (runs 101 times comparison to quicksort 10 times):
func bubbleSort(_ arr: inout [Int]) {
    
    for _ in 0..<arr.count { // n
        for j in 1..<arr.count { // n => O(n ^ 2)
            if arr[j] < arr[j - 1] {
                arr.swapAt(j, j - 1)
            }
        }
    }
}
var bubbleList = [80, 10, -9, 0, -11, 13, 90, -8, 1, -90, 80, 10, -9, 0, -11, 13, 90, -8, 1, -90,]
bubbleSort(&bubbleList)
print(bubbleList)
