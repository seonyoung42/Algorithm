import Foundation

let line = readLine()!.split(separator: " ").map {Int(String($0))!}
let N = line[0]
let M = line[1]

var graph : [[Int]] = Array(repeating: [], count: N+1)

for _ in 0..<M {
    let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = arr[0]
    let b = arr[1]
    graph[a].append(b)
    graph[b].append(a)
}

var result = ""
var check : [Bool] = Array(repeating: false, count: N+1)
var count = 0

func dfs(_ now: Int) {
    check[now] = true
    for i in graph[now] {
        if !check[i] {
            dfs(i)
        }
    }
}

for i in 1...N {
    if !check[i] {
        count += 1
        dfs(i)
    }
}

print(count)
