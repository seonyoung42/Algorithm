import Foundation

let line = readLine()!
var charArray = Array(repeating: -1, count: 26)

for i in 0..<line.count {
    let index = line.index(line.startIndex, offsetBy: i)
    
    if charArray[Int(line[index].asciiValue!)-97] == -1 {
        charArray[Int(line[index].asciiValue!)-97] = i
    }
    
}

print(charArray.map{String($0)}.joined(separator: " "))
