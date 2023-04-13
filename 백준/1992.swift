// 문제 : 백준 쿼드트리
// 풀이 : 재귀

let N = Int(readLine()!)!
var numArray = [[Int]]()
var answer = ""

for _ in 0..<N {
  let nums = readLine()!.map{Int(String($0))!}
  numArray.append(nums)
}

quadTree(x: 0, y: 0, width: N)
print(answer)

func quadTree(x: Int, y: Int, width: Int) {
  if let value = isUnified(x, y, width) {
    answer += "\(value)"
    return
  }
  let width = width / 2
  answer += "("
  for i in [(0,0), (0, width), (width, 0), (width, width)] {
    quadTree(x: x + i.0, y: y + i.1, width: width)
  }
  answer += ")"
}

func isUnified(_ x: Int, _ y: Int, _ width: Int) -> Int? {
  let value = numArray[x][y]
  
  if width == 1 {
    return value
  }
  
  for i in x..<(x+width) {
    for j in y..<(y+width) {
      if numArray[i][j] != value {
        return nil
      }
    }
  }
  return value
}
