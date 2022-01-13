import Foundation

let nums = readLine()!.split(separator: " ").map { Int(String($0))!}
let n = nums[0]
let m = nums[1]

var result = [Int]()
var printResult = ""
recur()

func recur() {
    
    if result.count == m {
        printResult += result.map{String($0)}.joined(separator: " ")
        printResult += "\n"
        return
    }
    
    for i in 1...n {
        result.append(i)
        recur()
        result.popLast()!
    }
}

print(printResult)
