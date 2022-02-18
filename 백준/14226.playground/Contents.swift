/**
S개의 이모티콘을 보내려고 한다
이미 화면에 이모티콘 1개가 있다 ui= 1, clip = 0
 - 화면에 있는 이모티콘 전부를 클립보드에 저장  ui = ui, clip = ui
 - 클립보드의 모든 이모티콘 화면에 붙여넣기      ui = ui + clip, clip = cilp
 - 화면에 있는 이모티콘 중 하나 삭제                 ui = ui - 1, clip = 0
 세 가지 연산을 하여 가장빠르게 S개의 이모티콘 화면에 만들기

 bfs로
 */
import Foundation

let S = Int(readLine()!)!
var count = 0
var needToVisit = [(Int,Int)]()
var check = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
var mode = false

func bfs(ui:Int,clipBoard: Int) {
    needToVisit.append((ui,clipBoard))
    check[ui][clipBoard] = true
    
    while true {
        for _ in 0..<needToVisit.count {
            let current = needToVisit.removeFirst()
            if current.0 == S {
                mode = true
                break
            }
            
            for i in [(-1,0), (0,(current.0 - current.1)), (current.1,0)] {
                let a = current.0 + i.0
                let b = current.1 + i.1
                                
                if 0...1000 ~= a && 0...1000 ~= b && !check[a][b] {
                    check[a][b] = true
                    needToVisit.append((a,b))
                }
            }
        }
        if mode == true {
            break
        }
        count += 1
    }
}

bfs(ui: 1, clipBoard: 0)
print(count)
