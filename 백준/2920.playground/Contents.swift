import UIKit

let line = readLine() ?? ""
let array = line.components(separatedBy: " ")

let a = [1,2,3,4,5,6,7,8]
let b = [8,7,6,5,4,3,2,1]
var countA = 0
var countB = 0

for i in 0..<array.count {
    let num = Int(array[i])
    if num == a[i] {
        countA += 1
    } else if num == b[i] {
        countB += 1
    }
}

if countA == 8 {
    print("ascending")
} else if countB == 8 {
    print("descending")
} else {
    print("mixed")
}

