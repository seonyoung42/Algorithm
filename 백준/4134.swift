// 문제: 백준 다음 소수
// 풀이: 수학

import Foundation // <- sqrt 사용하기 위해 임포트

let testCase = Int(readLine()!)!
var answer = ""

for _ in 0..<testCase {
  var num = Int(readLine()!)!
  
  while !isPrimeNum(num: num) {
    num += 1
  }
  answer += "\(num)\n"
}

print(answer)

func isPrimeNum(num: Int) -> Bool {
  if num < 2 {
    return false
  }
  
  for i in 2..<Int(sqrt(Double(num)) + 1) {
    if num % i == 0 {
      return false
    }
  }
  return true
}
