import Foundation

let testCase = 1000000
var numArray = Array(repeating: true, count: testCase+1)

for i in 2...testCase {
    if numArray[i] == false { continue }

    for j in stride(from: i+i, through: testCase, by: i) {
        numArray[j] = false
    }
}

while true {
    let n = Int(readLine()!)!
    
    if n == 0 { break }
    
    for i in 3...n {
        if numArray[i] {
            let m = n - i
            if numArray[m] {
                print("\(n) = \(i) + \(m)")
                break
            }
        }
    }
}
