// 문제: 백준 구간 합 구하기
// 풀이: DP
// numArray의 (0,0)부터 [i,j] 까지의 합을 저장하는 sumArray를 Dp로 구현한다. 
// 이때 sumArray[i][j] 는 numArray[i - 1][j - 1] + sumArray[i - 1][j] + sumArray[i][j - 1] - sumArray[i - 1][j - 1] 이다

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let (N,M) = (input[0], input[1])
var numArray = [[Int]]()
var sumArray = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var answer = ""

for _ in 0..<N {
  let input = readLine()!.split(separator:" ").map{Int(String($0))!}
  numArray.append(input)
}

for i in 1...N {
  for j in 1...N {
    sumArray[i][j] = numArray[i - 1][j - 1] + sumArray[i - 1][j] + sumArray[i][j - 1] - sumArray[i - 1][j - 1]
  }
}

for _ in 0..<M {
  let input = readLine()!.split(separator:" ").map{Int(String($0))!}
  let (x1, y1, x2, y2) = input
  
  let ans = sumArray[x2][y2] + sumArray[x1 - 1][y1 - 1] - sumArray[x2][y1 - 1] - sumArray[x1 - 1][y2]
  answer += "\(ans)\n"
}

print(answer)
