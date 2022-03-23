import Foundation

let line = readLine()!.split(separator: " ").map {Int(String($0))!}
let N = line[0]
let M = line[1]
var A = [[Int]]()
var B = [[Int]]()

for _ in 0..<N {
    let arr = Array(readLine()!.map {Int(String($0))!})
    A.append(arr)
}

for _ in 0..<N {
    let arr = Array(readLine()!.map {Int(String($0))!})
    B.append(arr)
}

var count = 0
func getMinCount() {
    if M < 3 || N < 3 { return }
    
    for i in 0..<(N-2) {
        for j in 0..<(M-2) {
            if A[i][j] != B[i][j] {
                for k in i...i+2 {
                    for q in j...j+2 {
                        A[k][q] = A[k][q] == 0 ? 1 : 0
                    }
                }
                count += 1
            }
        }
    }
}

getMinCount()
A == B ? print(count) : print(-1)
