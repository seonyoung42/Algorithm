import Foundation

let N = Int(readLine()!)!
let costArray = readLine()!.split(separator: " ").map { Int(String($0))!}

var dp = Array(repeating: 0, count: N+1)

dp[1] = costArray[0]

for i in 2...N {
    dp[i] = costArray[i-1]
    let num = (i+1)/2
    
    for j in 1...num {
        dp[i] = dp[i] < (dp[j] + dp[i-j]) ? dp[i] : (dp[j] + dp[i-j])
    }
}

print(dp[N])
