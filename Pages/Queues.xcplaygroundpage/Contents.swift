import UIKit


//REVIEW: customstringconvertable

//Queues: is a abstract data type that is a FIFO structure (meqning: first object added is the first object to be removed from the data structure)

//methods of a Queue: FIRST IN FIRST OUT!

//enqueue: add item to the back of the queue

//dequeue: remove item from the front of the queue

//properties: count, isEmpty, peek

struct Queue<T> {
    // implementing a queue using an array
    private var elements = [T]()
    // private var linkedList = LinkedList<T>()
    // private var stack = [Int]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    //returns the item in the front of the queue, does not remove it
    public var peek: T? {
        return elements.first
    }
    
    //add item to elements
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    
    //remove item from front of elements array
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
}

var queue = Queue<String>()
queue.enqueue("Mel")
queue.enqueue("Kelby")
queue.enqueue("Oscar")

print("\(queue.peek ?? "") is at the front of the line")

queue.dequeue()

print("fellows left in the are \(queue)")

queue.enqueue("Eric")

print("there are \(queue.count) fellows on line")

//Iterate through a queue structure

var queueCopy = queue

print("there are \(queueCopy.count) fellows in queueCopy")

while let value = queueCopy.dequeue() {
    print("fellow: \(value)")
}

print("There are \(queueCopy.count) fellows left in queueCopy")


//PRACTICE:

//1. Find the smallest element in a queue
//func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
//    return nil
//}

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var smallestQueue = q
    
    guard var smallest = smallestQueue.peek else { return nil }
    
    while let value = smallestQueue.dequeue() {
        if value <= smallest {
            smallest = value
        }
    }
    return smallest
}

var queue2 = Queue<Int>()

queue2.enqueue(1)
queue2.enqueue(-5)
queue2.enqueue(100)

smallestElement(in: queue2)


//2. Find the sum of a queue of Ints
//func sum(of q: Queue<Int>) -> Int {
//    return 0
//}

func sum(of q: Queue<Int>) -> Int {
    
    var someQueue = q
    
    var sumNum = Int()
    
    while let value = someQueue.dequeue() {
        sumNum = sumNum + value
    }
    
    return sumNum
}

var queue3 = Queue<Int>()

queue3.enqueue(1)
queue3.enqueue(-5)
queue3.enqueue(100)

sum(of: queue3)
