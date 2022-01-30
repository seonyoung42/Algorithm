import Foundation

// N/2명으로 사람 나누기
// 능력치 -> i번째 와 j번째 사람이 함께 => s[i][j] + s[j][i]
// s[i][j] != s[j][i]
// 두 팀의 능력치 차이의 최솟값 출력하기 -> 할 말 한듯 S2
// N 모르니까 => 재귀
// 사람배치 ex 6명 => 1,2,3 -4,5,6/ 2,5,6 - 1,3,4 / visited로 방문안한애들꺼 합치기

let N = Int(readLine()!)!

var nArray = [[Int]]()

for _ in 0..<N {
    let a = readLine()!.split(separator: " ").map {Int(String($0))!}
    nArray.append(a)
}

var result = Int.max
var sumArray = [Int]()
var sum = 0
var nonSum = 0
var visited = Array(repeating: false, count: N)


func recur(_ count: Int, _ start: Int) {
    if count == N/2 {
        // !visited 더하기
        // 최솟값 비교
        var a = [Int]()

        for i in 0..<N {
            if !visited[i] {
                a.append(i)
            }
        }
        for i in sumArray {
            for j in sumArray {
                sum += nArray[i][j]
            }
        }
        
        
        for i in a {
            for j in a {
                nonSum += nArray[i][j]
            }
        }

        result = min(result, abs(sum - nonSum))

        nonSum = 0
        sum = 0
        return
    }
    
    for i in start..<N {
        if !visited[i] {
            visited[i] = true
            sumArray.append(i)
            recur(count+1, i+1)
            
            visited[i] = false
            sumArray.removeLast()
        }
    }
}

recur(0, 0)
print(result)

