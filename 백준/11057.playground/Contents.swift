import Foundation

let N = Int(readLine()!)!
var sum = 0

var dp = Array(repeating: Array(repeating: 0, count: 10), count: 1001)

for i in 0...9 {
    dp[1][i] = 1
}

if N > 1 {
    for i in 2...N {
        for j in 0...9 {
            for k in j...9 {
                dp[i][j] = (dp[i][j] + dp[i-1][k])%10007
            }
        }
    }
}

for i in 0...9 {
  sum = (sum + dp[N][i])%10007
}

print(sum)


// 풀이 2
//var dp = Array(repeating: 1, count: 10)
//
//for _ in 1..<N {
//    for i in 1..<dp.count {
//        dp[i] = (dp[i-1] + dp[i])%10007
//    }
//}
//
//print(dp.reduce(0, {$0 + $1})%10007)
