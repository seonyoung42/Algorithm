import Foundation

let nums = readLine()!.split(separator: " ").map{Int(String($0))!}
var nArray = readLine()!.split(separator: " ").map { Int(String($0))!}
nArray.sort()

let n = nums[0]
let m = nums[1]

var result = [String]()
var printResult = ""

recur()

func recur() {
    
    if result.count == m {
        printResult += result.joined(separator: " ")
        printResult += "\n"
        return
    }
    
    for i in 0..<n {
        if Int(result.last ?? "0")! <= nArray[i] {
            result.append(String(nArray[i]))
            recur()
            result.popLast()!
        }
    }
}

print(printResult)
