/*
 연산
 - 문자열에 A추가
 - 문자열의 뒤에 B 추가하고 뒤집기
 */

let S = Array(readLine()!).map{String($0)}
let T = Array(readLine()!).map{String($0)}

var answer = 0
func backTracking(_ str: [String]) {
    if S.count == str.count {
        if S == str {
            answer = 1
        }
        return
    }
    
    if str.first == "B" {
        var temp = str
        temp.reverse()
        temp.removeLast()
        backTracking(temp)
    }
    
    if str.last == "A" {
        var temp = str
        temp.removeLast()
        backTracking(temp)
    }
}

backTracking(T)
print(answer)
