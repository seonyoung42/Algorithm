import Foundation

let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
//let nums = [3,16]
var numArray = Array(repeating: 0, count: nums[1] + 1)

for i in 2...nums[1] {
    numArray[i] = i
}

for i in 2...nums[1] {
    if numArray[i] == 0 { continue }
    
    for j in stride(from: i+i, through: nums[1], by: i) {
        numArray[j] = 0
    }
}

for i in nums[0]...nums[1] {
    if numArray[i] != 0 {
        print(numArray[i])
    }
}
