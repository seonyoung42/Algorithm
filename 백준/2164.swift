## 문제 : 백준 카드 2
## 풀이 : 큐
## removeFirst() 는 O(n) 이므로 queue 구조체를 생성해서 풀이한다

struct Queue {
  var left = [Int]()
  var right = [Int]()
  
  var count: Int {
    return left.count + right.count
  }
  
  var first: Int {
    return right.isEmpty ? left.first! : right.last!
  }
  
  mutating func append(_ value: Int) {
    left.append(value)
  }
  
  mutating func removeFirst() -> Int {
    if right.isEmpty {
      right = left.reversed()
      left.removeAll()
  }
  return right.popLast()!
}


let N = Int(readLine()!)!
var q = Queue()
q.left = [Int](1...N)

while q.count > 1 {
  q.removeFirst()
  let num = q.removeFirst()
  q.append(num)
}
  
print(q.first)
  
