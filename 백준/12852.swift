// 문제 : 백준 1로 만들기 2
// 풀이 : BFS

let N = Int(readLine()!)!

var queue = [(Int, String, Int)]()
var isVisited = Array(repeating: false, count: N + 1)

func bfs(start: Int) {
  isVisited[start] = true
  queue.append((start, "\(start)", 0))
  
  while !queue.isEmpty {
    let node = queue.removeFirst()
    let (num, str, count) = (node.0, node.1, node.2)
    
    if num == 1 {
      print(count)
      print(str)
      break
    }
    
    if num % 3 == 0 && !isVisited[num / 3] {
      isVisited[num / 3] = true
      queue.append((num / 3, str + " \(num / 3)", count + 1))
    } 
    
    if num % 2 == 0 && !isVisited[num / 2] {
      isVisited[num / 2] = true
      queue.append((num / 2, str + " \(num / 2)", count + 1))
    } 
    
    if !isVisited[num - 1] {
      isVisited[num - 1] = true
      queue.append((num - 1, str + " \(num - 1)", count + 1))
    }
  }
}

bfs(start: N)
