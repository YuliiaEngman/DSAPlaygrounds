//: [Previous](@previous)

import Foundation

/*
 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

 Each letter in the magazine string can only be used once in your ransom note.

  

 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false
 Example 2:

 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true
 */

// Sudocode:
// the easiest way to check I think would be build-in func .contains

func noteContains(_ ransomNote: String, _ magazine: String) -> Bool {
    return magazine.contains(ransomNote)
}

print(noteContains("a", "b")) // false
print(noteContains("aa", "ab")) // false
print(noteContains("aa", "aab")) // true
