// 문제 : 프로그래머스 - 다음 큰 숫자 https://school.programmers.co.kr/learn/courses/30/lessons/12911
// 풀이 : 이진법
// replacingOccurrences(of:with) 보다 filter가 더 빠르다
// nonzeroBitCount를 사용한 풀이
//  - 이진법으로 변환했을 때 1의 개수를 알려주는 메서드 https://developer.apple.com/documentation/swift/int/nonzerobitcount

// 방법 1
func solution(_ n:Int) -> Int {
  let nCount = String(n,radix:2).filter{$0 == "1"}.count
  var num = n + 1
  
  while true {
    let numCount = String(num, radix: 2).filter{$0 == "1"}.count
    if numCount == nCount {
      break
    }
    num += 1
  }
  return num
}



// 방법 2
func solution(_ n:Int) -> Int {
  let nCount = n.nonzeroBitCount
  var num = n + 1
  
  while true {
    if num.nonzeroBitCount == nCount {
      break
    }
    num += 1
  }
  return num
}

