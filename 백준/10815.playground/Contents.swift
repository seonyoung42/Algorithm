/*
 숫자가 적혀있는 카드 N개
 정수 M개 중 이 수가 적혀있는 카드를 가지고 있는지 아닌지 구하기
 */

import Foundation

let N = Int(readLine()!)!
var nInput = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = Int(readLine()!)!
var mInput = readLine()!.split(separator: " ").map{Int(String($0))!}

nInput.sort()

var resultArr = Array(repeating: 0, count: M)

func binarySearch(_ left: Int, _ right: Int, _ number: Int, _ array: [Int]) -> Bool {
    var result = false
    let middle: Int = (left + right)/2

    if left > right {
        return false
    }
    
    if array[middle] > number {
        result = binarySearch(left, middle - 1, number, array)
    } else if array[middle] < number {
        result = binarySearch(middle + 1, right, number, array)
    } else {
        // array[middle] == number
        return true
    }
    
    return result
}

for i in 0..<M {
    // binarySearch(leftIdx, rightIdx, targetNum, Range)
    if binarySearch(0, N - 1, mInput[i], nInput) {
        resultArr[i] = 1
    }
}

print(resultArr.map{String($0)}.joined(separator: " "))


