/**
 몇 번 이동해야 도착점에 도착할 수 있는가?
 단, 이동은 가로 2칸, 세로 1칸/ 또는 가로 1칸 세로 2칸/ 각각 -인 경우 도 -> 총 8가지 경우
 */

import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let N = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int(String($0))!}
    let destination = readLine()!.split(separator: " ").map { Int(String($0))!}

    var chess: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
    var count = 0
    var needToVisit = [[Int]]()

    bfs(start[0],start[1])

    func bfs(_ x:Int, _ y: Int) {
        needToVisit.append([x,y])
        let dx = [1,2,1,2,-1,-2,-2,-1]
        let dy = [2,1,-2,-1,-2,-1,1,2]
        while chess[destination[0]][destination[1]] != 1 {
            count += 1

            for _ in 0..<needToVisit.count {
                let node = needToVisit.removeFirst()

                 for i in 0..<dx.count {
                     let row = node[0] + dx[i]
                     let col = node[1] + dy[i]

                     if 0..<N ~= row && 0..<N ~= col && chess[row][col] == 0{
                         chess[row][col] = 1
                         needToVisit.append([row,col])
                     }
                 }
            }
        }
        print(count)
    }
}
