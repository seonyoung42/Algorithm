import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = line[0]
let M = line[1]
let V = line[2]

var graph : [[Int]] = Array(repeating: [], count: N+1)
var check = Array(repeating: false, count: N+1)
var result = ""

for _ in 0..<M {
    let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = relation[0]
    let b = relation[1]
    graph[a].append(b)
    graph[b].append(a)
    graph[a].sort()
    graph[b].sort()
}

func dfs(_ now:Int) {
    check[now] = true
    result += "\(now) "
    for i in graph[now] {
        if !check[i] {
            dfs(i)
        }
    }
}

func bfs(_ now: Int) {
    var queue = [now]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        if !check[node] {
            check[node] = true
            result += "\(node) "
            queue.append(contentsOf: graph[node].sorted())
        }
    }
}

dfs(V)
print(result)
result = ""
check = Array(repeating: false, count: N+1)
bfs(V)
print(result)


