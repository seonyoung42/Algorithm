// 문제: 백준 칸토어 집합
// 풀이: 재귀

import Foundation // pow() 사용하기 위해 임포트

var answer = ""

while let input = readLine(), let num = Int(input) {
  cantor(num: num)
  answer += "\n"
}

print(answer)

func cantor(num: Int) {
  if num == 0 {
    answer += "-"
    return
  }
  
  cantor(num: num - 1)
  for _ in 0..<Int(pow(3.0, Double(num - 1))) {
    answer += " "
  }
  cantor(num: num - 1)
}
