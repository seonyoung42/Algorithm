import Foundation

let n = Int(readLine()!)!
var tree = Array(repeating: [(Int,Int)](), count: n+1)

for _ in 0..<(n-1) {
    let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
    tree[arr[0]].append((arr[1],arr[2]))
    tree[arr[1]].append((arr[0],arr[2]))
}

func dfs(_ root:Int, _ depth: Int) {
    visited[root] = true
    
    if maxDepth < depth {
        maxDepth = depth
        lastNode = root
    }
    
    for i in tree[root] {
        if !visited[i.0] {
            dfs(i.0, depth+i.1)
        }
    }
}

var maxDepth = 0
var lastNode = 0
var visited = Array(repeating: false, count: n+1)
dfs(1, 0)

maxDepth = 0
visited = Array(repeating: false, count: n+1)
dfs(lastNode, 0)
print(maxDepth)
