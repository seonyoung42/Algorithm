import Foundation

let num = Int(readLine()!)!
var dp = Array(repeating: 0, count: 100001)

dp[1] = 3
dp[2] = 7
dp[3] = 17

if num > 3 {
    for i in 4...num {
        dp[i] = (dp[i-2] + dp[i-1]*2)%9901
    }
}

print(dp[num])
