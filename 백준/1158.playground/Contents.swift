import Foundation

// > 나머지 값 이용한 풀이
let line = readLine()!.split(separator: " ").map { Int(String($0))!}

let N = line[0]
var K = line[1]

var array = Array(1...N)
var count = K-1

print("<",terminator: "")
while array.count != 1 {
    
    if count >= array.count {
        count %= array.count
    }
    
    let target = array.remove(at: count)
    print("\(target), ",terminator: "")
    count += (K-1)
}

print("\(array[0])>")



// > 기존 풀이(이거도 통과됨)
import Foundation


let line = readLine()!.split(separator: " ").map { Int(String($0))!}

let N = line[0]
var K = line[1]

var array = Array(1...N)
var setNum = [Int]()
var count = K

while !array.isEmpty {

    if count <= array.count {
        setNum.append(array[count-1])
        array.remove(at: count-1)
         count = count + K - 1
    } else {
        count -= array.count
    }
}

print("<" + setNum.map({String($0)}).joined(separator: ", ") + ">")
