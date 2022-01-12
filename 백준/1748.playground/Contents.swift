import Foundation
var N = Int(readLine()!)!

if N < 10 {
    print(N)
} else {
    print(getNum())
}

func getNum() -> Int {
    var count = 0
    var num = N
    var a = 0
    var sum = 0
    
    while num > 0 {
        num /= 10
        count += 1
    }
    
    while a != count {
        sum += 9*Int(pow(10.0, Double(a-1)))*a
        a += 1
    }
    
    sum += (N - Int(pow(10.0, Double(count-1)))+1)*count
    return sum
}


