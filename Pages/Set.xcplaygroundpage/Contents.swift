//: [Previous](@previous)

import Foundation

/*
1207. Unique Number of Occurrences
Easy

490

22

Add to List

Share
Given an array of integers arr, write a function that returns true if and only if the number of occurrences of each value in the array is unique.

 

Example 1:

Input: arr = [1,2,2,1,1,3]
Output: true
Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.
Example 2:

Input: arr = [1,2]
Output: false
Example 3:

Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
Output: true
 */

// Sudocode:
// I thing that:
// 1) I will loop trough array and create a frequancy dictionary (put number and show how many time it occures)
// 2) And compare values.count of dictionary to the set of thouse values - if it equal, return true
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        
       // 1) I will loop trough array and create a frequancy dictionary (put number and show how many time it occures)
        var dictionary = Dictionary<Int, Int>()
        
        for num in arr {
            
            if let numCount = dictionary[num] {
                dictionary[num] = numCount + 1
            } else {
                dictionary[num] = 1
            }
        }
        
        print(dictionary)
        print(dictionary.count)
        
        //2) And compare values.count of dictionary to the set of thouse values - if it equal, return true
        
        let setArr = Set(arr)
        
        return setArr.count == dictionary.values.count
    }

print(uniqueOccurrences([1,2,2,1,1,3])) //true
print(uniqueOccurrences([1,2]))


/*
 func numberOfVowels(_ str: String) -> [String:Int] {
     guard !str.isEmpty else { return [:] }
     
     var vowelDict = Dictionary<String,Int>()
     let vowelSet: Set<String> = ["a","e","i","o","u"]
     
     for char in str.lowercased() {
         
         if vowelSet.contains(String(char)) {

             if let charCount = vowelDict[String(char)] {
                 // Increment the value for the key in the dictionary.
                 vowelDict[String(char)] = charCount + 1
             } else {
                 // Map a value to this key.
                 vowelDict[String(char)] = 1
             }
             
         }
         
     }
     
     return vowelDict
 }
 */
