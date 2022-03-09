import Foundation

let line = readLine()!.split(separator: " ").map {Int(String($0))!}
let N = line[0]
let S = line[1]

let numArr = readLine()!.split(separator: " ").map{Int(String($0))!}

func countValue(_ start: Int, _ sum: Int, _ depth: Int) -> Int {
    var count = 0
    
    if sum == S && depth > 0 {
        count += 1
    }
    
    for i in start..<numArr.count {
        count += countValue(i+1, sum + numArr[i], depth+1)
    }
    return count
}


print(countValue(0, 0, 0))
