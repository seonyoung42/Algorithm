// -10~10까지 0을 포함하여 21가지 수 중
// 가능한 모든 N*(N+1)/2  1부터 N까지 합
// 숫자 배열 A, A[i]부터 A[j]까지 합이 0보다 크면 S[i][j] = "+" 작으면 "-" (i<=j)
// 원소가 N개인 배열 nArray를 받아서 nArray[0] = S[0][0]. nArray[0] + nArray[1] = S[0][1] 확인하기
// N이 가변적 -> 재귀

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!
var S :[[Character]] = Array(repeating: Array(repeating: "a", count: 11), count: 11)

var idx = 0
for i in 0..<N {
    for j in i..<N {
        let arrIdx = arr.index(arr.startIndex, offsetBy: idx)
        S[i][j] = arr[arrIdx]
        idx += 1
    }
}
var result = [Int]()
var mode = true

func check(_ idx: Int) -> Bool {
    var sum = 0
    for i in (0...idx).reversed() {
        sum += result[i]
    
       if S[i][idx] == "+" && sum <= 0 { return false }
       if S[i][idx] == "-" && sum >= 0 { return false }
       if S[i][idx] == "0" && sum != 0 { return false }
    }
    
    return true
}

func recur(_ num: Int) {
    if num == N {
        mode = false
        print(result.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in -10...10 {
        if !mode {
           break
        }
        
        result.append(i)
        if check(num) {
            recur(num + 1)
        }
        result.removeLast()
    }
}

recur(0)
