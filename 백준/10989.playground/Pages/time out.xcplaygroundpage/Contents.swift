// > 시간 초과
import Foundation

let num = Int(readLine()!)!
var numArray = [Int]()

for _ in 0..<num {
    let a = Int(readLine()!)!
    numArray.append(a)
}

//var numArray = [5,2,3,1,4,2,3,5,1,7]

numArray.sort()

numArray.forEach{ memeber in
    print(memeber)
}



