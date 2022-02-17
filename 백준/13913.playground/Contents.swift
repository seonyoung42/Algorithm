/**
 N 은
 - N-1, N+1, N*2 로 움직일 수 있는데
 N == K가 될 때까지 움직이는 시간과 그 이동 루트를 출력하라 
 */

import Foundation

let location = readLine()!.split(separator: " ").map {Int(String($0))!}
let start = location[0]
let destination = location[1]
var queue = [Int]()
var time = 0
var check = Array(repeating: false, count: 100001)
var footPrints = Array(repeating: -1, count: 100001)
var result = [Int]()

func bfs(_ start:Int) {
    queue.append(start)
    check[start] = true
    
    while !check[destination] {
        time += 1
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            
            for i in [node+1, node-1, node*2] {
                if 0...100000 ~= i && !check[i]{
                    queue.append(i)
                    footPrints[i] = node
                    check[i] = true
                }
            }
        }
    }
    print(time)
}

bfs(start)
var prior = footPrints[destination]
result.append(destination)
while prior != -1 {
    result.append(prior)
    prior = footPrints[prior]
}

result.reverse()
print(result.map{String($0)}.joined(separator: " "))
