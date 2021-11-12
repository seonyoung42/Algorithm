import Foundation

var line = readLine()!
//var line = "baekjoon"
var array = [String]()

for _ in 0..<line.count {
    array.append(line)
    line.removeFirst()
}

array.sorted().forEach { print($0) }
