/*
 N개의 수로 이루어진 수열,
 수와 수 사이에 끼워넣을 수 있는 N-1개의 연산자
 
 */
import Foundation

let N = Int(readLine()!)!

let numArr = readLine()!.split(separator: " ").map {Int(String($0))!}
// + - x /
let opArr = readLine()!.split(separator: " ").map{Int(String($0))!}

//let N = 6
//let numArr = [1,2,3,4,5,6]
//var opArr = [2,1,1,1]

var maxValue = Int.min
var minValue = Int.max
var visited = Array(repeating: 0, count: opArr.count)

func bfs(_ start: Int, _ idx: Int) {
    if idx == (numArr.count-1) {
        maxValue = max(maxValue, start)
        minValue = min(minValue, start)

        return
    }
    
    for i in 0..<opArr.count {
        if opArr[i] != 0 && opArr[i] > visited[i] {
            if i == 0 {
                visited[i] += 1
                bfs(start+numArr[idx+1],idx+1)
                visited[i] -= 1
            } else if i == 1 {
                visited[i] += 1
                bfs(start-numArr[idx+1],idx+1)
                visited[i] -= 1
            } else if i == 2 {
                visited[i] += 1
                bfs(start*numArr[idx+1],idx+1)
                visited[i] -= 1
            } else if i == 3 {
                visited[i] += 1
                bfs(start/numArr[idx+1],idx+1)
                visited[i] -= 1
            }
            
        }
    }
}

bfs(numArr[0], 0)
print(maxValue)
print(minValue)
