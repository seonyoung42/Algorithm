import Foundation

var num = Int(readLine()!)!
//var num = 10
var dp = Array(repeating: 0, count: 1000001)

if num == 1 {
    print("0")
} else {
    for i in 2...num {
        dp[i] =  dp[i - 1] + 1
        
        if i%2 == 0 {
            dp[i] = min(dp[i/2] + 1, dp[i])
        }
        
        if i%3 == 0 {
            dp[i] = min(dp[i/3] + 1, dp[i])
        }
    }
    print("\(dp[num])")
}
