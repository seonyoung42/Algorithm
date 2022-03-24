/*
 2여 1남
 N여, M남
 K명은 인턴쉽에 참여해야해서 대회 참여 불가
 만들 수 있는 최대 팀 수 구하기
 
 인턴을 N에서 빼갈 지 M에서 빼갈 지
 그리디 알고리즘으로 N > 2*M을 기준으로 풀이
 
 */

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var N = input[0]
var M = input[1]
let K = input[2]

for _ in 0..<K {
    if N >= M * 2 {
        N -= 1
    } else {
        M -= 1
    }
}

print(min(N/2, M))
