import Foundation

let N = Int(readLine()!)!
let max = 1000*1000+1
var nArray = Array(repeating: Array(repeating: 0, count: 3), count: 1001)
var dp = Array(repeating: Array(repeating: 0, count: 3), count: N+1)

var result = max

for i in 1...N {
    let a = readLine()!.split(separator: " ").map { Int(String($0))!}
    nArray[i] = a
}

for j in 0..<3 {
    let a = (j+1)%3
    let b = (j+2)%3
    
    dp[1][j] = nArray[1][j]
    dp[1][a] = max
    dp[1][b] = max
    
    for i in 2...N {
        dp[i][0] = nArray[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = nArray[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = nArray[i][2] + min(dp[i-1][1], dp[i-1][0])
    }

    result = min(result, dp[N][a], dp[N][b])
}

print(result)
