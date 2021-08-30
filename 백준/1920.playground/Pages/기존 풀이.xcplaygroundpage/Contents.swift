// > 실행은 되지만 시간 초과나는 풀이
import Foundation

var printOrNot = false
let n = Int(readLine()!)!
let second = readLine()!.split(separator: " ")

// > 배열 안의 모든 원소의 타입을 문자열 -> 정수형으로 변환
// > Int($0) 보다 Int(String($0)이 더 빠르다
//let second = readLine()!.split(separator: " ").map{Int(String($0))}


let m = Int(readLine()!)!
let last = readLine()!.split(separator: " ")
//let last = readLine()!.split(separator: " ").map{ Int(String($0))}

for i in 0..<m {
    printOrNot = false
    for j in 0..<n {
        if last[i] == second[j] {
            printOrNot = true
            break
        }
    }
    if printOrNot {
        print("1")
    } else {
        print("0")
    }
}


