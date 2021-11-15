import Foundation

let testCase = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}

var count = 0

// > 에라토스테네스의 체 이용한 풀이
var num = 1000
var numArray = Array(repeating: 0, count: num + 1)


for i in 2...num {
    numArray[i] = i
}

for i in 2...num {
    if numArray[i] == 0 {
        continue
    }
    
    for j in stride(from: i+i, through: num, by: i) {
        numArray[j] = 0;
    }
}

for i in nums {

    if numArray.contains(i) {
        count += 1
    }
}
print(count)


// > 일반 소수 판별 풀이
//
//for i in nums {
//
//    if i == 1 {
//        count += 1
//        continue
//    }
//
//    for j in 2..<i {
//        if i%j == 0 {
//            count += 1
//            break
//        }
//    }
//}
//
//print(nums.count - count)
