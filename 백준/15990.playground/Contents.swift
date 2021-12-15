import Foundation

let num = 7

var dp = Array(repeating: 0, count: num+1)
dp[1] = 1
dp[2] = 1

for i in 3...num {
    dp[i] = dp[i-1] + dp[i-2]
}

print(dp[num])









let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let num = Int(readLine()!)!
    
    var dp = Array(repeating: 0, count: num+1)
    dp[1] = 1
    dp[2] = 1
    
    for i in 3...num {
        dp[i] = dp[i-1] + dp[i-2]
    }
    
    print(dp[num])
}
