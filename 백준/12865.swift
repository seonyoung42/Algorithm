// 문제 : 백준 평범한 배낭
// 풀이 : DP

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])
// bag.0 = 가방 무게, bag.1 = 가방 가치
var bags = [(Int, Int)]()
// dp[i] = 무게 i 일 때 최대 가치
// dp[i] = max(dp[i], dp[i - bag.0] + bag.1)
var dp = Array(repeating: 0, count: K+1)

for _ in 0..<N {
  let input = readLine()!.split(separator:" ").map{Int(String($0))!}
  bags.append((input[0], input[1]))
}

for bag in bags {
  for i in stride(from: K, to: 0, by: -1) {
    if i >= bag.0 {
      dp[i] = max(dp[i], dp[i - bag.0] + bag.1)
    }
  }
}

print(dp[K])
