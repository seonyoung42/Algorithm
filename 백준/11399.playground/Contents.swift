/*
 3 1 4 3 2 =>
 3
 3 + 1
 3 + 1 + 4
 3 + 1 + 4 + 3
 3 + 1 + 4 + 3 + 2
 => 3 + 4 + 8 + 11 + 13
 
 1 2 3 3 4
 1
 1 + 2
 1 + 2 + 3
 1 + 2 + 3 + 3
 1 + 2 + 3 + 3 + 4
 => 1 + 3 + 6 + 9 + 13
 
 원소 값 작은 순으로 정렬해서 더하기
 
 */

import Foundation

let N = Int(readLine()!)!
var timeArr = readLine()!.split(separator: " ").map{Int(String($0))!}
timeArr.sort {$0 < $1}

var dp = Array(repeating: 0, count: N)
dp[0] = timeArr[0]

var total = dp[0]

for i in 1..<N {
    dp[i] = dp[i-1] + timeArr[i]
    total += dp[i]
}

print(total)
