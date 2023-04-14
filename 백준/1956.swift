// 문제 : 백준 운동
// 풀이 : DP(플로이드-워셜 알고리즘)

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let (V,E) = (input[0], input[1])
let maxNum = Int.max
var dp = Array(repeating: Array(repeating: maxNum, count: V+1), count: V+1)
var minLength = maxNum

for _ in 0..<E {
  let input = readLine()!.split(separator:" ").map{Int(String($0))!}
  dp[input[0]][input[1]] = input[2]
}

// k : 거쳐가는 마을, i : 출발 마을, j : 도착 마을
for k in 1...V {
  for i in 1...V {
    for j in 1...V {
      if dp[i][k] == maxNum || dp[k][j] == maxNum { continue }
      dp[i][j] = min(dp[i][j], dp[i][k]+dp[k][j])
    }
  }
}

for i in 1...V {
  minLength = min(minLength, dp[i][i])
}

print(minLength == maxNum ? -1 : minLength)
