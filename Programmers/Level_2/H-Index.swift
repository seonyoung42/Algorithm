// 문제 : 프로그래머스 - H-Index: https://school.programmers.co.kr/learn/courses/30/lessons/42747
// 풀이 : H-Index - n 편의 논문 중, H번 이상 인용된 논문이 H편 이상이고, 나머지 논문들은 H번 이하로 인용되었을 때 H의 최댓값
// 
// 1. 논문을 많이 인용된 순으로 정렬한다.
// 2. i번째 논문의 인용 횟수는 citations[i]이고 citations[i] 이상 인용된 논문의 개수는 i+1 이다. 
// 3. 인용 횟수 >= 논문 개수(i+1)이면 H(i+1)번 이상 인용된 논문이 H(i+1)편 이상이 성립한 것이다.
// 4. 이때, H의 최댓값을 구해야하므로, 인용 횟수 >= 논문 개수가 성립하지 않을 떄까지 i를 1씩 늘린다.
// 5. 모든 논문을 순회해도 인용 횟수 >= 논문 개수 인 경우를 발견하지 못한다면. H-Index는 0이다.


func solution(_ citations:[Int]) -> Int {
  var citations = citations.sorted(by:>)
  var ans = 0
  
  for i in 0..<citations.count {
    if citations[i] >= i + 1 {
      ans = i + 1
    } else {
      break
    }
  }
  return ans
}
