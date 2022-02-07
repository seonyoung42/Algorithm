// 이분 그래프 => 정점을 두 집합으로 나눌 때, 각 집합에 속한 정점끼리는 인접하지 않는 경우 yes
// 정점을 방문하면서 인접 정점을 다른 색으로 칠하기,,
// 인접한 정점의 색이 자신과 같은경우 이분그래프 x
import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let line = readLine()!.split(separator: " ").map {Int(String($0))!}
    let V = line[0]
    let E = line[1]
    
    var graph :[[Int]] = Array(repeating: [], count: V+1)
    var colors = Array(repeating: 0, count: 20001)
    var isBipartite = true

    for _ in 0..<E {
        let relate = readLine()!.split(separator: " ").map {Int(String($0))!}
        let a = relate[0]
        let b = relate[1]
        graph[a].append(b)
        graph[b].append(a)
    }
    
    for i in 1...V {
        if !isBipartite {
            break
        }
        if colors[i] == 0 {
            dfs(i, 1)
        }
    }
    
    func dfs(_ now: Int, _ color: Int) {
        colors[now] = color
        
        for i in graph[now] {
            if colors[i] == color {
                isBipartite = false
                return
            }
            if colors[i] == 0 {
                dfs(i, -color)
            }
        }
    }
    
    isBipartite ? print("YES") : print("NO")
}




