import Foundation

// 0...N-1일까지 일하기 => i번째 날에 기간 T를 더했을 때 최대값이 N
// if final >= N { result = max(sum, result) return }
// N값 매번 달라지므로 -> 재귀
// start값을 매개변수로 전달 0에서 시작
// i번째 날 + T가 N보다 크더라도 i+1번째날 + T(i+1)는 N보다 작을 수 있다
// i번째 날 + T가 N보다 크면 그 비용을 더하지 않고 재귀 -> 종료

let N = Int(readLine()!)!
var nArray = [[Int]]()

for _ in 0..<N {
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    nArray.append(a)
}


var result = 0
var sum = 0

func recur(_ start: Int) {
    if start >= N {
        result = max(result, sum)
        return
    }
    
    for i in start..<N {
        if i + nArray[i][0] <= N {
            sum += nArray[i][1]
        }
        
        recur(i + nArray[i][0])
        
        if i + nArray[i][0] <= N {
            sum -= nArray[i][1]
        }
    }
}

recur(0)
print(result)
