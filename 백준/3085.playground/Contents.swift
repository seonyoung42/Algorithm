import Foundation

let N = Int(readLine()!)!
var nArray : [[Character]] = Array(repeating: Array(repeating: "A", count: 51), count: 51)

for i in 0..<N {
    nArray[i] = Array(readLine()!)
}

var result = 0

for i in 0..<N {
    for j in 0..<N-1 {
        nArray[i].swapAt(j, j+1)
        horizontalCount()
        verticalCount()
        nArray[i].swapAt(j, j+1)
        
        var temp: Character = "a"
        temp = nArray[j][i]
        nArray[j][i] = nArray[j+1][i]
        nArray[j+1][i] = temp

        horizontalCount()
        verticalCount()
        
        temp = nArray[j][i]
        nArray[j][i] = nArray[j+1][i]
        nArray[j+1][i] = temp
    }
}

func horizontalCount() {
    for i in 0..<N {
        var count = 1
        for j in 0..<N-1 {
            if nArray[i][j] == nArray[i][j+1] {
                count += 1
            } else {
                result = max(result, count)
                count = 1
            }
        }
        result = max(result, count)
    }
}

func verticalCount() {
    for i in 0..<N {
        var count = 1
        for j in 0..<N-1 {
            if nArray[j][i] == nArray[j+1][i] {
                count += 1
            } else {
                result = max(result, count)
                count = 1
            }
        }
        result = max(result, count)
    }
}

print(result)


