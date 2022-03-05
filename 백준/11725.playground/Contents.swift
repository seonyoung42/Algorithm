/*
 루트 없는 트리가 주어지고, 트리의 루트를 1이라고 할 때 각 노드의 부모 구하기
 루트 = 1
 노드의 개수 N = 7일 때
 N-1개의 줄에
 트리상에서 연결된 두 정점
 
 각 노트의 부모 노드 번호를 2번노드부터 순서대로 출력하기
 두 정점을 받아서 이중 배열에 넣기 ex) 1,6이면 arr[1]= [6], arr[6] = [1]
 */
import Foundation

//let N = Int(readLine()!)!
let N = 7
let maxValue = 8
var tree = Array(repeating: [Int](), count: maxValue)
var visited = Array(repeating: false, count: N+1)
var rootNode = Array(repeating: [Int](), count: N+1)

for _ in 1..<N {
    let line = readLine()!.split(separator: " ").map {Int(String($0))!}
    tree[line[0]].append(line[1])
    tree[line[1]].append(line[0])
}


func dfs(_ root: Int) {
    var needToVisit = [root]
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()
        visited[node] = true
        
        for i in tree[node] {
            if !visited[i] {
                needToVisit.append(i)
                rootNode[i].append(node)
            }
        }
    }
}
dfs(1)

for i in 2...N {
    print(rootNode[i][0])
}
