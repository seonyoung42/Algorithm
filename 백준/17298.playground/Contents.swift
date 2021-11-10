import Foundation

let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map({Int(String($0))!})

//let n = 4
//var array = [3,5,2,7]
var stack = [Int]()

for i in 0..<n {
    while !stack.isEmpty && array[stack.last!] < array[i] {
        array[stack.removeLast()] = array[i]
    }
    stack.append(i)
}

for i in stack {
    
    array[i] = -1
}

// > 이 방법으로 출력 시 시간 초과 남
//array.forEach {
//    print($0, terminator: " ")
//}

print(array.map{String($0)}.joined(separator: " "))
