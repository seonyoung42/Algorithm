/*
 i 스위치 => i-1, i, i+1의 상태 바뀜
 - 1 스위치 => 1, 2 상태변화
 - N 스위치 => N-1, N
 */

import Foundation

let N = Int(readLine()!)!
var current = Array(readLine()!).map{Int(String($0))!}
var future = Array(readLine()!).map{Int(String($0))!}

var result = Int.max

func isSame(_ current: [Int]) -> Bool {
    var temp = current
    var count = 0
    for i in 1..<N {
        if temp[i-1] != future[i-1] {
            
            var changeRange = [i-1,i,i+1]
            if i == (N-1) {
                changeRange = [i-1, i]
            }
            
            for j in changeRange {
                temp[j] = temp[j] == 0 ? 1 : 0
            }
            count += 1
        }
    }
    let isSame = temp == future
    result = isSame ? min(result, count) : result
    return isSame
}

// 0번째 스위치를 누르지 않는 경우, 누르는 경우 나눠서 고려
if isSame(current) {
    print(result)
} else {
    current[0] = current[0] == 0 ? 1 : 0
    current[1] = current[1] == 0 ? 1 : 0
    
    if isSame(current) {
        print(result+1)
    } else {
        print(-1)
    }
}

