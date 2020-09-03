//: [Previous](@previous)

import Foundation

import Foundation

/*
 Dictionaries
 
 - Is a collection.
 - Has a key and a value.
 - Key should be hashable.
 - Keys should be unique.
 
 - A dictionary is an association between a key and a value.
 
 - Another name for a dictionary is a hash table, or a hash map.
    - You can think of a hash table as an array, where we care about which index we are placing our elements.
    - We determine the position of an element using a hash function.
        - A hash function is a function that given some input, returns some value. This value is usually % with the size of the container (array) to find the index of the element.
        - There are cases, especially if the container is too small, where the same key will result in the same index for the container. This is called a collision.
            - There are a number of different methods for handling collisions.
                - For example, you can place the element in the next sequential position.
                - You can has linked list in the position, and have all of the elements that map to this position stored in the list.
 
 - [0,0,0,0,3] We want to map the key 3 into our hash table.
    1. Map the key to an index using a hash function.
    2. Hash Function => (Element * Element) % tableSize.
    3. Position in the table = HashFunction(element)
        - (3 * 3) = 9
        - 9 % 5 = 4
    4. The key "3" maps to position / index 4 in the hash table.
    5. Now we want to add the key "8" into our table.
    6. Calculate hash value
        - (8 * 8) % 5 = 4
    7. The key "3" is already in position / index 4. This results in a collision.
        - One way to handle this, is to put the key in the next available position. In this case, index 0.
        - Another way to handle this, is to store a linked list in each position and have it contain all of the keys that map to that position.
            - [0,0,0,0, 3 -> 4]
    
 - Because of the above process, dictionaries have no order.
 - One tradeoff is that accessing elements in a dictionary is done in constant time.
    - Whereas with an array if we wanted to see if a value is contained within it, we would use the contains method, which takes O(n) time because we have to look at every element in the array.
    - For a dictionary, because we have a hash function, if we are looking for a value in the dictionary, we know where it should exist.

 */

// Four Different methods of initialization
var ageDict = ["Yulia":18, "Cameron":28] // Initializing a dictionary with a literal
var emptyDict = [String:Int]()
var emptyDict2: [String:Int] = [:]
var emptyDict3 = Dictionary<String,Int>()

// Adding Elements to a dictionary
ageDict["Luba"] = 6
ageDict["Christian"] = 95

//print(ageDict)

// This method allows us to add a new value to the dictionary for a given key. If the value doesn't exist in the dictionary, this function returns nil. If the value already exists, then the function returns the old value that was replaced.

print(ageDict.updateValue(20, forKey: "Christian") ?? 0)
print(ageDict.updateValue(12, forKey: "Tsering"))
//
//print(ageDict)

// We are given the task of removing duplicate characters in a string.

func removeDuplicates(_ str: String) -> String {
    var characterDict: [Character:Bool] = [:]
    
    // We are trimming down the characters in our initial string by checking if they match a condition.
    // If the character matches the condition, it is added to the return string.
    // If the character fails the condition, it is not added to the return string.
    let result = str.filter { (char) -> Bool in
        // If doesntExist is nil, it is the first time we have seen this character in the string. In other words, it is not a duplicate.
        let doesntExist = characterDict.updateValue(true, forKey: char)
        print("\(char), \(doesntExist)")
        // Return true, if the character doesn't already exist in the dictionary. In other words, return true if it is not a duplicate.
        return doesntExist == nil
    }
    
    return result
}

//print("Final Result: \(removeDuplicates("Mississippi"))")

// Removing elements from a dictionary
ageDict.removeValue(forKey: "Tsering")
ageDict["Tsering"] = nil
print(ageDict)


// How do we access values in a dictionary
print(ageDict["Christian"] ?? 0)
print(ageDict["Eric"])

// When you access values in a dictionary, the dictionary never know if there is a value associated with the key. For that reason, accessing an element in the dictionary always, always, always returns an optional.

// Using a frequency dictionary.
// Return the number of each vowel encountered in a string.
// Create an empty dictionary.
// Recognize vowels.
// - Create an array of strings that contains all of the vowels, and use .contains() to see if it exists.
//      - Runtime will be O(n) of contains on arrays and strings.
// - Create a set of strings that contains all of the vowels, and use .contains() to see if it exists.
//      - Runtime will be O(1).
// Loop over input string.
// Increment value in dictionary if we run into a vowel.
// Return our dictionary.

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

//print(numberOfVowels("I was accosted by an unusual gentleman on my way home last night."))

// Iterating over a dictionary

// The key and value elements are NOT optional in this case.
for (key,value) in ageDict {
    
}


for key in ageDict.keys {
    print(key)
}

// Values are NOT optional.
for value in ageDict.values {
    print(value)
}
