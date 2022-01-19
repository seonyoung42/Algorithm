import Foundation

let n = Int(readLine()!)!
let nArray = readLine()!.split(separator: " ").map {Int(String($0))!}

var mode = Array(repeating: true, count: n)
var result = [Int]()
var results = [Int]()

recur()

func recur() {
    
    if result.count == n {
        var sum = 0
        
        for i in 0..<n-1 {
            sum += abs(result[i] - result[i+1])
        }
        results.append(sum)
        return
    }
    
    for i in 0..<n {
        if mode[i] {
            mode[i] = false
            result.append(nArray[i])
            recur()
            result.removeLast()
            mode[i] = true
        }
    }
}
print(results.max()!)
