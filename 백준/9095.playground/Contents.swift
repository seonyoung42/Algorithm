import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let num = Int(readLine()!)!

    var numArray = Array(repeating: 0, count: 11)

    numArray[1] = 1
    numArray[2] = 2
    numArray[3] = 4

    if num >= 4 {
        for i in 4...num {
            numArray[i] = (numArray[i-1] + numArray[i-2] + numArray[i-3])
        }
    }
    print(numArray[num])
}

