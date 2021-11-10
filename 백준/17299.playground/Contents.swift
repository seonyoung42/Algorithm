import Foundation

let n = Int(readLine()!)!
var numArray = readLine()!.split(separator:" ").map{Int(String($0))!}

var count = Array(repeating: 0, count: 1000000)
var stack = [Int]()

for i in 0..<n {
    count[numArray[i]-1] += 1
}

for i in 0..<n {
    
    while !stack.isEmpty && count[numArray[stack.last!]-1] < count[numArray[i]-1] {
        numArray[stack.removeLast()] = numArray[i]
    }
    stack.append(i)
}

for i in stack {
    numArray[i] = -1
}

print(numArray.map{String($0)}.joined(separator: " "))
