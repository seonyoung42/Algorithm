
import Foundation

let N = Int(readLine()!)!
let lines = readLine()!.split(separator: " ").map{Int(String($0))!}

let start = (lines[0], lines[1])
let destination = (lines[2], lines[3])

var visited : [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
var count = 0
var flag = false
func getMinCount(_ start: (Int,Int)) {
    var needToVisit = [start]
    
    while !needToVisit.isEmpty {
        for _ in 0..<needToVisit.count {
            let node = needToVisit.removeFirst()
            
            if node == destination {
                needToVisit = []
                flag = true
                break
            }
            
            for j in [(-2,-1), (-2,+1), (0,-2), (0,+2), (+2,-1), (+2,+1)] {
                let move = (node.0 + j.0, node.1 + j.1)
                
                if 0..<N ~= move.0 && 0..<N ~= move.1 {
                    if !visited[move.0][move.1] {
                        visited[move.0][move.1] = true
                        needToVisit.append(move)
                    }
                }
        
            }
        }
        count += 1
    }
    
}

visited[start.0][start.1] = true
getMinCount(start)
flag ? print(count-1) : print(-1)
