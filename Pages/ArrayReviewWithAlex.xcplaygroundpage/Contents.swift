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

for element in heteroheneousArray {
    if let intValue = 
}
