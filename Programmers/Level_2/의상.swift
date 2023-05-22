// 문제 : 프로그래머스 - 의상 https://school.programmers.co.kr/learn/courses/30/lessons/42578
// 풀이 : 수학 - 조합
// 의상의 종류가 겹치지 않게 고르는 경우의 수를 구하는 문제
// 특정 종류의 의상의 고르지 않는 경우도 포함해야하기 때문에 의상의 개수 + 1 개 만큼 곱해준다
// 대시, 모든 종류의 의상을 고르지 않는 경우도 포함되기 때문에 최종 결과값에서 1을 빼준다.

func solution(_ clothes:[[String]]) -> Int {
  var clothDict = [String:Int]()
  var ans = 1
  
  for cloth in clothes {
    if let val = clothDict[cloth[1]] {
      clothDict[cloth[1]]! += 1
    } else {
      clothDict[cloth[1]] = 1
    }
  }
  
  for cloth in clothDict {
    ans *= (cloth.value + 1)
  }
  return ans - 1
}
