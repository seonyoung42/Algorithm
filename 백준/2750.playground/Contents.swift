import Foundation

let num = Int(readLine()!)!
var numArray = [Int]()

for _ in 0..<num {
    let result = Int(readLine()!)!
    numArray.append(result)
}

numArray.sort()

for num in numArray {
    print(num)
}
