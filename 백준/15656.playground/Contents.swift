import Foundation

let nums = readLine()!.split(separator: " ").map { Int(String($0))!}
var nArray = readLine()!.split(separator: " ").map { Int(String($0))!}
nArray.sort()

let n = nums[0]
let m = nums[1]

var result = [String]()
var printResult = ""

recur(num:0)

func recur(num: Int) {
    if num == m {
        printResult += result.joined(separator: " ")
        printResult += "\n"
        return
    }
    
    for i in 0..<n {
        result.append(String(nArray[i]))
        recur(num: num+1)
        result.popLast()!
    }
}

print(printResult)


