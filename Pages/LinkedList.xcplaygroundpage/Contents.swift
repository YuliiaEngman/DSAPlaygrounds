import UIKit

// implementing a Node structure

//singly linked list - I can see just my next node (not previous)
class Node<T: Equatable>: Equatable {
    var value: T // type T only defines the value (Int, String, etc)
    var next: Node? // it has value of nil
    
    // required func for Equatable
    // lhs tail == rhs head
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value && lhs.next == rhs.next
    }
    
    init(_ value: T) {
        self.value = value
    }
}

//Doubly linked list - I can see my next node and previous node
//class Node<T> {
//    var value: T
//    var next: Node? // it has value of nil
//    var previous: Node? // doubly linked list
//    init(_ value: T) {
//        self.value = value
//    }
//}

// instantiating node instances
let car12 = Node<Int>(12)
let car99 = Node<Int>(99)

// link our nodes (list of nodes, but not full linked list yet, using connected nodes)
car12.next = car99



print(car12) // 12 -> 19 - but we do not see it, because we created our Node from the scratch
// therefore we have to take exctra step to print - to use Protocole we will use CustomStringConvertable protocol - it will give us .desctiprion and we will be able to print it

// to double
// car99.previous = car12

// array implements description by default
//let felows = ["Ameni", "Lilia"]
//print(felows)


//print the current state of the Linked node
// in order to print our connected nodes in a  readable manner
// we confirmed to CustomStringConvertable protocol
// implement var description and wrote the print logic
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value) -> nil" // if 12 car pointing to nil we want to print as 12 -> nil
        }
        //if we have more cars(nodes) connected nodes
        return "\(value) -> \(next)"
    }
}

print(car12) // to print all Linked List we just typing the name of first Node

// Implementation of a Linked List

class LinkedList<T: Equatable> {
    var head: Node<T>? // nil
    var tail: Node<T>? // nil
    
    // first computed property
    public var first: Node<T>? {
        return head
    }
    
    // last computed property
    public var last: Node<T>? {
        return tail
    }
    
    // append method - adds a Node to the end of the list
    public func append(_ value: T) {
        // create a Node
        let newNode = Node(value)
        
        // Scenario 1: appending to an empty list
        guard let lastNode = tail else { // we guarding again the tail to check if the list is empty
            // empty list
            head = newNode
            tail = head
            return
        }
        //Scenario 2: appending to an empty list
        lastNode.next = newNode
        tail = newNode
    }
    
    // isEmpty computed property
    public var isEmpty: Bool {
        print("empty list")
        return head == nil // if head equal to nil then list is empty
    }
    
    // removeLast method - removes the last node from the end of the list
    public func removeLast() -> Node<T>? {
        // scenarion 1 - empty list
//        guard let _ = head else {
//            return nil
        if isEmpty {
            return nil
        }
        
        // scenarion 2 - if we have 1 node (head == tail)
        // before using == we have to conform node to Equatable protocol as well as node's value should be conformed to equatable
        var removedNode: Node<T>?
        
        if head == tail {
            let removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
        
        // scenario 3 - we have more than 1 Node in our LinkedList
        // iterate, traverse, walk the linked list starting from the head
        
        var currentNode = head
        
        while currentNode?.next != tail { // stop at Node before the tail
            // keep traversing
            currentNode = currentNode?.next // increment currentNode by 1
        }
        // where is currentNode at the end of the while loop
        // saved the tail's node before remob=ving the last node (tail)
        removedNode = tail
        
        // set tail to previous node (that was before the lst)
        tail = currentNode
        
        // set following
        currentNode?.next = nil
        
        return removedNode
    }
    
}

// you cannot have stored property (var name = "Name" in extenssion
// but here we use computed property
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        return "\(head)"
    }
}


let fellows = LinkedList<String>()
fellows.append("Oscar")
fellows.append("Tanya")
fellows.append("David")

print(fellows) // want to show Oscar -> Tanya -> David -> nil

// test remuving last node
fellows.removeLast()

print(fellows)

fellows.append("Luba") //want to show Oscar -> Tanya -> Luba -> nil

print(fellows)

fellows.removeLast()
fellows.removeLast()
fellows.removeLast()
fellows.removeLast()
fellows.removeLast()


/=================================================================================
//                          Questions: Linked List
//=================================================================================

//class LLNode {
//  var value: Int
//  var next: LLNode?
//  init(_ value: Int) {
//    self.value = value
//  }
//}
//
//let node1 = LLNode(1)
//let node2 = LLNode(2)
//let node9 = LLNode(9)
//let node4 = LLNode(4)
//let node5 = LLNode(5)
//
//node1.next = node2
//node2.next = node9
//node9.next = node4
//node4.next = node5

// problem 1
// Using the Linked List above, write a function that finds the largest number in a Linked List of Ints.
// output: 9

//func largestNumber(_ node: LLNode) -> Int {
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
//
//
//print(largestNumber(node1))


// problem 2
// https://leetcode.com/problems/reverse-linked-list/

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
class Node1<T> {
    var value: T
    var next: Node1?// connection(pointer)
    
    // noinitializer means no value itself
    init(_ value: T) {
        self.value = value
    }
}

// implementing CustomStringConvertable to customize description of a Node

extension Node1: CustomStringConvertible { // it will customize the description will be for us
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
let car14 = Node1<Int>(14)
let car98 = Node1<Int>(98)

// link our nodes
car14.next = car98

// print the current state of the linked node
print(car14)

/*
 237. Delete Node in a Linked List
 Easy

 1842

 7829

 Add to List

 Share
 Write a function to delete a node in a singly-linked list. You will not be given access to the head of the list, instead you will be given access to the node to be deleted directly.

 It is guaranteed that the node to be deleted is not a tail node in the list.

  

 Example 1:


 Input: head = [4,5,1,9], node = 5
 Output: [4,1,9]
 Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.
 Example 2:


 Input: head = [4,5,1,9], node = 1
 Output: [4,5,9]
 Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.
 Example 3:

 Input: head = [1,2,3,4], node = 3
 Output: [1,2,4]
 Example 4:

 Input: head = [0,1], node = 0
 Output: [1]
 Example 5:

 Input: head = [-3,5,-99], node = -3
 Output: [5,-99]
  

 Constraints:

 The number of the nodes in the given list is in the range [2, 1000].
 -1000 <= Node.val <= 1000
 The value of each node in the list is unique.
 The node to be deleted is in the list and is not a tail node
 */



