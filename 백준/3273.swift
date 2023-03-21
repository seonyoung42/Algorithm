// 문제 : 백준 두 수의 합
// 풀이 : 투 포인터

let n = Int(readLine()!)!
var numArray = readLine()!.split(separator:" ").map{ Int(String($0))! }.sorted()
let x = Int(readLine()!)!

var start = 0
var end = n - 1
var count = 0

while start < end {
  let sum = numArray[start] + numArray[end]
  
  if sum == x {
    count += 1
    start += 1
    end -= 1
  } else if sum > x {
    end -= 1
  } else {
    start += 1
  }
}

print(count)
