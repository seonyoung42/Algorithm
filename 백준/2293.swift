// 문제 : 백준 동전 1
// 풀이 : DP
// 배열의 원소 값이 2의 31승을 넣을 수 없다는 것에 유의해야한다.
// for j 문을 돌릴 때 1씩 증가함에도 stride를 사용한 이유는, coin의 값이 k를 넘어가면 for문을 돌리지 않도록 하기 위함이다.

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var coinArray = [Int]()
var dp = Array(repeating: 0, count: k+1)
dp[0] = 1

for _ in 0..<n {
  let coin = Int(String(readLine()!))!
  coinArray.append(coin)
}

for i in 0..<n {
  for j in stride(from: coinArray[i], through: k, by:1) {
    if dp[j] + dp[j - coinArray[i]] < Int(pow(2.0, 31.0)) {
      dp[j] += dp[j - coinArray[i]]
    }
  }
}

print(dp[k])
