import Foundation

let firstLine = readLine() ?? ""
let secondLine = readLine() ?? ""
let firstArray = firstLine.components(separatedBy: " ")
//let secondArray = secondLine.components(separatedBy: " ")
//
//let num = Int(firstArray[0])
//let limit = Int(firstArray[1])

let num = 10
let limit = 500
let secondArray = [93,181,245,214,315,36,185,138,216,295]

var result : Array<Int> = Array<Int>()
var sum = 0


for i in 0..<secondArray.count {
    for j in i+1..<(secondArray.count) {
        for k in j+1..<(secondArray.count) {
            
            let a = Int(secondArray[i])
            let b = Int(secondArray[j])
            let c = Int(secondArray[k])
            
            sum = a + b + c
            if sum <= limit {
                result.append(a+b+c)

            }
        }
    }

}

print(result.max()!)

//let a = result.sorted { $0 > $1 }
//
//for i in 0..<a.count {
//    if a[i] <= limit! {
//        print(a[i])
//        break
//    }
//}

