// 문제: 백준 대칭 차집합
// 풀이: Set 연산

let input = readLine()!
let arrayA = Set(readLine()!.split(separator:" ").map{Int(String($0))!})
let arrayB = Set(readLine()!.split(separator:" ").map{Int(String($0))!})

var count = 0 
count += arrayA.subtracting(arrayB).count
count += arrayB.subtracting(arrayA).count

print(count)
