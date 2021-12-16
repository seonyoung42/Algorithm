import Foundation

let num = Int(readLine()!)!
let numArray = readLine()!.split(separator: " ").map { Int(String($0))!}

var dp = Array(repeating: 0, count: num+1)

if numArray.max()! < 0 {
    print(numArray.max()!)
} else {
    dp[0] = numArray[0]
    for i in 1..<num {
        dp[i] = max(numArray[i], dp[i-1] + numArray[i])
    }
    print(dp.max()!)
}

