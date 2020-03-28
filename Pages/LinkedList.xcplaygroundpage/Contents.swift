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
