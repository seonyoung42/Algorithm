import Foundation

let S = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}

var subArray = Set<Int>()

func getSubArray(_ start: Int, _ sum: Int) {
    subArray.insert(sum)
    for i in start..<numArr.count {
        getSubArray(i+1, sum+numArr[i])
    }
}
getSubArray(0, 0)
var minValue = subArray.min()!

while true {
    if subArray.contains(minValue+1) {
        minValue += 1
    } else {
        print(minValue+1)
        break
    }
}
