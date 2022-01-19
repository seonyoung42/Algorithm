import Foundation

let n = Int(readLine()!)!

var result = [String]()
var printResult = ""

recur()

func recur() {
    if result.count == n {
        printResult += result.joined(separator: " ")
        printResult += "\n"
        return
    }
    
    for i in 1...n {
        if !result.contains(String(i)) {
            result.append(String(i))
            recur()
            result.removeLast()
        }
    }
}

print(printResult)
