import Foundation

let testCase = Int(readLine()!)!

var dp = Array(repeating: 1, count: 1000001)
dp[2] = 2

for i in 3..<dp.count {
    dp[i] = (dp[i-1] + dp[i-2] + dp[i-3])%1000000009
}

for _ in 0..<testCase {
    let num = Int(readLine()!)!
    print(dp[num])
}


// > 풀이 2
//for _ in 0..<testCase {
//    let num = Int(readLine()!)!
//    var dp = Array(repeating: 1, count: num+1)
//    dp[2] = 2
//
//    if num > 2 {
//        for i in 3...num {
//            dp[i] = (dp[i-1] + dp[i-2] + dp[i-3])%1000000009
//        }
//    }
//    print(dp[num]%1000000009)
//}
