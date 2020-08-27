//: [Previous](@previous)

import Foundation

/*
 Linked Lists:
 
 Linked Lists are composed of a chain of connected nodes, which hold a value, and a pointer to the next node.
 
 A couple of properties to keep in mind:
 - Linked lists are unidirectional. This means that when you traverse through a linked list, you can only go in one direction. This is typically from the front of the list to the end.
    - The caveat here is that if you have a doubly linked list, it is technically possible to go backward and forward.
 
 Behaviours:
 
 Insertion:
    - Push
        - Adds an item to the front of the list.
    - Append:
        - Adds an item to the back of the list.
    - Add (after:) [This behaviour is very much optional.]
        - Adds an after a particular item in the list.
 
 Removal:
    - pop
        - Removes an item from the front of the list.
    - removeLast
        - Removes an item from the end of the list.
    - remove(at: ) [Another optional behaviour]
        - Removes an item from anywhere in the list.
 */

class Node<T> {
    
    public var value: T
    public var next: Node?
    
    init(_ value: T){
        self.value = value
        self.next = nil
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let nextNode = self.next else {
            return "\(value) → nil"
        }
        
        return "\(self.value) → " + String(describing: nextNode)
    }
    
}

struct LinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init() {}
    
    // Returns true if the list is empty
    public var isEmpty: Bool {
        return head == nil
    }
    
    // Adds an item to the front of the list
    mutating public func push(_ value: T) {
        let newNode = Node<T>(value)
        guard let _ = head else {
            head = newNode
            tail = newNode
            return
        }
        newNode.next = head
        head = newNode
    }
    
    // Adds an item to the back of the list
    mutating public func append(_ value: T) {
        let newNode = Node<T>(value)
        guard let _ = head else {
            push(value)
            return
        }
        tail?.next = newNode
        tail = newNode
    }
    
    // Returns a node at a position in the list
    mutating public func node(at index: Int) -> Node<T>? {
        var currentIndex = 0
        var current = head
        
        while let _ = current, currentIndex < index {
            current = current?.next
            currentIndex += 1
        }
        
        return current
    }
    
    // Inserts a new node after a given node.
    mutating public func insert(_ value: T, _ after: Node<T>) {
        
        // The === and !== operators are identity operators, they are used to check if two variables reference the same object.
        guard tail !== after else{
            append(value)
            return
        }
        
        let newNode = Node<T>(value)
        newNode.next = after.next
        after.next = newNode
    }
    
    // Removes an item from the front of the list.
    @discardableResult
    mutating func pop() -> Node<T>? {
        guard let _ = head else {
            return nil
        }
        
        let returnNode = head
        head = head?.next
        returnNode?.next = nil
        
        if head == nil {
            tail = nil
        }
        
        return returnNode
    }
    
    // Removes an item from the back of the list.
    @discardableResult
    mutating func removeLast() -> Node<T>? {
        guard let _ = head else {
            return nil
        }
        
        if head === tail {
            return pop()
        }
        
        var previous = head
        var current = head
        
        while let next = current?.next {
            previous = current
            current = next
        }
        
        tail = previous
        tail?.next = nil
        return current
    }
    
    // Removes a node after given node in a list.
    @discardableResult
    mutating public func remove(after node: Node<T>) -> Node<T>? {
        if node === head{
            return pop()
        } else if node === tail{
            return nil
        }
        
        if node.next === tail {
            tail = node
        }
        
        let removedNode = node.next
        node.next = removedNode?.next
        removedNode?.next = nil
        return removedNode
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let root = head else { return  "Empty List" }
        return String(describing: root)
    }
    
}

var newLinkedList = LinkedList<Int>()
newLinkedList.push(5)
newLinkedList.append(8)
newLinkedList.push(15)
let midNode = newLinkedList.node(at: 1)
if let mid = midNode {
    newLinkedList.insert(7, mid)
}
let tail = newLinkedList.node(at: 2)
if let tail = tail {
    newLinkedList.remove(after: tail)
}
print(newLinkedList)

// Reversing a Linked List Recursively
//
//func reverseList<T>(_ node: Node<T>?) -> Node<T>? {
//    guard let _ = node?.next else {
//        return node
//    }
//
//    let returnNode = reverseList(node?.next)
//
//    node?.next?.next = node
//    node?.next = nil
//
//    return returnNode
//
//}

// Reversing a LinkedList Iteratively
func reverseList<T>(_ node: Node<T>?) -> Node<T>? {
    guard let _ = node else { return nil }
    
    var prev: Node<T>?
    var next: Node<T>?
    var current = node
    
    while current != nil {
        next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    
    return prev
}
let rootNode = Node<Int>(1)
let secondNode = Node<Int>(2)
let thirdNode = Node<Int>(9)
let fourthNode = Node<Int>(4)
let fifthNode = Node<Int>(5)
let sixthNode = Node<Int>(10)
let seventhNode = Node<Int>(44)

rootNode.next = secondNode
secondNode.next = thirdNode
thirdNode.next = fourthNode
fourthNode.next = fifthNode
fifthNode.next = sixthNode
sixthNode.next = seventhNode

print(reverseList(rootNode))
