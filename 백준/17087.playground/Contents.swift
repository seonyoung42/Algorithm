import Foundation

let first = readLine()!.split(separator: " ").map { Int(String($0))!}
let second = readLine()!.split(separator: " ").map { Int(String($0))!}

let numOfbrother = first[0]
let subin = first[1]
var distance = [Int]()
var gcd = [Int]()

func getGCD(_ num1:Int, _ num2: Int) -> Int {
    var max = num1
    var min = num2
    var r = max%min
    
    while r>0 {
        max = min
        min = r
        r = max%min
    }
    
    return min
}

for i in 0..<numOfbrother {
    distance.append(abs(subin - second[i]))
}

distance.sort { $0>$1 }

if distance.count < 2 {
    print(distance.min()!)
} else {
    var tempGCD = getGCD(distance[0],distance[1])
    
    for i in 2..<distance.count {
        tempGCD = getGCD(tempGCD, distance[i])
    }
    
    print(tempGCD)
}


