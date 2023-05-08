// 문제 : 프로그래머스 - 리코쳇 로봇 https://school.programmers.co.kr/learn/courses/30/lessons/169199
// 풀이 : BFS
// 처음엔 bfs에 count 매개변수를 넣어 재귀로 구현하였는데 시간 초과가 떴다. 따라서 재귀를 없애기 위해 countArr 2차원 배열을 만들어 해당 위치에서의 움직임 횟수를 저장하였다. 
// 해당 위치를 방문하지 않은 경우 그 값이 초기값인 -1이기 때문에, 값이 -1인 경우에만 queue에 담도록 하였다.
// 상하좌우로 한 칸씩 이동하는 것이 아니라, 이동이 가능할 때까지 미끄러져 이동해야하기 때문에 while 문을 사용해서 이동이 불가할 때까지 이동할 수 있게 하였다.
// 여기서 시간이 더 초과된다면, queue 자료구조를 만들어 removeFirst()에 소요되는 시간을 줄일 것이다.

func solution(_ board:[String]) -> Int {
  var board = board.map{ Array($0).map{ String($0) } }
  var start = (0, 0)
  
  for x in 0..<board.count {
    for y in 0..<board[x].count {
      if board[x][y] == "R" {
        start = (x, y)
        break
      }
    }
  }
  return bfs(start.0, start.1, board)
}

func bfs(_ startX: Int, _ startY: Int, _ board: [[String]]) -> Int {
  var countArr = Array(repeating: Array(repeating: -1, count: board[0].count), count: board.count)
  var queue: [(Int, Int)] = [(startX, startY)]
  countArray[startX][startY] = 0
  
  while !queue.isEmpty {
    let node = queue.removeFirst()
    
    if board[node.0][node.1] == "G" {
      return countArr[node.0][node.1]
    }
    
    for i in [(-1, 0), (1, 0), (0, -1), (0, 1)] {
      var x = node.0 + i.0
      var y = node.1 + i.1
      
      while true {
        if !(x >= 0 && x < board.count) || !(y >= 0 && y < board[0].count) || board[x][y] == "D" {
          x -= i.0
          y -= i.1
          break
        }
        
        x += i.0
        y += i.1
      }
      
      if countArr[x][y] == -1 {
        countArr[x][y] = countArr[node.0][node.1] + 1
        queue.append((x, y))
      }
    }
  }
  
  return -1
}
