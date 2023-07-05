// 프로그래머스 - 숫자 변화하기 : https://school.programmers.co.kr/learn/courses/30/lessons/154538
// x를 세 가지 연산(x + n, x * 2, x * 3)을 반복해 y로 변환한다. 이때 최소 연산 횟수를 구하여라
// BFS로 세 가지 연산을 모두 고려하는 함수를 작성할 수 있다. 

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
  let ans = bfs(x, y, n)
  return ans
}

func bfs(_ x: Int, _ y: Int, _ n: Int) -> Int {
  var needToVisit = Queue()
  needToVisit.append((x,0))
  var isVisited = Array(repeating: false, count: y + 1)
  isVisited[x] = true

  while !needToVisit.isEmpty {
    let node = needToVisit.removeFirst()!

    if node == y { 
      return node.1
    }

    for i in [node.0 + n, node.0 * 2, node.0 * 3] {
      if i <= y && !isVisited[i] {
        isVisited[i] = true
        needToVisit.append((i, node.1 + 1))
      }
    }
  }
  
  return -1
}

struct Queue {
    var left = [(Int, Int)]()
    var right = [(Int, Int)]()
    
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    mutating func append(_ num: (Int, Int)) {
        left.append(num)
    }
    
    mutating func removeFirst() -> (Int, Int) {
        if right.isEmpty {
            right = left.reversed()
            left = []
            return right.removeLast()
        }
        return right.removeLast()
    }
}
