/*
 병든 나이트의 이동
 -> (-2,1), (-1,2), (1,2), (2,1)
 방문하는 칸의 수를 최대로, 이동횟수가 4번이상이면 이동방법 모두 한번씩 사용해야함
 최대한 많이 방문,,
 조건별로 나누기
 
 */

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
// N : 세로, M: 가로
let N = input[0]
let M = input[1]

if N == 1 {
    print(1)
} else if N == 2 {
    print(min(4, (M+1)/2))
} else if N >= 3 {
    if M <= 6 {
        print(min(4, M))
    } else {
        print(M-2)
    }
}
