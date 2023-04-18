// 문제 : 백준 다리놓기
// 풀이 : DP(수학 - 조합)
// nCr = (n-1)Cr + (n-1)C(r-1) 이라는 점화식을 사용해서, DP로 풀이하면된다.
// nCr을 팩토리얼로 풀이할 수도 있지만 n의 값이 최대 30까지이기 때문에, 숫자가 너무 커져 불가능하다.

let T = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 31), count: 31)

for i in 0...30 {
  for j in 0...i {
    if i == j || j == 0 {
      dp[i][j] = 1
      continue
    }
    dp[i][j] = dp[i-1][j] + dp[i-1][j-1]
  }
}

for _ in 0..<T {
  let input = readLine()!.split(separator:" ").map{Int(String($0))!}
  let (N, M) = (input[0], input[1])
  
  print(dp[M][N]) 
}
