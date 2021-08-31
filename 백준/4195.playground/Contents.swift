// 해시를 활용한 Union-Find(합집합 찾기) 알고리즘
// Union-Find 알고리즘 : 원소들의 연결 여부를 확인하는 알고리즘, 연결되었을 때 더 작은 원소를 부모로 삼도록 설정

import Foundation

let test = Int(readLine()!)!

for _ in 0..<test {
    let friends = Int(readLine()!)!
    var parent : [String: String] = [:]
    var number : [String : Int] = [:]
    
    func findParent(_ x: String) -> String {
        if parent[x] == x {
            return x
        } else {
            let topParent = findParent(parent[x]!)
            parent[x] = topParent
            return parent[x]!
        }
    }
    
    func union(_ x: String, _ y: String) -> Void {
        let parentX = findParent(x)
        let parentY = findParent(y)
        
        if parentX != parentY {
            parent[parentY] = parentX
            number[parentX]! += number[parentY]!
        }
        
    }
    
    for _ in 0..<friends {
        let line = readLine()!.split(separator: " ")
        let a = String(line[0])
        let b = String(line[1])
        
        if !parent.keys.contains(a) {
            parent[a] = a
            number[a] = 1
        }
        if !parent.keys.contains(b) {
            parent[b] = b
            number[b] = 1
        }
        
        union(a, b)
        print(number[findParent(a)]!)
    }
}

