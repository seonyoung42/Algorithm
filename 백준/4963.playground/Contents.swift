import Foundation

while true {
    let line = readLine()!.split(separator: " ").map {Int(String($0))!}
    if line == [0,0] {
        break
    }
    
    let w = line[0]
    let h = line[1]
    var graph = [[Int]]()
    var count = 0

    for _ in 0..<h {
        let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph.append(arr)
    }

    func bfs(_ r: Int, _ c: Int) {
        let dx = [1,-1,0,0]
        let dy = [0,0,1,-1]

        var needVisit = [(Int,Int)]()
        needVisit.append((r,c))
        graph[r][c] = 0
        count += 1
        
        while !needVisit.isEmpty {
            let node = needVisit.removeFirst()
            // 상하좌우
            for i in 0..<4 {
                let (nx,ny) = (node.0 + dx[i], node.1 + dy[i])
                
                if (0..<h).contains(nx) && (0..<w).contains(ny) && graph[nx][ny] == 1 {
                    graph[nx][ny] = 0
                    needVisit.append((nx,ny))
                    
                }
            }
            // 대각선
            for j in [(-1,1), (1,1), (-1,-1), (1,-1)] {
                let (nx,ny) = (node.0 + j.0, node.1 + j.1)
                
                if (0..<h).contains(nx) && (0..<w).contains(ny) && graph[nx][ny] == 1 {
                    graph[nx][ny] = 0
                    needVisit.append((nx,ny))
                    
                }
            }
        }
    }

    for i in 0..<h {
        for j in 0..<w {
            if graph[i][j] == 1 {
                bfs(i, j)
            }
        }
    }
    print(count)
}
