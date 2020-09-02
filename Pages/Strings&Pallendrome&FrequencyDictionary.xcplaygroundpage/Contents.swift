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

/*
 “Solution
 If you were already familiar with the range(of:) method, this one should have proved straightforward. If not, you were probably wondering why I gave it an easy grade!

 The range(of:) method returns the position of one string inside another. As it’s possible the substring might not exist in the other, the return value is optional. This is perfect for us: if we call range(of:) and get back nil, it means the substring isn’t contained inside the check string.

 Ignoring letter case adds a little complexity, but can be solved either by collapsing the case before you do your check, or by using the .caseInsensitive option for range(of:).

 The former looks like this:

 extension String {
     func fuzzyContains(_ string: String) -> Bool {
         return self.uppercased().range(of:
 self.uppercased().range(of: string.uppercased()) != nil
     }
 }
 
 And the latter like this:

 extension String {
     func fuzzyContains(_ string: String) -> Bool {
         return range(of: string, options: .caseInsensitive) != nil
     }
 }
 In this instance the two are identical, but there’s a benefit to collapsing the case if you had to check through lots of items.

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */


/*
 “Challenge 5: Count the characters
 Difficulty: Easy

 Write a function that accepts a string, and returns how many times a specific character appears, taking case into account.

 Tip: If you can solve this without using a for-in loop, you can consider it a Tricky challenge.

 Sample input and output
 The letter “a” appears twice in “The rain in Spain”.
 The letter “i” appears four times in “Mississippi”.
 The letter “i” appears three times in “Hacking with Swift”.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge5(input1: String, input2: Character ) -> Int {
    
    var count = 0
    
    var arr = [Character]()
    
    for char in input1 {
        if char == input2 {
            count = count + 1
        }
    }
    return count
}

// Runtime O(n), space complexity O(n)

print(challenge5(input1: "The rain in Spain", input2: "a"))
print(challenge5(input1: "Mississippi", input2: "i"))
print(challenge5(input1: "Hacking with Swift", input2: "i"))

// I like this alternatuve so;ution:
//“There’s actually a fourth option you might have chosen. It’s the shortest option, however it requires a little lateral thinking: you can calculate how many times a letter appears in a string by removing it, then comparing the lengths of the original and modified strings. Here it is in Swift:
//
//func challenge5d(input: String, count: String) -> Int {
//    let modified = input.replacingOccurrences(of: count, with: "")
//    return input.count - modified.count
//}”
//
//Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.




/*
“Challenge 6: Remove duplicate letters from a string
Difficulty: Easy

Write a function that accepts a string as its input, and returns the same string just with duplicate letters removed.

Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather than “easy”.

Sample input and output
The string “wombat” should print “wombat”.
The string “hello” should print “helo”.
The string “Mississippi” should print “Misp”.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge6(input: String) -> String {
    var checkedStr = ""
   
    for char in input {
        if !checkedStr.contains(char) {
            checkedStr = checkedStr + String(char)
        }
    }
    return checkedStr
}

// Runtime O(n), spacecomplexity O(n)

print(challenge6(input: "wombat"))
print(challenge6(input: "hello"))
print(challenge6(input: "Mississippi"))

/* I LIKE THIS SOLUTION:
 
 “As you know, dictionaries hold a value attached to a key, and only one value can be attached to a specific key at any time. You can change the value attached to a key just by assigning it again, but you can also call the updateValue() method – it does the same thing, but also returns either the original value or nil if there wasn’t one. So, if you call updateValue() and get back nil it means “that wasn’t already in the dictionary, but it is now.”

 We can use this method in combination with the filter() method on our input string’s character property: filter the characters so that only those that return nil for updateValue() are used in the return array.

 So, the third solution to this challenge looks like this:

 func challenge6c(string: String) -> String {
     var used = [Character: Bool]()

     let result = string.filter {
         used.updateValue(true, for
 “        used.updateValue(true, forKey: $0) == nil
     }

     return String(result)
 }
 As long as you know about the updateValue() method, that code is brilliantly readable – the use of filter() means it’s clear what the loop is trying to do. However, if you don’t know about updateValue() then I suspect it falls short and is best avoided.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books. */

//  REPEAT HIGH ORDER FUNCTIONS!!!!




/*
 “Challenge 7: Condense whitespace
 Difficulty: Easy

 Write a function that returns a string with any consecutive spaces replaced with a single space.

 Sample input and output
 I’ve marked spaces using “[space]” below for visual purposes:

 The string “a[space][space][space]b[space][space][space]c” should return “a[space]b[space]c”.
 The string “[space][space][space][space]a” should return “[space]a”.
 The string “abc” should return “abc”.
 ”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge7(input: String) -> String {
    
    var newStr = ""
    
    for char in input {
        if char == " " && newStr.last == " " {
            continue
        } else {
            newStr = newStr + String(char)
        }
    }
    return newStr
}

print(challenge7(input: "a   b   c"))
print(challenge7(input: "    a"))
print(challenge7(input: "abc"))

/*
 “However, for once, this is a place where regular expressions can help: they turn all that into a single line of code:

 func challenge7b(input: String) -> String {
     return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
 }
 If you’re not familiar with regular expressions, “[space]+” means “match one or more spaces”, so that will cause all multiple spaces to be replaced with a single space. Running regular “expressions isn’t cheap, so that code runs about 50% the speed of the manual solution, but you would have to be doing a heck of a lot of work in order for it to be noticeable.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */


/*
 “Challenge 8: String is rotated
 Difficulty: Tricky

 Write a function that accepts two strings, and returns true if one string is rotation of the other, taking letter case into account.

 Tip: A string rotation is when you take a string, remove some letters from its end, then append them to the front. For example, “swift” rotated by two characters would be “ftswi”.

 Sample input and output
 The string “abcde” and “eabcd” should return true.
 The string “abcde” and “cdeab” should return true.
 The string “abcde” and “abced” should return false; this is not a string rotation.
 “The string “abc” and “a” should return false; this is not a string rotation.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 ”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

/*
 “
 Hint #1: This is easier than you think.

 Hint #2: A string is only considered a rotation if is identical to the original once you factor in the letter movement. That is, “tswi” is not a rotation of “swift” because it is missing the F.

 Hint #3: If you write a string twice, it must encapsulate all possible rotations, e.g. “catcat” contains “cat”, “tca”, and “atc”.

 Solution
 This question appears in coding interviews far more than it deserves, because it’s a problem that seems tricky the first time you face it but is staring-you-in-the-face obvious once someone has told you the solution. I wonder how many times this question appears on interviews just so the interviewer can feel smug about knowing the answer!

 Anyway, let’s talk about the solution. As I said in hint #3, if you write a string twice it must always encapsulate all possible rotations. So if your string was “abc” then you would double it to “abcabc”, which contains all possible rotations: “abc”, “cab”, and “bca”.

 So, an initial solution might look like this:

 func challenge8(input: String, rotated: String) -> Bool {
     let combined = input + input
     return combined.contains(rotated)
 }
 However, that’s imperfect[…]”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books. 
 */


/*
“Challenge 9: Find pangrams
Difficulty: Tricky

Write a function that returns true if it is given a string that is an English pangram, ignoring letter case.

Tip: A pangram is a string that contains every letter of the alphabet at least once.

Sample input and output
The string “The quick brown fox jumps over the lazy dog” should return true.
The string “The quick brown fox jumped over the lazy dog” should return false, because it’s missing the S.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

// Turn String to array of characters

func challenge9(input: String) -> Bool {
    var arrAlphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    for char in input.lowercased() {
        if arrAlphabet.contains(char) {
            arrAlphabet.remove(at: arrAlphabet.firstIndex(of: char) ?? 0)
        }
    }
    return arrAlphabet.count == 0
}

// Is runtime O(n2) or O(n log n)

print(challenge9(input: "The quick brown fox jumps over the lazy dog"))

print(challenge9(input: "The quick brown fox jumped over the lazy dog"))



// Frequency Dictionary:

//import Foundation to repl.it

/*
// Write a function that takes in an array of integers (arr) and a number (n)
// You function should return an array with only numbers appearing n or more times.
// Your solution must work in O(n) time.
//
// Example:
// Input: [1,3,4,1,9,1,3,4,3,1,2], 3
// Output: [1,3]
*/

// arr: [Int], num: Int -> [Int]
// O(n): for loop or .contains
// result >= n

// var result = [Int]()
// var count = 0
// for num in arr
//

// dict [Int: Int]
// 1:4, 3:3, 4:2, 9:1, 2:1

/*
// dictioary review
// storing values in a dictionary from a given array
for num in arr {
  if let count = dict[num] {
    dict[num] = count + 1 // increment
  } else {
    dict[num] = 1 // first time seeing number
  }
}
return
*/


// 1:4, 3:3, 4:2, 9:1, 2:1

/*
// iterate through the dictionary to find out values
// that appear n or more times
for (key, value) in dict {
  if value >= n {
    result.append(key)
  }
}
return result
*/

func challenge1c(arr: [Int], n: Int) -> [Int] { //[1, 1, 3] n == 2
  var result = [Int]()
  //var count = 0
  var dict = [Int: Int]()

  // populate the dictionary
  for num in arr {
    if let count = dict[num] {
      dict[num] = count + 1 // 1:2
    } else {
      dict[num] = 1 // 1:1, 3:1
    }
  }

  //1:2, 3:1

  // iterate through the dictionary to find out values
  for (key, value) in dict {
    if value >= n { // 2==2
      result.append(key) //[1]
    }
  }

  return result //[1]
}

print(challenge1c(arr: [1, 1, 3], n: 2))

print(challenge1c(arr: [1,3,4,1,9,1,3,4,3,1,2], n: 3))

/*
 “Challenge 11: Three different letters
 Difficulty: Tricky

 Write a function that accepts two strings, and returns true if they are identical in length but have no more than three different letters, taking case and string order into account.

 Sample input and output
 The strings “Clamp” and “Cramp” would return true, because there is one letter difference.
 The strings “Clamp” and “Crams” would return true, because there are two letter differences.
 The strings “Clamp” and “Grams” would return true, because there are three letter differences.
 The strings “Clamp” and “Grans” would ”“return false, because there are four letter differences.
 The strings “Clamp” and “Clam” would return false, because they are different lengths.
 The strings “clamp” and “maple” should return false. Although they differ by only one letter, the letters that match are in different positions.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

func challenge11(input1: String, input2: String) -> Bool {
    
    var str2 = input2
    
    if input1.count == input2.count {
        
        for char in input1 {
            if str2.contains(char) {
                str2.remove(at: str2.firstIndex(of: char)!)
            }
        }
    }
    return str2.count <= 3
}

print(challenge11(input1: "Clamp", input2: "Cramp"))
print(challenge11(input1: "Clamp", input2: "Crams"))
print(challenge11(input1: "Clamp", input2: "Grams"))
print(challenge11(input1: "Clamp", input2: "Grans"))
print(challenge11(input1: "Clamp", input2: "Clam"))
print(challenge11(input1: "clamp", input2: "maple")) // my func does the main part but does not taking into consideration order of letters -> "taking case and string order into account"

// Trying the solution with hints:

/*
“Solution
This problem isn’t hard as long as you convert your strings into character arrays – if you don’t, you need to advance through string indices, which is never pleasant and certainly hard to do during an interview.

The simplest, clearest way to solve this challenge is like so:

Start with an early return in case the two strings have different lengths.
Create arrays out of both strings.
Initialize a differences counter to 0.
Loop over the first array, using enumerated() so we get the current index as well as each character.
Compare that character against the character at the same index in the other string array.
If they are different, add one to differences.
If as a result of that differences is now 4, return false.
On the other hand, if we get to the end of the array, it means we can return true.
Something like this ought to do the trick:

func challenge11(first: String, second: String) -> Bool {
    guard first.count == second.count else { return false }

    let firstArray = Array(first)
    let secondArray = Array(second)
    var differences = 0

    for (index, letter) in firstArray.enumerated() {
        if secondArray[index] != letter {
            differences += 1

            if differences == 4 {
                return false
            }
        }
    }

    return true
}”
 */

//Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.



/*
// Write a function that takes in an array of integers (arr) and a number (n)
// You function should return an array with only numbers appearing n or more times.
// Your solution must work in O(n) time.
//
// Example:
// Input: [1,3,4,1,9,1,3,4,3,1,2], 3
// Output: [1,3]
*/

// arr: [Int], num: Int -> [Int]
// O(n): for loop or .contains
// result >= n

// var result = [Int]()
// var count = 0
// for num in arr
//

// dict [Int: Int]
// 1:4, 3:3, 4:2, 9:1, 2:1

/*
// dictioary review
// storing values in a dictionary from a given array
for num in arr {
  if let count = dict[num] {
    dict[num] = count + 1 // increment
  } else {
    dict[num] = 1 // first time seeing number
  }
}
return
*/


// 1:4, 3:3, 4:2, 9:1, 2:1

/*
// iterate through the dictionary to find out values
// that appear n or more times
for (key, value) in dict {
  if value >= n {
    result.append(key)
  }
}
return result
*/

func challenge1(arr: [Int], n: Int) -> [Int] { //[1, 1, 3] n == 2
  var result = [Int]()
  //var count = 0
  var dict = [Int: Int]()

  // populate the dictionary
  for num in arr {
    if let count = dict[num] {
      dict[num] = count + 1 // 1:2
    } else {
      dict[num] = 1 // 1:1, 3:1
    }
  }

  //1:2, 3:1

  // iterate through the dictionary to find out values
  for (key, value) in dict {
    if value >= n { // 2==2
      result.append(key) //[1]
    }
  }

  return result //[1]
}

print(challenge1(arr: [1, 1, 3], n: 2))

print(challenge1(arr: [1,3,4,1,9,1,3,4,3,1,2], n: 3))

// Using map

func challenge1b(arr: [Int], n: Int) -> [Int] { //[1, 1, 3] n == 2
  var result = [Int]()
  //var count = 0
  //var dict = [Int: Int]()

  let mappedArr = arr.map {($0, 1)}
  let dict = Dictionary(mappedArr, uniquingKeysWith: +)

  //1:2, 3:1

  // iterate through the dictionary to find out values
  for (key, value) in dict {
    if value >= n { // 2==2
      result.append(key) //[1]
    }
  }

  return result //[1]
}


print(challenge1b(arr: [1, 1, 3], n: 2))

print(challenge1b(arr: [1,3,4,1,9,1,3,4,3,1,2], n: 3))





/*
Challenge 1

Write a function that returns how many vowels are in a String

Sample Input: "Hello there! How's it going?"

Sample Output: 8
*/

/*
input: String
output: Int

implement and initialize a constant array of all vowels
implement and initialize a variable for vowels count (Int)

for each letter in input string
 if all vowels array cointaints letter
  increate vowels count by 1

 return vowels count
*/

// input: "Hello", output: 2 ("e", "o")
func vowelsCounts(input: String) -> Int {
  let allVowels = ["a", "e", "i", "o", "u", "y"]
  var countVowels = 0

  for letter in input {
    if allVowels.contains(String(letter)) {
      countVowels += 1
    }
  }

  return countVowels
}

print(vowelsCounts(input: "Hello there! How's it going?"))
