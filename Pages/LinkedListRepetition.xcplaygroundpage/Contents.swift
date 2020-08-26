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

class AlphabetNode {
    var value: Character
    var next: AlphabetNode?
    
    init(_ value: Character) {
        self.value = value
    }
}

// Creating nodes
let nodeA = AlphabetNode("a")
let nodeB = AlphabetNode("b")
let nodeC = AlphabetNode("c")
let nodeD = AlphabetNode("d")
let nodeE = AlphabetNode("e")
let nodeF = AlphabetNode("f")
let nodeG = AlphabetNode("g")
let nodeH = AlphabetNode("h")
let nodeI = AlphabetNode("i")
let nodeJ = AlphabetNode("j")
let nodeK = AlphabetNode("k")
let nodeL = AlphabetNode("l")
let nodeM = AlphabetNode("m")
let nodeN = AlphabetNode("n")
let nodeO = AlphabetNode("o")
let nodeP = AlphabetNode("p")
let nodeQ = AlphabetNode("q")
let nodeR = AlphabetNode("r")
let nodeS = AlphabetNode("s")
let nodeT = AlphabetNode("t")
let nodeU = AlphabetNode("u")
let nodeV = AlphabetNode("v")
let nodeW = AlphabetNode("w")
let nodeX = AlphabetNode("x")
let nodeY = AlphabetNode("y")
let nodeZ = AlphabetNode("z")

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
