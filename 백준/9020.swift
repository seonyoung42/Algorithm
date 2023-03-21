// 문제 : 백준 골드바흐의 추측
// 풀이 : 에라토스테네스의 체

let testCase = Int(readLine()!)!
var primeArray = Array(repeating:0, count: 10001)
getPrimeNum()

for _ in 0..<testCase {
  let num = Int(readLine()!)!
  getPrimePair(num: num)
}

func getPrimeNum() {
  for i in 2..<primeArray.count {
    primeArray[i] = i
  }
  
  for i in 2..<primeArray.count {
    for j in stride(from: i+i, to: primeArray.count - 1, by: i) {
      primeArray[j] = 0
    }
  }
}

func getPrimePair(num: Int) {
  for i in (num/2)...num {
    if primeArray[i] != 0 {
      let rest = num - primeArray[i]
      if primeArray[rest] != 0 {
        print("\(rest) \(i)")
      }
    }
  }
}
