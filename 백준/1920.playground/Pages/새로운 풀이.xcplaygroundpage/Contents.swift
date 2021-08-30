import Foundation

// > 특정 정수의 등장 여부만 확인
// set : 중복을 허용하지 않는 집합
// set 안에 해당 원소가 포함되어있는지 'contains'를 사용하여 간단히 확인 가능

let n = Int(readLine()!)!
let second = Set(readLine()!.split(separator: " "))

let m = Int(readLine()!)!
let last = readLine()!.split(separator: " ")

for i in last {
    if second.contains(i) {
        print("1")
    } else {
        print("0")
    }
}

