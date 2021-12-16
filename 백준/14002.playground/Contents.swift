import Foundation

let num = Int(readLine()!)!
let numArray = readLine()!.split(separator: " ").map { Int(String($0))!}

var dp = Array(repeating: 1, count: num + 1)
var dpArray = Array(repeating: [Int](), count: num + 1)
dpArray[0] = [numArray[0]]

for i in 0..<num {
    dpArray[i] = [numArray[i]]
}

for i in 1..<numArray.count {
    for j in 0..<i {
        if numArray[j] < numArray[i] {
            if dp[i] < dp[j] + 1 {
                dp[i] = dp[j] + 1
                dpArray[i] = dpArray[j] + [numArray[i]]
            }
        }
    }
}

var idx = 0
var max = 0

for i in 0..<dpArray.count {
    if dpArray[i].count > max {
        max = dpArray[i].count
        idx = i
    }
}

print(max)
print(dpArray[idx].map {String($0)}.joined(separator: " "))
