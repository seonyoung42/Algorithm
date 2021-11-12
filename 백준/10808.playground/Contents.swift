import Foundation

let line = readLine()!
//print(Character("a").asciiValue!)

var charArray = Array(repeating: 0, count: 26)

for char in line {
    charArray[Int(char.asciiValue!)-97] += 1
}

print(charArray.map{String($0)}.joined(separator: " "))
