import UIKit

// Binary Tree - Depth-forst traversal

// Depth-first traversal
/*
 1. in-oder
 2. pre-order
 3.post-order
 
                1
               / \
              2   3
             / \  / \
            4   5 6  7
 
 */

class BinaryTreeNode<T> {
    var value: T
    var leftChild: BinaryTreeNode? //because optional has a value of nil!!!
    var rightChild: BinaryTreeNode?
    init(_ value: T) {
        self.value = value
    }
}

extension BinaryTreeNode {
    /*STEPS:
     1. visit left child recursively
     2. visit current node
     3. visit right child recursively
     */
    func inOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        leftChild?.inOrderTraversal(visit: visit)
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
    }
    
    // a closure captures values (stores values for use a call time)
    func preOderTraversal(visit: (BinaryTreeNode) -> ()) {
        visit(self)
        leftChild?.preOderTraversal(visit: visit)
        rightChild?.preOderTraversal(visit: visit)
    }
    
    func postOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
}

// create a tree
let treeNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)
let sixNode = BinaryTreeNode<Int>(6)
let sevenNode = BinaryTreeNode<Int>(7)

treeNode.leftChild = twoNode
treeNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode
threeNode.leftChild = sixNode
threeNode.rightChild = sevenNode

//test in-order traversal
// expected output: 4 2 5 1 6 3 7
print("in-order traversal: ")
treeNode.inOrderTraversal { (node) in
    print(node.value, terminator: " ")
}

print("/n")

// test pre-order traversal
print("pre-order traversal")
treeNode.preOderTraversal { (node) in
    print(node.value, terminator: " ") // 4 5 2 6 7 3 1
}

print("\n")

// test post-order traversal
print("post-order traversal")
treeNode.postOrderTraversal { (node) in
    print(node.value, terminator: " ") // 4 5 2 6 7 3 1
}

// implement the following binary tree and print the nodes such that the output is
// Encyclopedia, Science, Culture, Art and Craft
/*
 
              Encyclopedia
                   / \
           Science     Culture
                        /  \
                    Art     Craft
*/

// levelOrderTraversal
// preOrderTraversal

class BinaryNode<T> {
  var value: T

  var leftChild: BinaryNode<T>?
  var rightChild: BinaryNode<T>?

  init(_ value: T) {
    self.value = value
  }
}

extension BinaryNode {
  func preOrderTraversal(visit: (T) -> Void) {
    visit(value)
    leftChild?.preOrderTraversal(visit: visit)
    rightChild?.preOrderTraversal(visit: visit)
  }
}

let arr = ["Encyclopedia", "Science", "Culture", "Art", "Craft"]

let eNode = BinaryNode(arr[0])
let sNode = BinaryNode(arr[1])
let cNode = BinaryNode(arr[2])
let aNode = BinaryNode(arr[3])
let crNode = BinaryNode(arr[4])

eNode.leftChild = sNode
eNode.rightChild = cNode

cNode.leftChild = aNode
cNode.rightChild = crNode

func printTraversal() {
  eNode.preOrderTraversal { value in
    print(value)
  }
}

print("\n")

printTraversal()

