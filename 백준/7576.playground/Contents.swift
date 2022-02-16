/**
 익은 토마토 근처에 있으면, 익지않은 토마토들도 이게 된다 (근처: 상,하,좌,우, 대각선x)
 모든 토마토가 익는데 필요한 최소 일수 구하기/ 이미 다 익어있으면 0, / 다 익는게 불가능 -> -1
 bfs로 인접 노드들을 1로 바꿈
 bfs의 횟수 -> 날짜
 
 bfs로
 */

import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = line[0]
let N = line[1]

var graph = [[Int]]()
var check : [[Bool]] = Array(repeating: Array(repeating: false, count: 1000), count: 1000)
var days = 0
var needToVisit = [(Int,Int)]()

for _ in 0..<N {
    let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph.append(arr)
}

while true {
    
    for i in 0..<N {
        for j in 0..<M {
            if graph[i][j] == 1 && !check[i][j] {
                // bfs
                bfs(i, j)
            }
        }
    }
    
    if needToVisit.isEmpty {
        break
    } else {
        for i in needToVisit {
            graph[i.0][i.1] = 1
        }
        needToVisit = []
    }
    days += 1
}

for row in graph {
    if row.contains(0) {
        days = -1
        break
    }
}

print(days)

func bfs(_ r: Int, _ c: Int) {
    check[r][c] = true
    
    for i in [(1,0),(-1,0),(0,1),(0,-1)] {
        let (nx,ny) = (r + i.0, c + i.1)
        if (0..<N).contains(nx) && (0..<M).contains(ny) && graph[nx][ny] == 0 {
            needToVisit.append((nx,ny))
        }
    }
}

