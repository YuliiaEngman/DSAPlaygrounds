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
print(noteContains("aa", "baa")) // true


//=================================================================================================//
/*
 Roy wanted to increase his typing speed for programming contests. His friend suggested that he type the sentence
 "The quick brown fox jumps over the lazy dog" repeatedly. This sentence is known as a pangram because it contains
 every letter of the alphabet.

 After typing the sentence several times, Roy became bored with it so he started to look for other pangrams.

 Given a sentence, determine whether it is a pangram. Ignore case.
 */

// Sudocode:
// I need to find out if the String contains all the letters from alphabet
// I think that I need to create a constant that contains all the letters from alphabet and looping through the String that all of them there

func isPangram(_ sentanceToCheck: String) -> Bool {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let lowercasedSentance = sentanceToCheck.lowercased()
    
    for letter in alphabet {
        if lowercasedSentance.contains(letter) {
            continue
        } else {
            return false
        }
    }
    
    return true
}

print(isPangram("The quick brown fox jumps over the lazy dog")) // true
print(isPangram("Some sentance that is not a Pangram")) // false

