import Foundation

let channel = Int(readLine()!)!
let NumOfWrongButton = Int(readLine()!)!


var wrongButtons = [Int]()

if NumOfWrongButton == 0 {
    let a = String(channel).count
    let b = abs(100 - channel)
    a < b ? print(a) : print(b)
} else {
    wrongButtons = readLine()!.split(separator: " ").map { Int(String($0))! }
    getNum()
}

func getNum() {
    var buttons = Array(repeating: false, count: 10)
    for i in wrongButtons {
        buttons[i] = true
    }
    
    var max = -1
    var min = -1
    
    for i in (0...channel).reversed() {
        var mode = true
        var N = i
        
        while N >= 0 {
            if buttons[N % 10] {
                mode = false
                break
            } else {
                N = N / 10
            }
            if N == 0 {
                break
            }
        }
        
        if mode {
            max = i
            break
        }
    }
    
    for i in channel...1000000 {
        var mode = true
        var N = i
        while N >= 0 {
            if buttons[N % 10] {
                mode = false
                break
            } else {
                N = N / 10
            }
            if N == 0 {
                break
            }
        }
        
        if mode {
            min = i
            break
        }
    }
    
    if max == -1 {
        max = 1000000
    } else {
        max = channel - max + String(max).count
    }
    
    if min == -1 {
        min = 1000000
    } else {
        min = abs(channel - min) + String(min).count
    }
    
    let mid = abs(100-channel)
    
    print([max,min,mid].min()!)
}

