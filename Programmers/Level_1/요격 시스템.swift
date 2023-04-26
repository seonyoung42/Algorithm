// 문제 : 프로그래머스 - 요격 시스템 -> https://school.programmers.co.kr/learn/courses/30/lessons/181188

func solution(_ targets:[[Int]]) -> Int {
  var targets = targets.sorted(by: { $0[0] < $1[0] })
  var endPoint = targets[0][1]
  var count = 1
  targets.removeFirst()
  
  for target in targets {
    if target[0] < endPoint {
      if target[1] < endPoint {
        endPoint = target[1]
      }
    } else {
      endPoint = target[1]
      count += 1
    }
  }
  
  return count 
}
