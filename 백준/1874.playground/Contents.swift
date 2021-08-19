import Foundation

// 스택에서 핵심 : 삽입할 때는 특정 수에 도달할 떄까지 삽입
// 빼낼 때는 내림차순을 유지할 수 있는지 확인

let firstLine = readLine() ?? ""
let num = Int(firstLine) ?? 0
var array : Array<Int> = Array<Int>()
var result: Array<String> = Array<String>()
var stack : Array<Int> = Array<Int>()
var printOrNot = true
var count = 1

for _ in 1...num {
    let numbers = readLine() ?? ""
    let item = Int(numbers) ?? 0
    array.append(item)
}

for i in 0..<array.count {
    
    while count <= array[i] {
        result.append("+")
        stack.append(count)
        count += 1
    }
    
    if stack[stack.count-1] == array[i] {
        result.append("-")
        stack.remove(at: stack.count-1)
    } else {
        printOrNot = false
        break
    }
}


if printOrNot {
    for i in 0..<result.count {
        print(result[i])
    }
} else {
    print("NO")
}

