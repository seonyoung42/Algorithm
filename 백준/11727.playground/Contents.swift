import Foundation

let num = Int(readLine()!)!
//let num = 12

var numArray = [Int](repeating: 0, count: 1001)

numArray[1] = 1
numArray[2] = 3

if num >= 3 {
    for i in 3...num {
        numArray[i] = (numArray[i-2]*2 + numArray[i-1])%10007
    }
}

print(numArray[num])
