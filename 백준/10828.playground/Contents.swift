import Foundation

let n = Int(readLine()!)!
var stack = [Int]()

for _ in 0..<n {
    let array = readLine()!.split(separator: " ").map { String($0)}
    
    switch array[0] {
    case "push":
        stack.append(Int(array[1])!)
    case "pop":
        if let last = stack.popLast() {
            print(last)
        } else {
            print(-1)
        }
    case "size":
        print(stack.count)
    case "empty":
        if stack.isEmpty {
            print("1")
        } else {
            print("0")
        }
    case "top":
        if stack.isEmpty {
            print(-1)
        } else {
            print(stack.last!)
        }
    default:
        print("nothing")
    }
}
