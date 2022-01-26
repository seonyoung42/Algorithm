import Foundation

let nums = readLine()!.split(separator: " ").map { Int(String($0))!}
let L = nums[0]
let C = nums[1]
var characters = readLine()!.split(separator: " ").map {String($0)}
characters.sort()

let vowels = ["a","e","i","o","u"]
var result = [String]()
var mode = 0
var printResult = ""

func recur(_ count: Int, _ start: Int) {
    if count == L && mode != 0 && (L - mode) > 1 {
        printResult += result.joined(separator: "")
        printResult += "\n"
        return
    }

    for i in start..<C {
        if !result.contains(String(characters[i])) {
            result.append(String(characters[i]))
            
            if vowels.contains(characters[i]) {
                mode += 1
            }
            
            recur(count+1,i+1)
            
            if vowels.contains(result.popLast() ?? "0") {
                mode -= 1
            }
        }
    }
}

recur(0,0)
print(printResult)
