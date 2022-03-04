/*
 (x,y)
 - x+1, y
 - x, y+1
 - x-1, y
 - x, y-1  로 이동 가능하다
 
 (1,1)에서 (N,M)으로 이동하고자 할 대, 벽을 최소 몇 개 부숴야하는가
 0은 빈방, 1은 1벽
 
 bfs로 이동하면, 1인경우 +1한다. 벽의 갯수 담는 배열 counts사용하기
 */
import Foundation

let line = readLine()!.split(separator: " ").map {Int(String($0))!}

let N = line[0] - 1
let M = line[1] - 1
var graph = [[Int]]()
var needToVisit = [(Int,Int)]()
var counts = Array(repeating: Array(repeating: Int.max, count: 101), count: 101)

for _ in 0...M {
    let arr = Array(readLine()!).map{Int(String($0))!}
    graph.append(arr)
}

func bfs(row: Int, col: Int) {
    needToVisit.append((row,col))
    counts[row][col] = 0
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()
        for i in [(-1,0),(0,1), (0,-1),(1,0)] {
            let nx = node.0 + i.0
            let ny = node.1 + i.1
            
            if 0...M ~= nx && 0...N ~= ny {
                if graph[nx][ny] == 1 {
                    if counts[nx][ny] > counts[node.0][node.1] + 1{
                        counts[nx][ny] = counts[node.0][node.1] + 1
                        needToVisit.append((nx,ny))
                    }
                    
                } else if graph[nx][ny] == 0 {
                    if counts[nx][ny] > counts[node.0][node.1] {
                        counts[nx][ny] = counts[node.0][node.1]
                        needToVisit.append((nx,ny))
                    }
                }
            }
        }
    }
}

bfs(row: 0, col: 0)
print(counts[M][N])

