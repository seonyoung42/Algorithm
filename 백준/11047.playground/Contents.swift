/*
 동전을 N종류 매우 많이 가지고 있음
 동전의 합을 K로 만들고 싶을 때
 동전 개수의 최솟값 구하기
 -> 그리디 알고리즘
 */

import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = line[0]
var K = line[1]
var coinArr = Array(repeating: 1000000, count: 10)

for i in 0..<N {
    let coinValue = Int(readLine()!)!
    coinArr[i] = coinValue
}

var count = 0

for i in (0..<N).reversed() {
    let nowCount = K / coinArr[i]
    K -= nowCount * coinArr[i]
    count += nowCount
    
    if K == 0 {
        break
    }
}
print(count)
