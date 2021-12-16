import Foundation

let num = Int(readLine()!)!
var dp = Array(repeating: 0, count: 91)

dp[1] = 1
dp[2] = 1

if num > 2 {
    for i in 3...num {
        dp[i] = dp[i-1] + dp[i-2]
    }
}

print(dp[num])
