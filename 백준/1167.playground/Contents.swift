/*
 트리 정점의 개수 V
 각 트리들의 간선 정보 주어짐, 마지막은 -1
 지름 -> 가장 하위 노드 중 길이(깊이)가 가장 긴 두 개의 합
 */

import Foundation

let V = Int(readLine()!)!
var tree = Array(repeating: [(Int,Int)](), count: V+1)

for _ in 1...V {
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var idx = 1

    while true {
        if arr[idx] == -1 { break }
        tree[arr[0]].append((arr[idx],arr[idx+1]))
        idx += 2
    }
}

var visited = Array(repeating: false, count: V+1)
var depth = 0
var answer = 0
var endNode = 0

func dfs(_ node: Int, _ length: Int) {
    visited[node] = true
    
    if answer < length {
        answer = length
        endNode = node
    }
    
    for i in tree[node] {
        if !visited[i.0] {
            dfs(i.0, length+i.1)
        }
    }
}

dfs(1, 0)
answer = 0
visited = Array(repeating: false, count: V+1)
dfs(endNode, 0)

print(answer)

