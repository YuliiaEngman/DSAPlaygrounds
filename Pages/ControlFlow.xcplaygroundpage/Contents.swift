//: [Previous](@previous)

import Foundation

/*
Control Flow Exercises

In order to better prepare you for coding challenges where Xcode autocomplete may not be available and also to get you use to recoginzing compiler error without Xcode, please use repl.it for the following exercises.
Question 1

What will be printed when the code below is run? Select all that apply.

let conditionOne = !(4 < 5) || !(3 > 8)
let conditionTwo = !(!true)

if conditionOne {
 print("A")
} else if conditionTwo {
 print("B")
}
if conditionTwo {
 print("C")
}
print("D")
A
B
C
D
 
Solution: A, C, D
 */
 
 let conditionOne = !(4 < 5) || !(3 > 8) // false or true
 let conditionTwo = !(!true) // true
 
 if conditionOne { // prints A
  print("A")
 } else if conditionTwo {
  print("B")
 }
 if conditionTwo { // prints C
  print("C")
 }
 print("D") // prints D

// should print A, C, D
 
 
 */

/*
Question 2

What will the code block below print? Select all that apply:

let appInfo = (name: "myCoolApp", version: 0.4)
switch appInfo {
 case (_, 0.0..<1.0):
 print("\(appInfo.0) hasn't released yet")
 case ("myCoolApp", _):
 print("Thanks for looking at myCoolApp!")
 default:
 print("I'm not quite sure what you are looking at")
}
appInfo.0 hasn't released yet
myCoolApp hasn't released yet
Thanks for looking at myCoolApp!
I'm not quite sure what you are looking at
It will give a compile-time error
Solution
 
 
Question 3

What will be printed to the console when the code below is run? Select all that apply.

let x: Int = 4
switch x {
case 0..<4:
 print("A")
case 5..<10:
 print("B")
case 11...:
 print("C")
default:
 print("D")
}
A
B
C
D
Solution
 
 
Question 4

What are the errors in the code below for the switch statement? Select all that apply.

let candyType : String = "skittles"

switch candyType {
case "mAndM":
 print("Melts in your mouth, not in your hand")
case "skittles":
 print("Taste the rainbow")
case "snickers":
 print("Hungry? Grab a Snickers")
}
No parentheses around the conditions
No opening and closing brackets in each of the cases
No default case in the switch statement
No print statement right outside the switch statement
Solution
 
 
Question 5

Given the current weather conditions (rain, sunny, snow), use a switch statement to print an appropriate message to the user

let currentWeather = "rain"

// enter code below
Solution
 
 
Question 6

Given the first name and last name of a Fellow, declare a variable fullName and use string interpolation to concatenate the Fellow's full name and print to the console e.g The Fellow's full name is John Appleseed

let firstName = "John"
let lastName = "Appleseed"

// enter code below
Solution
 
 
Question 7

Convert the if/else statement below into a switch statement.

let temperatureInFahrenheit = 34

if temperatureInFahrenheit <= 40 {
 print("It's cold out.")
} else if temperatureInFahrenheit >= 85 {
 print("It's really warm.")
} else {
 print("Weather is moderate.")
}

//Re-written statement here
Solution
 
 
Question 8

Complete the following code so that "You win!" is printed.

if {
 print("You win!")
}
else {
 print("You lose!")
}
Solution
 
 
Question 9

Given a variable called numberOfSides, write code using a switch so that it prints out the name of the shape. Account for shapes with 3 to 10 sides and print an error message if out of range.

var numberOfSides = 6

Example 1:

Input:
var numberOfSides = 4

Output:
Quadilateral

Example 2:

Input:
var numberOfSides = 2

Output:
Error
Solution
 
 
Question 10

Create a switch statement that will convert a number grade into a letter grade as shown below:

Numeric Score     Letter Grade
100     A+
90 - 99    A
80 - 89    B
70 - 79     C
65 - 69     D
Below 65     F
Solution
 
 
Question 11

What is wrong with the block of code below? Correct it so it behaves as expected.

let firstName = "Peter"

if firstName == "Peter" {
 let lastName = "Gabriel"
} else if firstName == "Phil" {
 let lastName = "Collins"
}
let fullName = firstName + " " + lastName
Solution
 
 
Question 12

Write an if statement that prints out what decade of life someone is in (e.g "You are in your twenties). Then, write it as a switch statement.

let nameAndBirthYear: (String, Int)
Solution
 
 
Question 13

Consider the below switch statement. What should your system currently print?

let number = 42

switch number {
case 365:
 print("Days in year")
case 1024:
 print("Bytes in a Kilobyte")
case 0:
 print("Where arrays start")
case 42:
 print("The answer to life, the universe and everything")
default:
 print("Some uninteresting number")
}
What happens when you change number to:

-a. 365?

-b. 1024?

-c. 65?

What happens when you remove the default clause?

Solution
 
 
Question 14

Consider the variable below called population and the if-condition.

a. Add an else-if-condition that states if population is less than 10000 but greater than 5000, then message changes to say it's "a medium size town".

b. Add an else-condition where message changes to say it's a mid-size town.

c. Convert your final if-else statement to a switch statement.

var population: Int = 10000
var message = String()

if population > 10000 {
 message = "\(population) is a large town"
}
Solution
 
 
Question 15

Complete the code below so that it prints out and tells the user if the sum of the two numbers in the tuple is at least 15.

a. Using a conditional

b. Using a switch statement

let myTuple: (Int, Int) = (5, 10)
Solution
 */
