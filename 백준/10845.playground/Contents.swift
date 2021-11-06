import Foundation

let testCase = Int(readLine()!)!
var numArray = [Int]()

for _ in 0..<testCase {
    let line = readLine()!.split(separator: " ")

    if line[0] == "pop" {
        if numArray.isEmpty {
            print(-1)
        } else {
            print(numArray[0])
            numArray.removeFirst()
        }
    } else if line[0] == "size" {
        print(numArray.count)
    } else if line[0] == "empty" {
        print(numArray.isEmpty ? 1 : 0)
    } else if line[0] == "front" {
        print(numArray.isEmpty ? -1 : numArray.first!)
    } else if line[0] == "back" {
        print(numArray.isEmpty ? -1 : numArray.last!)
    } else {
        numArray.append(Int(line[1])!)
    }
}


