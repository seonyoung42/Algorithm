// 문제 : 백준 알고리즘 수업 - 너비 우선 탐색 1
// 풀이 : BFS
// Queue 만들어서 시간초과 해결하였다.

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let (N, M, R) = (input[0], input[1], input[2])
var graph = Array(repeating: [Int](), count: N+1) // 각 정점에 연결되어 있는 정점을 담는 배열 
var isVisited = Array(repeating: false, count: N+1)
var orderArray = Array(repeating: 0, count: N+1)
var idx = 1

for _ in 0..<M {
  let line = readLine()!.split(separator:" ").map{Int(String($0))!}
  graph[line[0]].append(line[1])
  graph[line[1]].append(line[0])
}

func bfs(start: Int) {
  var needToVisit = Queue(nums: [start])
  isVisited[start] = true
  orderArray[start] = idx
  idx += 1
  
  while !needToVisit.isEmpty {
    let node = needToVisit.removeFirst()
    
    for i in graph[node].sorted() {
      if !isVisited[i] {
        isVisited[i] = true
        orderArray[i] = idx
        idx += 1
        needToVisit.append(i)
      }
    }
  }
}

bfs(start: R)
print(orderArray[1...N].map{String($0)}.joined(separator:"\n"))

struct Queue {
  var left = [Int]()
  var right = [Int]()
  
  init(nums: [Int]) {
    left = nums
  }
  
  var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }
  
  mutating func append(_ num: Int) {
    left.append(num)
  }
  
  mutating func removeFirst() -> Int {
    if right.isEmpty {
      right = left.reversed()
      left = []
    }
    return right.removeLast()
  }
}
