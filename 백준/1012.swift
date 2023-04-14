// 문제 : 백준 유기농 배추
// 풀이 : BFS 

let T = Int(readLine()!)!
var (M, N, K) = (0,0,0) // M이 가로, N이 세로
var board = [[Bool]]()

for _ in 0..<T {
  let input = readLine()!.split(separator:" ").map{Int(String($0))!}
  (M, N, K) = (input[0], input[1], input[2])
  board = Array(repeating: Array(repeating: false, count: M), count: N)
  var count = 0
  
  for _ in 0..<K {
    let cabbage = readLine()!.split(separator:" ").map{Int(String($0))!}
    let (x, y) = (cabbage[0], cabbage[1])
    board[y][x] = true
  }
  
  for y in 0..<N {
    for x in 0..<M {
      if board[y][x] {
        // false가 나올 때까지 상하좌우로 이동
        bfs(y,x)
        count += 1
      }
    }
  }
  print(count)
}


func bfs(_ y: Int, _ x: Int) {
  board[y][x] = false
  
  for move in [(-1, 0), (1, 0), (0, -1), (0, 1)] {
    let newY = y + move.1
    let newX = x + move.0
    
    if (0..<N ~= newY) && (0..<M ~= newX) && board[newY][newX] {
      bfs(newY, newX)
    }
  }
}
