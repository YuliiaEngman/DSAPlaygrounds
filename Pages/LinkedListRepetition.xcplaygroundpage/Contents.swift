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


