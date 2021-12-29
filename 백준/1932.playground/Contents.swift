import Foundation

let n = Int(readLine()!)!
var nArray = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for i in 0..<n {
    nArray[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in 1..<n {
    for j in 0..<i+1 {
        if j == 0 {
            nArray[i][j] += nArray[i-1][j]
        } else if j == i {
            nArray[i][j] += nArray[i-1][j-1]
        } else {
            nArray[i][j] += max(nArray[i-1][j], nArray[i-1][j-1])
        }
    }
}

print(nArray[n-1].max()!)
