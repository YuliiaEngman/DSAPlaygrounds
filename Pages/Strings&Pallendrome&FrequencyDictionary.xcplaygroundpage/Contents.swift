import UIKit


//2. Find the First Repeating word in a String
//
//Input:  "hey how are you you doing how how"
//
//OutPut: "How"

let str = "hey how are you you doing how how"

let str2 = "hey you how are you doing how how"

let strWithSpaces = str.components(separatedBy: " ")

func repeatingWord(_ str: String) -> String {
    
    let strWithSpaces = str.components(separatedBy: " ")
    
    var emptyArr = [String]()
    
    var repetingWord = String()
    
    for string in strWithSpaces {
        
        if emptyArr.contains(string) {
            repetingWord = string
            break
        }
        emptyArr.append(string)
    }
    
    return repetingWord
}

repeatingWord(str2)

// STRING MANIPULATION (may not work in Playground):
var timezone = "America/New_York"
var string = timezone.replacingOccurrences(of: "/", with: " ")

print(string)

var city = string.split(separator: " ")
print(city.last)


var timezone2 = "America/New_York"
var cityFromLocation = timezone2.split(separator: "/")
print(cityFromLocation.last)



// PALLENDROME:

var str3 = "Madam I'm Adam"

for char in str3 {
    if !char.isLetter {
        str3.remove(at: str3.firstIndex(of: char)!)
    }
}



//let sr = String(str.reversed())

//if str == String(str.reversed()) {
//    print("The sentabce is Pallendrom")
//} else {
//    print("The sentabce is NOT a Pallendrom")
//}


//extension String {

func backwords(_ str: String) -> String {
    var backwordStr = ""
    for char in str {
        backwordStr = String(char) + backwordStr
    }
    return backwordStr
}

//print(backwords("dontnod"))

if str.lowercased() == backwords(str.lowercased()) {
    print("The sentance is Pallendrom")
} else {
    print("The sentabce is NOT a Pallendrom")
}

//=================================================================================
//                          Questions: String
//=================================================================================

// problem 1 // palindrome, pangram, anagram
/*
Palindrome.
Given a string str, write a functin that will return
true if is a palindrome and false if it is not?
If you recall, a palindrome is defined as "a word,
phrase, or sequence that reads the same backward as
forward". For now, assume that we will not have input
strings that contain special characters or spaces, so
the following examples hold:
​
Example 1:
​
Input:
let str = "thisisnotapalindrome"
​
Output: false
​
Example 2:
​
Input:
let str = "racecar"

Output: true
*/


 // concatenation
  // string = "x" + "A"
  // string = "xA"

  // string += "b"
  // string = string + "b"
  // string = "xAb"

  // string = "b" + string
  // string = "bxA"

func isPalindrome(str: String) -> Bool {
  var newStr = ""

  for char in str {
    newStr = String(char) + newStr
  }
  
  return newStr == str
}

print(isPalindrome(str: "thisisnotapalindrome"))
print(isPalindrome(str: "racecar"))




//=================================================
//You are given an array of strings words and a string chars.

// A string is good if it can be formed by characters from chars (each character can only be used once).

// Return the sum of lengths of all good strings in words.

/*
Input: words = ["cat","bt","hat","tree"], chars = "atach"
Output: 6
Explanation:
The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
*/

/*
Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
Output: 10
Explanation:
The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.
*/

// at least one word in the array
// at least one character in each word
// chars has at least one character inside the string

// we're gonna do a for loop, " for word in words"

// "for char in word"
// runtime is O(n^2)

// use a frequency dictionary
// runtime O(n)


// guard word <= chars.count

func countCharacters(_ words: [String], _ chars: String) -> Int {
  var charsDict = [Character: Int]()
  var sum = 0
  // "a", charsDict["a"] = 3

  for char in chars {
    charsDict[char] = (charsDict[char] ?? 0) + 1
  }

  Outerloop: for word in words {

    guard word.count <= chars.count else {
      continue
    }

    // "caaa" , chars "cata"
    // a 2 times, "cat"
    // a 1 time, "ct"
    // no more as left, its a bad word

    // dictionary ["c" : 1, "a" : 2, "t" : 1]
    // charsDict["a"] = 2 - 1
    // charsDict["a"] = 1 - 1
    // line 103, sets to nil
    // dictionary ["c": 1, "t" : 1]

    // everytime we see a character being used, we're minusing one in the dictionary
    var charsDict = charsDict
    // we're making a copy of charsDict to modify

    for letter in word {
      if charsDict.keys.contains(letter) {
        charsDict[letter] = (charsDict[letter] ?? 0) - 1
        if charsDict[letter] == 0 {
          charsDict[letter] = nil
        }

      } else {
        continue Outerloop
      }
    }

    sum += word.count

  }

  return sum
}

print(countCharacters(["cat","bt","hat","tree"], "atach"))

// "catar", "catr"
// guard statement
// guard word.count > chars.count
// "Make sure this goes through or else continue happens"
// guard 5 > 4

// example word: "catar",  chars: "catr"
// c in word, chars: "atr"
// a in word, chars: "tr"
// t in word, chars: "r"
// not a valid string, too many as.


// Dictionaries in swift, are key value pairs
// dictionary(Character:Int)
// dictionary["a"] = 1
// dictionary.remove()
// dictionary["a"] = nil
// dictionary()


// Swift Coding Challlenges

// 1. “Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.”

//need to repeat Sets

func uniqueStr(str: String) -> Bool {
    let strWithoutSpaces = str.components(separatedBy: " ").joined(separator: "")
    let isOrNotUnique = Set(strWithoutSpaces)
    return strWithoutSpaces.count == isOrNotUnique.count
}
// Runtime? - constant 0(1)

print(uniqueStr(str: "No duplicates"))

assert(uniqueStr(str: "No duplicates") == true, "Challenge 1 failed")
assert(uniqueStr(str: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(uniqueStr(str: "AaBbCc") == true, "Challenge 1 failed")
assert(uniqueStr(str: "Hello, world") == false, "Challenge 1 failed")


func challenge1(input: String) -> Bool {
    let strWithoutSpaces = input.components(separatedBy: .whitespaces).joined(separator: "")
    var uniqueArr = [Character]()
    
    for char in strWithoutSpaces {
        if !uniqueArr.contains(char) {
            uniqueArr.append(char)
        }
    }

    return strWithoutSpaces.count == uniqueArr.count
}

// Runtime? - I think O(n)

print(challenge1(input: "No duplicates"))

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")

func challenge1b(input: String) -> String {
    let inputWithoutSpace = input.components(separatedBy: .whitespaces).joined(separator: "")
    let inputWithoutCommas = inputWithoutSpace.components(separatedBy: .punctuationCharacters).joined(separator: "")
    
    var uniqArr = [Character]()
    
    for char in inputWithoutCommas {
        if !uniqArr.contains(char) {
            uniqArr.append(char)
        }
    }
    return String(uniqArr)
}

print(challenge1b(input: "abracadabra"))



// Remove duplicates

/*
You are given a string, str, of length N consisting of lowercase letters of alphabet.
You have to remove all those characters from str which have already appeared in it, i.e.,
you have to keep only first occurance of each letter.
*/

// "alexander" => alexndr

// can use builtin func
//punctuation - no need ignore but can

// 1. Create func that takes String and returns str
// 2. Guard against white spaces
// 3. Empty array
// 4. Loop through string and add letter to array if there is no duplicates
// 5. Test my func

// let str = "yuu" -> "yu"
// var arr = [Characters]()
// for char in str {
//   if !arr.containts(char) {
//     arr.append(char)
//   }
//    return String(arr)
// }


func uniqueStr(input: String) -> String {

  // "alex paul ios" => "alex pu is"
  // hint: char.isLetter true or false
 // let strWithoutWhiteSpaces = input.components(se)

  var arr = [Character]() // n space
  // [1, 3, 4, 4,5 ,5 6]

  var uniqueChars: Set<Character> = [] // n space

  // if using .contains you can optimize the runtime from
  // quadratic to linear by using a Set as opposed to an array

  // space completxity has to deal with memory allocation e.g
  // decalaring an array or set or dictionary

  for char in input { // O(n)
    // code here
      if !char.isLetter { // ?, _, 9
        // code
        // include the char to the
        arr.append(char)
        // missing a statement ?
        // break?
        // continue
        continue
      }

    

    if !arr.contains(char) { // O(m)
      arr.append(char) // ["y", "u"]
    }
    
  }
 
  return String(arr)
}

print(uniqueStr(input: "alexander"))

print(uniqueStr(input: "yul, iia, r"))


/*
 “Challenge 2: Is a string a palindrome?

 Write a function that accepts a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case.

 Sample input and output
 The string “rotator” should return true.
 The string “Rats live on no evil star” should return true.
 The string “Never odd or even” should return false; even though the letters are the same in reverse the spaces are in different places.
 The string “Hello, world” should return false because it reads “dlrow ,olleH” backwards.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books. */

// Should be lovercased
// Pay attention to spaces - should be at the same place

// Can I use buildin func? yes

// Create func that takes String as parameter and returns Bool
// Creare an empty array and looping though it adding letter to it and return true if ther are equal
// Test cases


// Solution # 1 (does not work)
// let str = "yuy" // should return true
// var reverseStr = ""
//
// for char in str.lovercased() { // looping through string that is lovercased
// reverseStr = String(char) + reverseStr
// }
// return str.lowercased() == reverseStr
// }

func challenge2a(input: String) -> Bool {
    var reverseStr = ""
    
    for char in input.lowercased() {
        reverseStr = String(char) + reverseStr
    }
    return reverseStr == input.lowercased()
}

// I think runtime is 0(n)
// space complexity 0(n)

print(challenge2a(input: "Rats live on no evil star"))
print(challenge2a(input: "rotator"))
print(challenge2a(input: "Never odd or even"))
print(challenge2a(input: "Hello, world"))



// Solution # 2
// let str = "yuy"
// let reversedStr = str.reversed().lovercased() // reversed and checking for lovercase
// Lowercased comes first!!!! after reversed!!!
// return str == reversedStr // should return true

func challenge2b(input: String) -> Bool {
    let reversedStr = input.lowercased().reversed()
    
    print(String(reversedStr))
    return input.lowercased() == String(reversedStr)
}
// I thing the runtime is O(n)
// space complexity 0(n)

print(challenge2b(input: "Rats live on no evil star"))

print(challenge2b(input: "rotator"))
print(challenge2b(input: "Never odd or even"))
print(challenge2b(input: "Hello, world"))


/*
“Challenge 3: Do two strings contain the same characters?
Difficulty: Easy

Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.

Sample input and output
The strings “abca” and “abca” should return true.
The strings “abc” and “cba” should return true.
The strings “ a1 b2 ” and “ b1 a2 ” should return true.
The strings “abc” and “abca” should return false.”
 “The strings “abc” and “cbAa” should return false.
 The strings “abcc” and “abca” should return false.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/

// Takes 2 Strings
// Letter case matter!
// Need to contain exact letter in any order
// I assume that white spaces do not matter

// Solution 1 - use builtin func .contains() - cannot solve using builtin func

//func challenge3a(input1: String, input2: String) -> Bool {
//
//    var str = input2
//
//    for char in input1 {
//        if str.contains(char) {
//            str.remove(char.)
//             continue
//        } else {
//             break
//        }
//    }
//    return str.count == 0
//}
//
//print(challenge3a(input1: "abca", input2: "abca"))
//print(challenge3a(input1: "abc", input2: "cba"))
//print(challenge3a(input1: "a1 b2", input2: "b1 a2"))
//print(challenge3a(input1: "abc", input2: "abca"))
//print(challenge3a(input1: "abc", input2: "cbAa"))
//print(challenge3a(input1: "abcc", input2: "abca"))

/*
 Correct solution #1:
 
 func challenge3a(string1: String, string2: String) -> Bool {
     var checkString = string2

     for letter in string1 {
         if let index = checkString.firstIndex(of: letter) {
             checkString.remove(at: index)
         } else {
             return false
         }
     }
     return checkString.count == 0
 }
 
 runtime I guess O(n^2)
 */


// Solution 2 - use builtin func .sorted() - and compare them

func challenge3b(input1: String, input2: String) -> Bool {
    
    return input1.sorted() == input2.sorted()
}

print(challenge3b(input1: "abca", input2: "abca"))
print(challenge3b(input1: "abc", input2: "cba"))
print(challenge3b(input1: "a1 b2", input2: "b1 a2"))
print(challenge3b(input1: "abc", input2: "abca"))
print(challenge3b(input1: "abc", input2: "cbAa"))
print(challenge3b(input1: "abcc", input2: "abca"))

/*
“Challenge 4: Does one string contain another?
Difficulty: Easy

Write your own version of the contains() method on String that ignores letter case, and without using the existing contains() method.

Sample input and output
The code "Hello, world".fuzzyContains("Hello") should return true.
The code "Hello, world".fuzzyContains("WORLD") should return true.
The code "Hello, world".fuzzyContains("Goodbye") should return false.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/


//func backwords(_ str: String) -> String {
//    var backwordStr = ""
//    for char in str {
//        backwordStr = String(char) + backwordStr
//    }
//    return backwordStr
//}

//print(backwords("dontnod"))

func customContains(str1: String, str2: String) -> Bool {
    var firstString = str1.lowercased()
    let comparedStr = str2.lowercased()
    
    for char in comparedStr {
        if let index = firstString.firstIndex(of: char) {
            firstString.remove(at: index)
        } else {
            return false
        }
    }
    return comparedStr.count == 0
}

print(customContains(str1: "Hello, world", str2: "Hello"))


//for letter in string1 {
//    if let index = checkString.firstIndex(of: letter) {
//        checkString.remove(at: index)
//    } else {
//        return false
//    }
//}
//return checkString.count == 0
