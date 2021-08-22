import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let testArray = Array(readLine()!)
    var leftStack = [String]()
    var rightStack = [String]()

    for i in 0..<testArray.count {
        if testArray[i] == "<" {
            if !leftStack.isEmpty {
                rightStack.append(leftStack.popLast()!)
            }
        } else if testArray[i] == ">" {
            if !rightStack.isEmpty {
                leftStack.append(rightStack.popLast()!)
            }
        } else if testArray[i] == "-" {
            if !leftStack.isEmpty {
                leftStack.removeLast()
            }
        } else {
            leftStack.append(String(testArray[i]))
        }
    }

    leftStack.append(contentsOf: rightStack.reversed())
    for k in 0..<leftStack.count {
        print(leftStack[k], separator: "", terminator: "")
    }
    print()
}
