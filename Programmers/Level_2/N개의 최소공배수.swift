// 문제 : 프로그래머스 - N개의 최소공배수 https://school.programmers.co.kr/learn/courses/30/lessons/12953
// 풀이 : N개의 수 들 전체의 최소공배수르 구해야하는 문제

func solution(_ arr:[Int]) -> Int {
  var ans = arr[0]
  
  for i in 1..<arr.count {
    let gcd = getGCD(ans, arr[i])
    ans = ans * arr[i] / gcd            
  }
  return ans
}

func getGCD(_ a: Int, _ b: Int) -> Int {
  if b == 0 {
    return a
  }
  return getGCD(b, a % b)
}
