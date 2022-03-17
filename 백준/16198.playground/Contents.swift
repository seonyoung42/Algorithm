/*
 N개의 에너지 구슬
 첫번째, 마지막 은 불가
 n= 4, [1,2,3,4]
 예) x = 2, w(1) * w(3) = 1 * 3 = 3
 n= 3, [1,3,4]
 w(1) *w(3) = 1 * 4.  4
 ==> 3+ 4 = 7
 
 x = 3, w(2) * w(4) = 2 * 4 = 8
 n= 3, [1,2,4]
 x = 2, 1*4 = 4
 ==> 4 + 8 => 12
 
 모을 수 있는 에너지 양의 최댓값 => 12
 
=> 백트래킹
 
 */

import Foundation

var N = Int(readLine()!)!
var W = readLine()!.split(separator: " ").map{Int(String($0))!}

var energy = 0
var maxEnergy = Int.min

func getMaxEnergy(_ energy: Int) {
    if N == 2 {
        maxEnergy = max(maxEnergy, energy)
        return
    }
    
    for i in 1..<N-1 {
        let add = W[i-1]*W[i+1]
        let temp = W[i]
        
        W.remove(at: i)
        N -= 1
        getMaxEnergy(energy + add)
        W.insert(temp, at: i)
        N += 1
    }
}

getMaxEnergy(0)
print(maxEnergy)
