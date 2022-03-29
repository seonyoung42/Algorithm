/*
 nxn행렬, 값은 -1,0,1 중 하나
 모두 같은 수라면, 그대로 사용하기
 그렇지 않으면, 같은 크기의 종이 9개로 자르기
 
 -1, 0, 1 로만 채워진 종이의 개수 구하기
 */

import Foundation

let N = Int(readLine()!)!
var matrix = [[Int]]()
var counts = [0,0,0]

for _ in 0..<N {
    matrix.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 행렬의 원소들이 모두 같은지 확인
func isAllSame(_ matrix: [[Int]]) -> Bool {
    let first = matrix[0][0]
    
    if matrix.allSatisfy({
        $0.allSatisfy { $0 == first}
    }) { return true }
    
    return false
}

// 해당 행렬의 가로가 3일 때
func addToCounts(_ matrix: [[Int]], counts: inout [Int]) {
    for i in matrix {
        for j in i {
            counts[j+1] += 1
        }
    }
}

func checkMatrix(_ currentMatrix: [[Int]], counts: inout [Int]) {
    let first = currentMatrix[0][0]
    
    if isAllSame(currentMatrix) {
        counts[first + 1] += 1
        return
    }
    
    if currentMatrix[0].count == 3 {
        addToCounts(currentMatrix, counts: &counts)
        return
    }
    
    let width = currentMatrix[0].count / 3
    for i in 0...2 {
        for j in 0...2 {
            let x = i * width
            let y = j * width
            
             var tempMatrix = [[Int]]()
             Array(currentMatrix[x..<x+width]).forEach{
                 tempMatrix.append(Array($0[y..<y+width]))
             }
            checkMatrix(tempMatrix, counts: &counts)
        }
    }
}

checkMatrix(matrix, counts: &counts)
counts.forEach {
    print($0)
}
