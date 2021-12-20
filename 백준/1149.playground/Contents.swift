import Foundation

let N = Int(readLine()!)!
var nums : [[Int]] = [[]]

for _ in 0..<N {
    let a = readLine()!.split(separator: " ").map { Int(String($0))!}
    nums.append(a)
}

var dp = Array(repeating: Array(repeating: 0, count: 3), count: 1001)

for i in 1...N {
    for j in 0...2 {
        let a = (j+1)%3
        let b = (j+2)%3
        dp[i][j] = min(dp[i-1][a], dp[i-1][b]) + nums[i][j]
    }
}

print(min(dp[N][0], dp[N][1], dp[N][2]))
