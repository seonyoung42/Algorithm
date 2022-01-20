import Foundation

let n = Int(readLine()!)!
var W = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    let array = readLine()!.split(separator: " ").map{Int(String($0))!}
    W[i] = array
}

var minSum = 10000000
var result = [Int]()
var mode = Array(repeating: true, count: n)

func recur(_ present: Int, _ start: Int) {
    if result.count == n && present == start {
        minSum = min(minSum,result.reduce(0) {$0 + $1})
        return
    }
    
    for i in 0..<n {
        if mode[i] == true && W[present][i] > 0 {
            mode[i] = false
            result.append(W[present][i])
            recur(i, start)
            mode[i] = true
            result.removeLast()
        }
    }
}

recur(0, 0)
print(minSum)
