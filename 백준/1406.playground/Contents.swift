import Foundation

var letters = readLine()!
let testCase = Int(readLine()!)!
var rightLetters = ""

for _ in 0..<testCase {
    let line = readLine()!

    if line == "L" {
        if !letters.isEmpty {
            rightLetters.append(letters.popLast()!)
        }
    } else if line == "D" {
        if !rightLetters.isEmpty {
            letters.append(rightLetters.popLast()!)
        }
    } else if line == "B" {
        if !letters.isEmpty {
            letters.removeLast()
        }
    } else {
        letters.append(line.last!)
    }
}

print(letters + rightLetters.reversed())

