import Foundation

// N명을 두 팀으로 나눔, 팀원은 한 명 이상
// N 모름 -> 재귀
// count -> 1부터 N/2 까지
// start를 매개변수로 넣어서 더 큰 수만 사용할 수 있게끔
// 능력치의 합의 최소값
//

let N = Int(readLine()!)!
var nArray = [[Int]]()

for _ in 0..<N {
    let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
    nArray.append(arr)
}

var sumArray = [Int]()
var visited = Array(repeating: false, count: N)
var result = Int.max

func recur(_ count: Int, _ start: Int, _ num: Int) {
    
    if num == count {
        
        var a = Array(0...(N-1))
        a = a.filter{!sumArray.contains($0)}
        
        var sum = 0
        var nonSum = 0
        
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
        
        return
    }
    
    for i in start..<N {
        if !visited[i] {
            visited[i] = true
            sumArray.append(i)
            
            recur(count, i + 1, num + 1)
            visited[i] = false
            sumArray.removeLast()
        }
    }
}


for i in 1...(N/2+1) {
    recur(i, 0, 0)
}

print(result)

