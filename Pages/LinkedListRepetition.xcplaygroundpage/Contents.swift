//: [Previous](@previous)

import Foundation

//*************************************************************

// Linked List implemintation - repetition with Alex
// Data structures build in Swift: arrays, dictionaries, set

// If you want to create a data structior like stack, you have to build so called "abstract data structure" (it does not excist but you create it how you want it to be)
// Also we are using generics, that whars with any data structures, not any since it can be mixed objects of different types

// Linked list like set of cars on a train:
// Linked list has "Value"(Node) and "Connection"(Pointer)

// Draw it out do not jump directly to the problem!!! Especially with bstract data structures.

// Implement Node structure:


// SINGLY LINKED LIST!
// It should be class, nit struct, because structs can’t have stored properties that reference themselves.

class Node<T> {
    var value: T
    var next: Node?// connection(pointer)
    
    // noinitializer means no value itself
    init(_ value: T) {
        self.value = value
    }
}

// implementing CustomStringConvertable to customize description of a Node

extension Node: CustomStringConvertible { // it will customize the description will be for us
    var description: String {
       // return ""
        guard let next = next else {
            return "\(value) -> nil" // 12 -> nil
        }
        // if we have connected nodes
        return "\(value) -> \(next)" // next is a node and knows how to print itself
    }
}


// instantiating node instances
let car14 = Node<Int>(14)
let car98 = Node<Int>(98)

// link our nodes
car14.next = car98

// print the current state of the linked node
print(car14)



 class LLNode {
   var value: Int
   var next: LLNode?
   init(_ value: Int) {
     self.value = value
   }
 }
 
 extension LLNode: CustomStringConvertible { // it will customize the description will be for us
     var description: String {
        // return ""
         guard let next = next else {
             return "\(value) -> nil" // 12 -> nil
         }
         // if we have connected nodes
         return "\(value) -> \(next)" // next is a node and knows how to print itself
     }
 }
 
 let node1 = LLNode(1)
 let node2 = LLNode(2)
 let node9 = LLNode(9)
 let node4 = LLNode(4)
 let node5 = LLNode(5)
 
 node1.next = node2
 node2.next = node9
 node9.next = node4
 node4.next = node5

 // problem 1
 // Using the Linked List above, write a function that finds the largest number in a Linked List of Ints.
 // output: 9


/*
 func largestNumber(_ node: LLNode) -> Int {
 //  var node = node
 //  var largestNum = node.value
 //
 //  while let next = node.next {
 //    if largestNum < next.value {
 //      largestNum = next.value
 //    }
 //
 //    node = next
 //  }
 //
 //  return largestNum
 //}
 */

/*
“Challenge 43: Linked lists
Difficulty: Easy

Create a linked list of lowercase English alphabet letters, along with a method that traverses all nodes and prints their letters on a single line separated by spaces.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

// I will devide this challnge for 2:
// 1) Create a linked list to lowercased English alphabet letters
// 2) make an extension that will print it as 1 line separated by space

//class AlphabetNode {
//    var value: Character
//    var next: AlphabetNode?
//
//    init(_ value: Character) {
//        self.value = value
//    }
//}

/*
“Hint #3: Even though this challenge uses alphabet letters, aim to make your class generic – it shows smart forward thinking, and is only fractionally harder than using a specific data type.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.*/

// Generic would look like this:
class AlphabetNode<T> {
    var value: T
    var next: AlphabetNode?
    
    init(_ value: T) {
        self.value = value
    }
}

// Creating nodes
let nodeA = AlphabetNode<Character>("a")
let nodeB = AlphabetNode<Character>("b")
let nodeC = AlphabetNode<Character>("c")
let nodeD = AlphabetNode<Character>("d")
let nodeE = AlphabetNode<Character>("e")
let nodeF = AlphabetNode<Character>("f")
let nodeG = AlphabetNode<Character>("g")
let nodeH = AlphabetNode<Character>("h")
let nodeI = AlphabetNode<Character>("i")
let nodeJ = AlphabetNode<Character>("j")
let nodeK = AlphabetNode<Character>("k")
let nodeL = AlphabetNode<Character>("l")
let nodeM = AlphabetNode<Character>("m")
let nodeN = AlphabetNode<Character>("n")
let nodeO = AlphabetNode<Character>("o")
let nodeP = AlphabetNode<Character>("p")
let nodeQ = AlphabetNode<Character>("q")
let nodeR = AlphabetNode<Character>("r")
let nodeS = AlphabetNode<Character>("s")
let nodeT = AlphabetNode<Character>("t")
let nodeU = AlphabetNode<Character>("u")
let nodeV = AlphabetNode<Character>("v")
let nodeW = AlphabetNode<Character>("w")
let nodeX = AlphabetNode<Character>("x")
let nodeY = AlphabetNode<Character>("y")
let nodeZ = AlphabetNode<Character>("z")

// Connecting nodes
nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeD
nodeD.next = nodeE
nodeE.next = nodeF
nodeF.next = nodeG
nodeG.next = nodeH
nodeH.next = nodeI
nodeI.next = nodeJ
nodeJ.next = nodeK
nodeK.next = nodeL
nodeL.next = nodeM
nodeM.next = nodeN
nodeN.next = nodeO
nodeO.next = nodeP
nodeP.next = nodeQ
nodeQ.next = nodeR
nodeR.next = nodeS
nodeS.next = nodeT
nodeT.next = nodeU
nodeU.next = nodeV
nodeV.next = nodeW
nodeW.next = nodeX
nodeX.next = nodeY
nodeY.next = nodeZ
nodeZ.next = nil

// part 2

extension AlphabetNode: CustomStringConvertible {
    var description: String {
        
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) \(next)"
    }
}

print(nodeA)

/*
 “Once you know that the print() function has a terminator parameter that lets you specify something other than a line break to use after the line is printed, this method is pretty straightforward:

 Pick out the first node in the list using the start property and make that the current node.
 While the current node is not nil, print out its value with a space for the terminator.
 Update the current node to be equal to the value of its next property, thereby moving to the next element in the list.
 That’s it! Here’s the code:

 func printNodes() {
     var currentNode = start

     while let node = currentNode {
         print(node.value, terminator: " ")
         currentNode = node.next
     }
 }”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 
 Full Solution:
 “class LinkedListNode<T> {
     var value: T
     var next: LinkedListNode?

     init(value: T) {
         self.value = value
     }
 }

 class LinkedList<T> {
     var start: LinkedListNode<T>?

     func printNodes() {
         var currentNode = start

         while let node = currentNode {
             print(node.value, terminator: " ")
             currentNode = node.next
         }
     }
 }

 var list = LinkedList<Character>()
 var previousNode: LinkedListNode<Character>? = nil

 for letter in "abcdefghijklmnopqrstuvwxyz" {
     let node = LinkedListNode(value: letter)

     if let predecessor = previousNode {
         predecessor.next = node
     } else {
         list.start = node
     }

     previousNode = node
 }

 list.printNodes()”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books. 
 */



// ******************************************

// LinkedList itself full implementation
// has head and tail

class LinkedList<T> {
    var head: Node<T>? // nil, because we can have empty list
    var tail: Node<T>? // nil, because we can have empty list
    // we do not need initializer here because all of them have a value == nil
    
    
    // Swift offers us two kinds of property: a stored property is one that saves a value for use later, and a computed property is one that runs some code in order to calculate the value
    /*
    struct Person {
        var name = "Taylor"
        var favoriteColor = "red"
        var favoriteCity = "Tokyo"
        var favoriteFood = "tea"

        var greeting: String {
            return "Hello, my name is \(name), and I like \(favoriteFood), \(favoriteCity), and the color \(favoriteColor)."
        }
    }
 */
    
    // COMPUTED property -> Computed properties are always variables (never constants)
    // Beware when using computed properties as their value might change each time you are calling them. Also, they can change any other value in their enclosing scope if a setter is used (more below)!!!
    
    // My basic understanding that computed property is a property that stores a value as a result of some calculation. Ex:
    // var x = 10
    // var y = 20
    // var totalResult: Int {
   // get {
   //     return x+y
   //  }
// }
    // print(totalResult) // 30
    
    // A cleaning up note: you don’t need to write get { } as long as you do not implement a setter. This will speed you the writing
    
   // Through set you can change the value of other properties in the same scope, reason why you have to be aware of all the dependencies linked to the computed property.
    
    // first computed property
    public var first: Node<T>? {
        return head
    }
    
    // last computed property
    public var last: Node<T>? {
        return tail
    }
    
    // append method - adds node to the end of the list
    public func append(_ value: T) {
        
    }
    
    
    
    // remove last method - removes the last node from the end of the list
    
    
    
    
}
