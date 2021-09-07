import Foundation

let firstLine = readLine()!.split(separator: " ")
var N = Int(firstLine[0])!
var r = Int(firstLine[1])!
var c = Int(firstLine[2])!
var result = 0

while N != 0 {
    N -= 1
    
    let powered = pow(2.0, Double(N))
    
    if r < Int(powered) && c < Int(powered) {
        result += Int(powered*powered)*0
        
    } else if r < Int(powered) && c >= Int(powered) {
        result += Int(powered*powered)*1
        c -= Int(powered)
        
    } else if r >= Int(powered) && c < Int(powered) {
        result += Int(powered*powered)*2
        r -= Int(powered)
        
    } else if r >= Int(powered) && c >= Int(powered) {
        result += Int(powered*powered)*3
        r -= Int(powered)
        c -= Int(powered)
    }
}

print(result)
