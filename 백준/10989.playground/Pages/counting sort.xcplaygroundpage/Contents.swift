// > 데이터 개수 1000000개 => 기본 라이브러리로는 시간 초과
// > 수의 범위가 1 ~ 10000 => 계수 정렬

import Foundation


let num = Int(readLine()!)!
var numArray = Array(repeating: 0, count: 10001)

for _ in 0..<num {
    let a = Int(readLine()!)!
    numArray[a] += 1
}

for i in 0..<numArray.count {
    if numArray[i] != 0 {
        for _ in 0..<numArray[i] {
            print(i)
        }
    }
}
