//: [Previous](@previous)

import Foundation

// use FIFO (first in first out)

// dequeue 3
// enqueue 9
// [5 8, 12, 9]

// struct immunable by default!!!
// class is mutate by default

// SWIfT - object oriented and protocol oriented

struct Queue<T> { // T does not have any protocol conformance
    // data structure to hold elements of the Queue
    
    // properties
    private var elements = [T]() // Int, Bool, String
    // private is an "Access Control / Modifiers" -> implicit and explicit modifiers
    // var elements = [Int]() // by default is public
    
    // encapsulation - is explicitly mark your property private
    // object orienting programming: (encapsulation), modification, (inheritance), polymorphism
    
    public var isEmpty: Bool {
        // return elements.count == 0 OR
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    public var front: T? {
        // elements.first - implicit return new in Swift 5.x
        return elements.first  // O(1)
    }
    
    // here would go inialisers
    
    // methods
    // here
    public mutating func enqueue(_ element: T) {  //O(1)
        elements.append(element) // output: Void
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { //O(1)
            // we have to guard sisce we do not have popFirst tha would return optional
            return nil
        }
    return elements.removeFirst() //O(n) - because removing we need to shift everything
        // output: element: T?
}
    // TODO: print elements of queue
    
    public func printElements() {
        // while let nextNode = node - because we dont have a collection
     // here we do not need since we using array that has for loop as well as print
        print(elements)
    }
}

var queue = Queue<Int>()

queue.isEmpty

queue.dequeue()

queue.enqueue(5)
queue.enqueue(9)
queue.enqueue(1)

//[5 9, 1]

queue.front // 5


queue.dequeue() //5

queue.front // 9
