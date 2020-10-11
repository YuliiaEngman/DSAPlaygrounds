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
        
       // var resultIndex = 0
        
        // resultIndex = sortedArr.count - k
        
        // Or:
        
        let resultIndex = sortedArr.count - k
        
        return sortedArr[resultIndex]
    }

print(findKthLargest([3,2,1,5,6,4], 2)) // 5
print(findKthLargest([3,2,3,1,2,4,5,5,6], 4)) // 4



//////////////////////////////////////

/*
Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

Examples:

s = "leetcode"
return 0.

s = "loveleetcode"
return 2.
 

Note: You may assume the string contains only lowercase English letters.
*/

// Sudocode:
// turn str to dict

// var dict = Dictionary<Char, Int>()
// var count = 0

// "leetcode" = ["l": 1, "e": 3, "t": 1, "c": 1, "o": 1, "d": 1]

func frequencyChar(_ input: String) -> Int {
 
 // 1. create and popultate the dictionary
 var dict = Dictionary<Character, Int>() // we also could write var dict = [Character: Int]()
 
 for char in input { // looping through string
   if let count = dict[char] { // here we unwrapping since dictionary has optional value (if I remember correctly)
   // also this line means that character already has value
     dict[char] = count + 1 // increasing value (means that we saw that character in string more than once)
   } else {
   dict[char] = 1 // this line means that we saw the caracter first time and we need to give it a value of one
   }
  }
 
 // 2. Now I want to loop through characters in string and check what value that character has in dict, it value equals 1 I want to return indext of that character in string
 // but also we should return index of the character
 // I think the easiest way is just to create a variable index adn assign it to value

 // aha! First time made a mistake - because if there will be o single character I will not get correct unswer with following code:
 
 var index = -1

 for char in input { // looping through string again
   if dict[char] == 1 { // here I am checking if value for key (char) is equal to 1 and if yes I need to add 1 to index in terms to get correct index for that character and exit this loop
     index += 1
     break
   } else {
   index += 1 // here I am saying that if I see character more that once I need to increase value for index and keep looping
   }
  }

 // 3. This is tricky part almost missed it:
 // We need to eliminate 2 scenarios:
 // 1- if there is no single character
 // 2- if there is 1 character in string (make sure that returns correct index)
  if index == input.count - 1 && index != 0 {
    return -1
  } else {
    return index
  }
 
}

print(frequencyChar("leetcode")) // returns 0
print(frequencyChar("loveleetcode")) // returns 2
print(frequencyChar("mamapapa")) // should return -1, for now returns 7 (now corrected)
print(frequencyChar("mmmm")) // -1
print(frequencyChar("m")) // should return 0

// The most officiant solution:
// other solution using `eumerated()` to find the index
// as we iterate
func firstNonRepeatingCharacter(_ inputString: String) -> Int {
  var freqDict = [Character: Int]()
  for char in inputString {
    if let count = freqDict[char] {
      freqDict[char] = count + 1
    } else {
      freqDict[char] = 1
    }
  }
  for (index, char) in inputString.enumerated() {
    if freqDict[char] == 1 {
      return index
    }
  }
  return -1
}

print(firstNonRepeatingCharacter("leetcode")) // returns 0
print(firstNonRepeatingCharacter("loveleetcode")) // returns 2
print(firstNonRepeatingCharacter("mamapapa")) // should return -1,
print(firstNonRepeatingCharacter("mmmm")) // -1
print(firstNonRepeatingCharacter("m")) // should return 0


/*
 REPEATING THE CHALLENGE:
Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

Examples:

s = "leetcode"
return 0.

s = "loveleetcode"
return 2.
 

Note: You may assume the string contains only lowercase English letters.
*/

func firstNonRepeatingChar(_ inputString: String) -> Int {
    // create and populate the dictionary:
    
    var freqDict = [Character: Int]()
    
    /*
    for char in inputString {
        if let count = freqDict[char] {
            freqDict[char] = count + 1
        } else {
            freqDict[char] = 1
        }
    }
 */
    for char in inputString {
        freqDict[char] = (freqDict[char] ?? 0) + 1 // Ask Alex if this is good practice to use this code...
    }
    
    // now I need to combile sr=tring and dict
    for (index, char) in inputString.enumerated() {
        if freqDict[char] == 1 {
            return index
        }
    }
    return -1 // Ask Alex how previus func overrides this
}

print(firstNonRepeatingChar("leetcode")) // returns 0
print(firstNonRepeatingChar("loveleetcode")) // returns 2
print(firstNonRepeatingChar("mamapapa")) // should return -1,
print(firstNonRepeatingChar("mmmm")) // -1
print(firstNonRepeatingChar("m")) // should return 0
/*
 can I use this from Luba's example?
 */
