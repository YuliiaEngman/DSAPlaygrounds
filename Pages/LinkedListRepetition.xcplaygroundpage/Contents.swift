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
// It should be class, not struct, because structs can’t have stored properties that reference themselves.

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

// 1. Define a Node class
// 2. Write a function that returns the largest number in a linked list.


// do you want a node class be generic or not?
//

class Node2 {
  var value: Int
  var next: Node2?

   init(_ value: Int) {
     self.value = value
   }
}

// 1 -> 3 -> 10 -> 7
// return largest number -> create a var of type Int empty
// loop through list and return largest value

func largestInt(node: Node2?) -> Int? {
 var largestNumber = Int.min // -89 -> -8 -> -23
 var currentNode = node

 guard let _ = node else { return nil }

 while let nextNode = currentNode {
   if largestNumber < nextNode.value {
     largestNumber = nextNode.value
   }
   // infinite loop

   // how do I get to 3 from 1
   currentNode = nextNode.next

 }
 return largestNumber
}

let node1a = Node2(1)
let node3 = Node2(3)
let node10 = Node2(10)
let node7 = Node2(7)

node1a.next = node3
node3.next = node10
node10.next = node7
//node7.next = nil

print(largestInt(node: nil) ?? -1)


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
        // create a node
        let newNode = Node(value)
        
        // scenario 1: appending to an empty list
        guard let lastNode = tail else {
            // empty list
            head = newNode
            tail = head
            return
        }
    }
    
    
    
    // remove last method - removes the last node from the end of the list

    
}


extension LinkedList: CustomStringConvertible {
    
    // this is computed property
    // we cannot have stored property in extension
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

print(fellows) // Oscar -> nil



// Retetition with Alex:

/*
// 1. Define Node class
// 2. Write a function that returns the largest number in a linked list.
*/

/*
1) Define Node Class (for Int) -> singly linked list
-value
-connection betveen nodes

get sample on numbers
assign numbers to nodes
connect them together

func (input a Node) will return Int (largest)
 create a biggestInt variable that I will assign to minimum Int

 looping through values of Linked list
  and check the value with largest integer variable
  if value will be > I will assign to largest variable

 return largest integer
*/

// Step 1:

class Node3 { // struct has default inializer and we would not need initialize it again
  var value: Int // var, not let!
  var next: Node3? // var, not let!

  init(_ value: Int) {
    self.value = value
  }
}

/*
looping through values of Linked list
  and check the value with largest integer variable
  if value will be > I will assign to largest variable
  */


// Remember about Indentation!!!!
func largestInt2(node: Node3?) -> Int? { // because I think it is good to guard aganst empty Node3 I need to have input parameter as optional type
    // as well as return should be optional too
    var largestNumber = Int.min
    
    // REVIEW GUARD STATEMENT
    // guard and check if node == nil, if nil continue
    // guard let node == nil else { return nil }
    
    guard var _  = node else { // here we unwraping optional
        return nil
    }
    
    var node = node // and on this line of code we are making node optional again! because down we have to use while loop and unwrap optional!!!
    
    // 1 -> 2 -> 3 -> nil
    //while node.next == next
    
    //  if let nextNode = node {
    
    //  }
    
    while let nextNode = node { // while loop and unwrap optional!!!
        // we cannot use "for loop" because Node class did not conform to Sequence protocol
        // so we either have to conform it to this Protocol (I do not knwo how to do that) or use while loop
        
        if nextNode.value > largestNumber {
            largestNumber = nextNode.value
        }
        // I need to get to another node and reach eventually to nil
        // this line forses us to keep looping through
        node = nextNode.next
    }
    
    // for loop - no need to
    
    // for cannot be used on the Node class since it does not conform
    // to Sequence protocol
    return largestNumber
}

let node100 = Node3(100)
let nodeMinus34 = Node3(-34)
let node0 = Node3(0)

node100.next = nodeMinus34
nodeMinus34.next = node0

print(largestInt2(node: node100) ?? 0)

// Review of unwarpping with guard:
// we can use guard inside func to unwrap optionals:

func smallestIntInArr(arr: [Int]) -> Int? { // returning an optional Int
    
    // we could just use arr.min() but we will go longer way
    
    // let's use guard to unwrap the first value:
    guard let firstValue = arr.first else {
        // we also can usr "guard var" if needed
        // remember "guard let .... else" and following return nil and just after that writing a code that will continue if returns not nil
        print("the array is empty") // we have to print it before we return from the function
        return nil // here we returning nil to represent that valid number was not found
    }
    // here we write the code if array is not empty
    // and we have access to unwrapped value
    
    //we assign smallest the first value in the array
    var smallest = firstValue
    
    for num in arr {
        if num < smallest {
            smallest = num
        }
    }
    return smallest
}
print(smallestIntInArr(arr: []))

/*
“Challenge 43: Linked lists
Difficulty: Easy

Create a linked list of lowercase English alphabet letters, along with a method that traverses all nodes and prints their letters on a single line separated by spaces.

Tip #1: This is several problems in one. First, create a linked list data structure, which itself is really two things. Second, use your linked list to create the alphabet. Third, write a method traverses all nodes and prints their letters.

Tip #2: You should use a class for this. Yes, really.

Tip #3: Once you complete your solution, keep a copy of the code – you’ll need it for future challenges!

Sample input and output
The output of your code should be the English alphabet printed to the screen, i.e. “a b c d … x y z”.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */

// Step 1 -> define a node class
class Node5 {
    var value: String
    var next: Node5?
    
    init(_ value: String) {
        self.value = value
    }
}

/*
 “Hints
 Hint #1: If your first instinct was to create your new data types as a struct, it shows you’re a sound Swift developer. Sadly, I’m afraid that approach won’t work here because structs can’t have stored properties that reference themselves.

 Hint #2: Your second instinct might be to use an enum. This makes creation tricksy because you would need to change the associated value after creating the enum.

 Hint #3: Even though this challenge uses alphabet letters, aim to make your class generic – it shows smart forward thinking, and is only fractionally harder than using a specific data type.

 Hint #4: There are lots of hacky ways to loop over the alphabet. The only sensible way is to use "abcdefghijklmnopqrstuvwxyz" – it’s not hard to write, is self-documenting, and quite safe.

 Hint #5: You should create two data types: one for a node, which contains its character and link to the next node in the list, and one for the overall linked list, which contains a property for the first node in the list as well as the print method.

 Hint #6: The print() function has a terminator parameter.”

 Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
 */


/*
“Challenge 44: Linked list mid-point
Difficulty: Easy

Extend your linked list class with a new method that returns the node at the mid point of the linked list using no more than one loop.

Tip: If the linked list contains an even number of items, returning the one before or the one after the center is acceptable.

Sample input and output
If the linked list contains 1, 2, 3, 4, 5, your method should return 3.
If the linked list contains 1, 2, 3, 4, your method may return 2 or 3.
If the linked list contains the English alphabet, your method may return M or N.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/



// Reverse singly linked list:

class NodeSinglyLL {
    var value: Int
    var next: NodeSinglyLL?
    
    init(_ value: Int) {
        self.value = value
    }
}



