import Foundation

let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var nArray = readLine()!.split(separator: " ").map {Int(String($0))!}
nArray.sort()

let n = nums[0]
let m = nums[1]

var result = [String]()
var printResult = ""
var resultSet : Set<String> = []
var mode = Array(repeating: true, count: n)

recur()

func recur() {
    if result.count == m {
        let a = result.joined(separator: " ")
        if !resultSet.contains(a) {
            printResult += "\(a) \n"
            resultSet.insert(a)
        }
        return
    }
    
    for i in 0..<n {
        if mode[i] {
            if nArray[i] >= Int(result.last ?? "0")! {
                mode[i] = false
                result.append(String(nArray[i]))
                recur()
                mode[i] = true
                result.popLast()!
            }
        }
    }
}

print(printResult)
