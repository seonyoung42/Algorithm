import Foundation

var nArray = Array(repeating: 0, count: 9)
for i in 0..<9 {
    let a = Int(readLine()!)!
    nArray[i] = a
}

var sum = nArray.reduce(0, {$0 + $1})
nArray.sort()
var result = 0

outerLoop: for i in 0..<nArray.count-1 {
    for j in i+1..<nArray.count {
        result = sum - (nArray[i] + nArray[j])
        
        if result == 100 {
            for k in 0..<nArray.count {
                if k != i && k != j {
                    print(nArray[k])
                }
            }
            
            break outerLoop
        }
    }
}

