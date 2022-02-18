/*
 N = K 가 될때까지 걸리는 시간
 - N = N -1 (1초)
 - N = N + 1 (1초)
 - N = 2N (0초 ,, 멍미?) (튜플로 하면 될듯 (N, 시간)
 */

import Foundation

//let location = readLine()!.split(separator: " ").map{Int(String($0))!}
let location = [4,6]
let start = location[0]
let destination = location[1]

var needToVisit = [(Int,Int)]()
var count = 0
var check = Array(repeating: false, count: 100001)
var mode = false

func bfs(_ start: Int) {
    needToVisit.append((start,0))
    check[start] = true
    
    while true {
        if mode {
            break
        }
        
        count += 1
        for _ in 0..<needToVisit.count {
            let node = needToVisit.removeFirst()
            print(node)
            if node.0 == destination {
                mode = true
                print(node)
                print(count - node.1 - 1)
                break
            }
            
            for i in [(node.0,1), (-1,0), (1,0)] {
                let nx = node.0 + i.0
                let ny = node.1 + i.1
                
                if 0...100000 ~= nx && !check[nx]{
                    check[nx] = true
                    needToVisit.append((nx,ny))
                }
            }
        }
    }
}

bfs(start)
