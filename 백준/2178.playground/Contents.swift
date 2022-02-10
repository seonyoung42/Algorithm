import Foundation

let line = readLine()!.split(separator: " ").map {Int(String($0))!}
let N = line[0]
let M = line[1]

var graph = [[Int]]()
var needToVisit = [(Int,Int)]()
var distance = Array(repeating: Array(repeating: 0, count: M), count: N)
distance[0][0] = 1

for _ in 0..<N {
    let nums = Array(readLine()!).map{Int(String($0))!}
    graph.append(nums)
}

func bfs(_ r: Int, _ c: Int) {
    needToVisit.append((r,c))
    graph[r][c] = 0
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()

        for i in [(1,0),(-1,0),(0,1),(0,-1)] {
            let (nx,ny) = (node.0 + i.0, node.1 + i.1)

            if (0..<N).contains(nx) && (0..<M).contains(ny) && graph[nx][ny] == 1 {
                graph[nx][ny] = 0
            
                
                distance[nx][ny] = distance[nx][ny] == 0 ? distance[node.0][node.1] + 1 : min(distance[nx][ny], distance[node.0][node.1] + 1)
                
                needToVisit.append((nx,ny))
            }
        }
    }
}


bfs(0, 0)
print(distance[N-1][M-1])
