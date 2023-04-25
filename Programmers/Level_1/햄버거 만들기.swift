// 문제 : 프로그래머스 - 햄버거 만들기
// 풀이 : 스택

func solution(_ ingredient: [Int]) -> Int {
  var stack = [Int]()
  var count = 0
  
  for i in ingredient {
    stack.append(i)
    
    if stack.count < 4 { continue }
    
    let n = stack.count
    if Array(stack[n-4..<n]) == [1, 2, 3, 1] {
      count += 1
      stack.removeLast(4)
    }
  }
  return count
}
