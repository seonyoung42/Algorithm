import Foundation

let line = readLine()!.map({String($0)})
//let line = "(((()(()()))(())()))(()())"
var stack = 0
var count = 0

for i in 0..<line.count {
    if line[i] == "(" {
        stack += 1
    } else {
        stack -= 1
        if line[i-1] == "(" {
            count += stack
        } else {
            count += 1
        }
    }
}

print(count)


// > 첫 번째 풀이
//let line = readLine()!.map{String($0)}
//var answer = 0
//var stack = 0
//var i = 0
//
//while i < line.count {
//
//    if i<line.count-1, line[i] == "(", line[i+1] == ")" {
//        answer += stack
//        i += 2
//    } else {
//        if line[i] == ")" {
//            answer += 1
//            stack -= 1
//        } else {
//            stack += 1
//        }
//        i += 1
//    }
//}
//
//print(answer)




