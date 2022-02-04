// N명, 번호는 0부터 N-1까지, 친구관계 수 M
// 0 1 -> 0과 1이 친구,
// 0 -> 1 -> 2 -> 3 -> 0 , 1 -> 4 => 한 붓 그리기 가능
// 한붓그리기 => DFS 깊이우선, 깊이우선 탐색의 수가 4이면 1, 아니면 0


import Foundation
let line = readLine()!.split(separator: " ").map { Int(String($0))!}
var friendGraph: [[Int]] = [[Int]](repeating: [], count: line[0])

for _ in 0..<line[1] {
    let relation = readLine()!.split(separator: " ").map {Int(String($0))!}
    friendGraph[relation[0]].append(relation[1])
    friendGraph[relation[1]].append(relation[0])
}

var check: [Bool] = [Bool](repeating: false, count: line[0])
var isAvailable:Bool = false

func dfs(_ now: Int, _ level: Int) {
    if level == 4 {
        isAvailable = true
        return
    }
    check[now] = true
    for i in 0..<friendGraph[now].count {
        let friend = friendGraph[now][i]
        if !check[friend] {
            dfs(friend,level+1)
        }
    }
    check[now] = false
}


for i in 0..<line[0] {
    dfs(i, 0)
    if isAvailable {
        break
    }
}

if isAvailable {
    print(1)
} else {
    print(0)
}
