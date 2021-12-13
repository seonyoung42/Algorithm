import Foundation

let num = Int(readLine()!)!
//let num = 9

var numArray = Array(repeating: 0, count: 1001)
numArray[1] = 1
numArray[2] = 2

if num >= 3 {
    for i in 3...num {
        numArray[i] = (numArray[i-1] + numArray[i-2])%10007
    }
}

print(numArray[num])
