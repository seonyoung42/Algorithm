import Foundation

let num = Int(readLine()!)!
var numArray = [(age: Int, name: String)]()

for _ in 0..<num {
    let relation = readLine()?.split(separator: " ")
    let a = Int(relation![0])!
    let b = String(relation![1])

    numArray.append((age: a,name: b))
}

numArray.sort(by: {$0.age < $1.age})

//for i in 0..<numArray.count {
//    print("\(numArray[i].age) \(numArray[i].name)")
//}

for num in numArray {
    print("\(num.age) \(num.name)")
}
