import Foundation

// 부등호 < > -> arr[0] < arr[1], arr[1] > arr[2]
// 부등호를 넣는 배열 -> arr[i] == "<"이면 num[i] < num[i+1]
// 정수 개수 k개 -> 매번 바뀜 -> 재귀
// [k+1개] 배열 만든 뒤에 -> 부등호 배열 조건 만족하는지 확인하기 -> 시간초과
// => 배열에 숫자 넣을 때마다 부등호 만족하는지 확인/ 불만족 -> continue

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{String($0)}

var visited = Array(repeating: false, count: N)
var nArray = [String]()
var results = [Int]()

func recur(_ num: Int) {
    if num == (N+1) {
        let result = nArray.joined(separator: "")
        results.append(Int(result)!)
        return
    }
    
    for i in 0...9 {
        if !nArray.contains(String(i)) {
            if !nArray.isEmpty {
                let a = nArray.count - 1
                if arr[a] == "<" {
                    if Int(nArray.last!)! > i {
                        continue
                    }
                } else if arr[a] == ">" {
                    if Int(nArray.last!)! < i {
                        continue
                    }
                }
            }
            
            nArray.append(String(i))
            recur(num + 1)
            
            nArray.removeLast()
        }
    }
}

recur(0)
let a = results.max()!
let b = results.min()!

a < Int(pow(10.0, Double(N))) ? print("0\(a)") : print(a)
b < Int(pow(10.0, Double(N))) ? print("0\(b)") : print(b)

