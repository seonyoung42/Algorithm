import Foundation

let N = Int(readLine()!)!
let nArray = readLine()!.split(separator: " ").map { Int(String($0))!}

var dp = nArray

if N > 1 {
    for i in 1..<N {
        for j in 0..<i {
            if nArray[i] > nArray[j] {
                dp[i] = max(dp[i], dp[j] + nArray[i])
            }
        }
    }
}

print(dp.max()!)
