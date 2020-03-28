import UIKit


//2. Find the First Repeating word in a String
//
//Input:  "hey how are you you doing how how"
//
//OutPut: "How"

let str = "hey how are you you doing how how"

let str2 = "hey you how are you doing how how"

let strWithSpaces = str.components(separatedBy: " ")

func repeatingWord(_ str: String) -> String {
    
    let strWithSpaces = str.components(separatedBy: " ")
    
    var emptyArr = [String]()
    
    var repetingWord = String()
    
    for string in strWithSpaces {
        
        if emptyArr.contains(string) {
            repetingWord = string
            break
        }
        emptyArr.append(string)
    }
    
    return repetingWord
}

repeatingWord(str2)

// STRING MANIPULATION (may not work in Playground):
var timezone = "America/New_York"
var string = timezone.replacingOccurrences(of: "/", with: " ")

print(string)

var city = string.split(separator: " ")
print(city.last)


var timezone2 = "America/New_York"
var cityFromLocation = timezone2.split(separator: "/")
print(cityFromLocation.last)



// PALLENDROME:

var str3 = "Madam I'm Adam"

for char in str3 {
    if !char.isLetter {
        str3.remove(at: str3.firstIndex(of: char)!)
    }
}



//let sr = String(str.reversed())

//if str == String(str.reversed()) {
//    print("The sentabce is Pallendrom")
//} else {
//    print("The sentabce is NOT a Pallendrom")
//}


//extension String {

func backwords(_ str: String) -> String {
    var backwordStr = ""
    for char in str {
        backwordStr = String(char) + backwordStr
    }
    return backwordStr
}

//print(backwords("dontnod"))

if str.lowercased() == backwords(str.lowercased()) {
    print("The sentance is Pallendrom")
} else {
    print("The sentabce is NOT a Pallendrom")
}
