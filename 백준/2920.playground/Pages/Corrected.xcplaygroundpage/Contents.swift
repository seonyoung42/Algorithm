import Foundation

let line = readLine() ?? ""
let array = line.components(separatedBy: " ")
//let array = [1,2,3,4,5,6,7,8]

var ascending = true
var descending = true

for i in 1..<array.count {
    let a = Int(array[i])
    let b = Int(array[i-1])
    
    if a! > b! {
        descending = false
    } else if a! < b! {
        ascending = false
    }
}

if ascending {
    print("ascending")
} else if descending {
    print("descending")
} else {
    print("mixed")
}


