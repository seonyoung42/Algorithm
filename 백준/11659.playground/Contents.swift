import Foundation

let firstArray = readLine()!.split(separator: " ").map { Int(String($0))!}
let times = firstArray[1]

let secondArray = readLine()!.split(separator: " ").map { Int(String($0))!}

var sums = [0]
var sum = 0

secondArray.forEach({
    sum += $0
    sums.append(sum)
})


for _ in 0..<times {
    let sumArray = readLine()!.components(separatedBy: " ").map { Int(String($0))!}
    let start = sumArray[0]
    let end = sumArray[1]
    
    print(sums[end] - sums[start-1])
}
