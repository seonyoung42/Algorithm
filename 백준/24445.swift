// 문제 : 백준 알고리즘 수업 - 너비 우선 탐색 2
// 풀이 : BFS
// 방문할 노드르 담는 q를 배열로 구현하는 경우 removeFirst() 때문에 시간초과가 나기 때문에 Queue를 만들어 해결하였다.

struct Queue {
  var left = [Int]()
  var right = [Int]()
  
  var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
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
}

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let (N, M, R) = (input[0], input[1], input[2])
var graph = Array(repeating: [Int](), count: N+1)
var isVisited = Array(repeating: false, count: N+1)
var q = Queue()
var visited = [Int]()
var visitOrder = Array(repeating: 0, count: N+1)

for _ in 0..<M {
  let input = readLine()!.split(separator:" ").map{Int(String($0))!}
  let u = input[0]
  let v = input[1]
  
  graph[u].append(v)
  graph[v].append(u)
}

for i in 1..<graph.count {
  graph[i] = graph[i].sorted(by: >)
}

bfs(start: R)

for i in 0..<visited.count {
  visitOrder[visited[i]] = i + 1
}
  
print(visitOrder[1...N].map{String($0)}.joined(separator:"\n"))
 
func bfs(start: Int) {
  isVisited[start] = true
  q.append(start)
  visited.append(start)
  
  while !q.isEmpty {
    let node = q.removeFirst()
    
    for i in graph[node] {
      if !isVisited[i] {
        isVisited[i] = true
        q.append(i)
        visited.append(i)
      }
    }
  }
}


