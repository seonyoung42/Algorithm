/*
 양수, +, -, 괄호
 괄호를 적절히 넣어 최소 값 구하기
 
 
 */
import Foundation

let minusSplit = readLine()!.split(separator: "-").map{String($0)}
let plustSplit = minusSplit[0].split(separator: "+").map{Int(String($0))!}

var result = 0

for i in plustSplit {
    result += i
}
var temp = 0

for i in 1..<minusSplit.count {
    let minus = minusSplit[i].split(separator: "+").map{Int(String($0))!}
    for j in minus {
        temp += j
    }
}

print(result - temp)
