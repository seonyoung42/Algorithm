import Foundation

var num = Array(readLine()!)
var result = num.sorted()
result.reverse()

for i in result {
    print(i, separator: "", terminator: "")
}

// > 또는 result.reverse() 를 하지 않고

//for i in result.reversed() {
//    print(i,terminator:"")
//}

// > 이렇게 해줘도 결과 같음
