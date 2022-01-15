import Foundation

let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var nArray = readLine()!.split(separator: " ").map{Int(String($0))!}
nArray.sort()

let n = nums[0]
let m = nums[1]

var mode = Array(repeating: true, count: n)
var result = [String]()
var resultSet : Set<String> = []
var printResult = ""

recur(num:0)

func recur(num: Int) {
    if num == m {
        let a = result.joined(separator: " ")
        if !resultSet.contains(a) {
            resultSet.insert(a)
            printResult += "\(a) \n"
        }
        return
    }
    
    for i in 0..<n {
        if mode[i] {
            result.append(String(nArray[i]))
            mode[i] = false
            recur(num: num+1)
            mode[i] = true
            result.popLast()
        }
    }
}

print(printResult)
