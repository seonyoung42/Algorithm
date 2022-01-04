import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 31)
dp[2] = 3

if n > 3 {
    for i in 4...n {
        if i.isMultiple(of: 2) {
            dp[i] = dp[i-2]*3
            for j in 4...i {
                dp[i] += dp[i-j]*2
            }
            dp[i] += 2
        }
    }
}
print(dp[n])
