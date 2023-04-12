// 문제 : 백준 가로수
// 풀이 : 수학
// 가로수 간격들의 최대 공약수가 모든 가로수를 균일한 간격으로 구하는 최대 간격이 된다.
// 최대 간격과 전체 거리, 기존에 심어져 있던 가로수의 수(N)을 사용해서 추가로 심어야하는 가로수의 수를 구할 수 있다.

let N = Int(readLine()!)!
var treeArray = [Int]()
var gcd = 0

for _ in 0..<N {
  let tree = Int(readLine()!)!
  treeArray.append(tree)
}

for i in 1..<N {
  gcd = getGCD(x: gcd, y: treeArray[i] - treeArray[i - 1])
}

print((treeArray.last! - treeArray.first!) / gcd - N + 1)

func getGCD(x: Int, y: Int) -> Int {
  var x = x
  var y = y
  var temp = x % y
  
  while temp != 0 {
    x = y
    y = temp
    temp = x % y
  }
  return y
}
