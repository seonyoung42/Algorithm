import Foundation

let numArray = readLine()!.split(separator: " ").map {String($0)}

print(Int(numArray[0]+numArray[1])! + Int(numArray[2]+numArray[3])!)
