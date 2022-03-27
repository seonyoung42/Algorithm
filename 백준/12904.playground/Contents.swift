/*
 입력받은 S -> T로 만들기
 바꾸기 위해 가능한 연산
 1) 문자열의 뒤에 A를 추가한다
 2) 문자열을 뒤집고 뒤에 B를 추가한다.

 -> 거꾸로 생각하기
 
 */
import Foundation

var S = readLine()!.map{String($0)}
var T = readLine()!.map{String($0)}

while true {
    if T.count <= S.count {
        break
    }
    
    if T.popLast()! == "B" {
        T.reverse()
    }
}

T == S ? print(1) : print(0)
