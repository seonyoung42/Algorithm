import Foundation

var num = Int(readLine()!)!
//var num = 9991

var numArray = Array(repeating: true, count: num+1)

for i in 2..<numArray.count {
    
    if numArray[i] == false {
        continue
    }
    
    for j in stride(from: i+i, to: numArray.count, by: i) {
        numArray[j] = false
    }
}

for i in 2..<numArray.count {
    if numArray[i] {
        while true {
            if num%i == 0 {
                print(i)
                num = num/i
            } else {
                break
            }
        }
    }
}


