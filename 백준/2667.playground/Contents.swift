// 단지 개수, 단지내 집의 수를 오름차순으로
// 집이 있음(1) 이 좌, 우, 위, 아래 에 있으면 연결 ->
// 연결된 경우 개수, 연결된 집 개수 구하기 -> 연결리스트 탐색
// 좌우, 아래 위 탐색 => bfs => 1인 경우를 needvisited 배열에 넣기
// (0,0)을 표현하기 위해서 튜플 사용,,
// 방문해야하는 점과 방문한 점을 기록하는 튜플 배열

import Foundation

let N = Int(readLine()!)!
var graph = [[Int]]()
var aptList = [Int]()
var visited = [(Int,Int)]()

for _ in 0..<N {
    graph.append(Array(readLine()!).map{Int(String($0))!})
}

func bfs(_ r: Int, _ c:Int) -> Int{
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]

    var needVisit = [(r,c)]
    graph[r][c] = 0
    visited.append((r,c))
    var cnt = 1

    while !needVisit.isEmpty {
        let node = needVisit.removeFirst()

        for i in 0..<4 {
            let (nx,ny) = (node.0 + dx[i], node.1 + dy[i])
            if (0..<N).contains(nx) && (0..<N).contains(ny) && graph[nx][ny] == 1 {
                cnt += 1
                graph[nx][ny] = 0
                visited.append((nx,ny))
                needVisit.append((nx,ny))
            }
        }
    }
    return cnt
}

let last = visited.last ?? (0,0)

for i in last.0..<N {
    for j in last.1..<N {
        if graph[i][j] == 1 && !visited.contains(where: {$0 == (i,j)}) {
            aptList.append(bfs(i, j))
        }
    }
}

print(aptList.count)
aptList.sorted().forEach {
    print($0)
}

