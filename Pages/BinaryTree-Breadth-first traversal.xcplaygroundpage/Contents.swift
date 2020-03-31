import UIKit

//Binary Tree - abstract data type
//the components of a tree are the root node, child node

// a node is reffered to as a leaf it does not have any children

//THERE ARE 2 ways to travers binary tree:
// 1) - Breadth-first traversal - uses a queue to keep of visited nodes
// 2) - Depth-first traversal: in-order, post-order, pre-order

class BinaryTreeNode<T> {
    var value: T // T is a generic can hold any data type (Int, String)
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    //WE need initializer to set the values (and later access that value)
    init(_ value: T) {
        self.value = value
    }
}

// Queue - is a FIFO data structure
// FIFO -
struct Queue<T> {
    private var elements = [T]()
    
    //First check is it empty
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    //peek looks at the front of the queue (line)
    public var peek: T? {
        return elements.first
    }
    
    // add an element to the back of the queue
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    
    // removes
    public mutating func dequeue()  -> T? {
        guard !elements.isEmpty else { return nil }
                return elements.removeFirst()
        }// O(n) // we will optimize
    }


/*
          root
            1
          /   \
         2     3
        / \
       4   5
 */

let rootNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)

rootNode.leftChild = twoNode
rootNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode

extension BinaryTreeNode {
    func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
        //using a queue to keep track of nodes as they are beeing visited
        // enqueus any children of that node to the Queue
        var queue = Queue<BinaryTreeNode>()
        visit(self) // self represents the root node
        // visit(self) - we are capturing the cirrent node as opposed to printing in this method
        
        queue.enqueue(self)
        //we are adding the root node to the
        
        while let node = queue.dequeue() {
            //check for left child and enqueue as needed
            if let leftChild = node.leftChild {
                visit(leftChild)
                queue.enqueue(leftChild)
            }
            // check for right child and enqueue as needed
            if let rightChild = node.rightChild {
                visit(rightChild)
                queue.enqueue(rightChild)
            }
        }
    }
}

// test out breadth-first traversal

print("breadth-first traversal")
rootNode.breadthFirstTraversal { (node) in
    print(node.value, terminator: " ") // terminator is a new line "\n", so if we want to print everything in one line
}

