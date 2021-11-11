import Foundation

let line = readLine()!
var opStack = ""

for char in line {
    
    if char == "(" {
        
        opStack.append(char)
    } else if char == ")" {
        
        while !opStack.isEmpty && opStack.last != "(" {
            print(opStack.removeLast(),terminator: "")

        }
        opStack.removeLast()
        
    } else if (char == "*" || char == "/") {
        while !opStack.isEmpty && (opStack.last == "*" || opStack.last == "/") {
            print(opStack.removeLast(),terminator: "")

        }
        opStack.append(char)
        
    } else if (char == "+" || char == "-") {
        while !opStack.isEmpty && opStack.last != "(" {
            print(opStack.removeLast(),terminator: "")
        }
        opStack.append(char)
    } else {
        print(char,terminator: "")
        
    }
    
}

while !opStack.isEmpty {
    print(opStack.removeLast(),terminator: "")
}

