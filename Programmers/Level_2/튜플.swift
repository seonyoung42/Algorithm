// 문제 : 프로그래머스 - 튜플 https://school.programmers.co.kr/learn/courses/30/lessons/64065
// 문자열 s가 "{{2}, {2, 1}, {2, 1, 3}, {2, 1, 3, 4}}" 와 같은 형태로 들어오기 때문에
// 한 번에 처리하기 위해서 split이 아닌 components를 사용함

func solution(_ s:String) -> [Int] {
  var s = s.components(separatedBy: ["{", ",", "}"]).filter{ !$0.isEmpty }.map {Int($0)!}
  var numDict = [Int:Int]()
  var ans = [Int]()
  
  for num in s {
    if let val = numDict[num] {
      numDict[num]! += 1
    } else {
      numDict[num] = 1
    }
  }
  
  for num in numDict.sorted(by: {$0.1 > $1.1}) {
    ans.append(num.0)
  }
  return ans
}
