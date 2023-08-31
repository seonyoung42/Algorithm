// 프로그래머스 - 단어 퍼즐 : https://school.programmers.co.kr/learn/courses/30/lessons/12983
// 풀이 : DP
// 정확성 테스트는 통과했으나 효율성은 통과하지 못했음

// prefix(n) : String에서 n개만 String 형태로 반환 
// ex) hello.prefix(3) -> "hel"

func solution(_ strs: [String], _ t: String) -> Int {
  var maxNum = 10000
  var dp = Array(repeating: maxNum, count: t.count + 1)
  dp[0] = 0

  for i in 1..<t.count {
    let tempStr = t.prefix(i)

    for str in strs {
      if tempStr.hasSuffix(str) {
        dp[i] = min(dp[i], dp[i - str.count] + 1)
      }
    }
  }

  return dp[t.count] == maxNum ? -1 : dp[t.count]
}
