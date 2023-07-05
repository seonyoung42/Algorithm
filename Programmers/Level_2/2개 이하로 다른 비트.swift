// 프로그래머스 - 2개 이하로 다른 비트 : https://school.programmers.co.kr/learn/courses/30/lessons/77885
// x보다 크고 x와 비트가 1~2개 다른 수들 중에서 제일 작은 수 구하기
// x가 짝수인 경우 ex) x= 2라면 '10' 이므로 f(2)는 3('11')이 된다.
// x가 홀수인 경우 ex) x = 7이라면 '111' 이므로 f(7)은 11(1011)이 된다.


func solution(_ numbers:[Int64]) -> [Int] {
  var numbers = numbers.map {Int($0)}
  var answer = [Int]()

  for num in numbers {
    if num % 2 == 0 {
      answer.append(num+1)
    } else {
      var numBinary = Array("0" + String(num, radix:2))
      let idx = numBinary.lastIndex(of:"0")!
      numBinary[idx] = "1"
      numBinary[idx+1] = "0"
      answer.append(Int(String(numBinary), radix:2)!)
    }
  }
  return answer
}
