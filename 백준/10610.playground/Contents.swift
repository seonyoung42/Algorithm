/*
 길거리에 찾은 수에 포함된 숫자를 섞어 30의 배수가 되는 가장 큰 수 만들기
 30의 배수 -> 마지막 숫자 0, 모든 수의 합이 3의 배수
 
 */

import Foundation

var N = Array(readLine()!).sorted(by: >)
let sum = N.reduce(0) { $0 + Int(String($1))! }

if N.last! != "0"  || sum%3 != 0 {
    print(-1)
} else {
    print(String(N))
}

