import Foundation

let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nums[0]
let m = nums[1]

var result = [Int]()

backTracking()

func backTracking() {
    if result.count == m {
        print(result.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if !result.contains(i) {
            result.append(i)
            backTracking()
            result.popLast()!
        }
    }
}

