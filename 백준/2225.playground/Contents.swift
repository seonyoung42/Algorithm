import Foundation

//let nums = readLine()!.split(separator: " ").map { Int(String($0))!}
let nums = [1,3]
let N = nums[0]
let K = nums[1]

var dp = Array(repeating: Array(repeating: 1, count: 201), count: 201)

for i in 1..<N+1 {
    dp[2][i] += i 
}

for i in 1..<K+1 {
    dp[i][1] = i
}

if K > 2 && N > 1 {
    for i in 3...K {
        dp[i][1] = i
        for j in 2...N {
            var sum = 0
            for k in 0...j {
                sum = (sum + dp[i-1][k])%1000000000
            }
            dp[i][j] = sum%1000000000
        }
    }
}

print(dp[K][N]%1000000000)
