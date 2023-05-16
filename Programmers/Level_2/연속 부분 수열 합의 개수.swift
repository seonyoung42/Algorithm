// 문제 : 프로그래머스 - 연속 부분 수열 합의 개수 : https://school.programmers.co.kr/learn/courses/30/lessons/131701
// 풀이 : 연속 부분 수열의 합의 개수 구하기
// elements[i...i+j].reduce(0,+) 를 i와 j가 0부터 elements.count가 될 때까지 반복하면 된다.
// 이 때 i+j가 기존 elements의 개수보다 커질 수 있는 연속 부분 수열이기 때문에 elements를 두번 이어준다.
// elements[i...i+j].reduce(0,+) 의 반복을 줄이기 위해 sum을 사용하였다.

func solution(_ elements:[Int]) -> Int { 
  var count = elements.count
  var elements = elements + elements
  var numSet = Set<Int>()
  
  for i in 0..<count {
    var sum = 0
    for j in 0..<count {
      sum += elements[j + i]
      numSet.insert(sum)
    }
    return numSet.count
}
