/*
 수에 연산자를 하나씩 넣어서 그 값이 최대인 것과 최소인 것을 구하시오
 
 bfs로 수 사이에 연산자 하나씩 넣어보기
 */
import Foundation

let N = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}
let operArr = readLine()!.split(separator: " ").map{Int(String($0))!}

var maxValue = Int.min
var minValue = Int.max

func getValue(_ index:Int, _ value: Int, _ add:Int, _ minus: Int, _ muliply:Int, _ divide:Int) {
        
    if index == numArr.count-1 {
        maxValue = max(maxValue, value)
        minValue = min(minValue, value)
        return
    }
    
    for i in 0..<operArr.count {
        if i == 0 && operArr[i] > add {
            getValue(index+1, value + numArr[index+1], add+1, minus, muliply, divide)
        } else if i == 1 && operArr[i] > minus {
            getValue(index+1, value - numArr[index+1], add, minus+1, muliply, divide)
        }  else if i == 2 && operArr[i] > muliply {
            getValue(index+1, value * numArr[index+1], add, minus, muliply+1, divide)
        }  else if i == 3 && operArr[i] > divide {
            getValue(index+1, value / numArr[index+1], add, minus, muliply, divide+1)
        }
    }
}

getValue(0, numArr[0],0,0,0,0)
print(maxValue)
print(minValue)
