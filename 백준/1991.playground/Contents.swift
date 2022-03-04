/*
 트리 순회
 - 전위 순회
 - 중위 순회
 - 후위 순회 : 왼쪽, 오른쪽, 노드
 의 결과를 각각 한 줄로 출력하라
 */

import Foundation

let N = Int(readLine()!)!
var trees = Array(repeating: Array(repeating: 0, count: 2), count: N)

for _ in 0..<N {
    let arr = readLine()!.split(separator: " ").map { Character(String($0)) }
    
    let node = Int(arr[0].asciiValue!) - 65
    if arr[1] != "." {
        trees[node][0] = Int(arr[1].asciiValue!) - 65
    } else {
        trees[node][0] = 0
    }
    if arr[2] != "." {
        trees[node][1] = Int(arr[2].asciiValue!) - 65
    } else {
        trees[node][1] = 0
    }
}

var preorderList = ""
var inorderList = ""
var postorderList = ""
var needToVisit = [Int]()

func preorder(_ start: Int) {
    needToVisit.append(start)
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()
        let char = String(UnicodeScalar(UInt8(node+65)))
        preorderList.append(char)

        for i in [0,1] {
            let child = trees[node][i]
            if child != 0 {
                preorder(child)
            }
        }
    }
}


func inorder(_ start: Int) {
    needToVisit.append(start)
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()
        var child = trees[node][0]
        
        if child != 0 {
            inorder(child)
        }
        
        let char = String(UnicodeScalar(UInt8(node+65)))
        inorderList.append(char)
        
        child = trees[node][1]
        
        if child != 0 {
            inorder(child)
        }
    }
}


func postorder(_ start: Int) {
    needToVisit.append(start)
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()
        
        for i in [0,1] {
            let child = trees[node][i]
            
            if child != 0 {
                postorder(child)
            }
        }
        
        let char = String(UnicodeScalar(UInt8(node+65)))
        postorderList.append(char)
    }
}

preorder(0)
inorder(0)
postorder(0)

print(preorderList)
print(inorderList)
print(postorderList)
