import Foundation

let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var nArray = readLine()!.split(separator: " ").map {Int(String($0))!}
nArray.sort()

let n = nums[0]
let m = nums[1]

var result = [String]()
var printResult = ""
var resultSet : Set<String> = []
recur()

func recur() {
    if result.count == m {
        let a = result.joined(separator: " ")
        if !(resultSet.contains(a)) {
            printResult += "\(a) \n"
            resultSet.insert(a)
        }
        return
    }
    
    for i in 0..<n {
        result.append(String(nArray[i]))
        recur()
        result.popLast()!
    }
}

print(printResult)
