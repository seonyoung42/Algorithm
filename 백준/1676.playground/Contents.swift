import Foundation

let n = Int(readLine()!)!
var count = 0

for i in 1..<n+1 {
    var num = i
    while num>0, num%5 == 0 {
        count += 1
        num /= 5
    }
}

print(count)
