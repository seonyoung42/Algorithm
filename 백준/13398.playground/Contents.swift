import Foundation

let n = Int(readLine()!)!
let nArray = readLine()!.split(separator: " ").map {Int(String($0))!}

var dp = Array(repeating: Array(repeating: 0, count: 2), count: n)
var maximum = nArray[0]
dp[0][0] = nArray[0]
//dp[0][1] = 0

if n > 1 {
    for i in 1..<n {
        dp[i][0] = max(nArray[i], dp[i-1][0] + nArray[i])
        dp[i][1] = max(dp[i-1][0], dp[i-1][1] + nArray[i])
        maximum = max(dp[i][0],dp[i][1],maximum)
    }
}

print(maximum)
