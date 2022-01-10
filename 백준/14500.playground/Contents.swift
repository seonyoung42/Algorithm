import Foundation

let nums = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = nums[0]
let M = nums[1]

var nArray = [[Int]]()

for _ in 0..<N {
    let a = readLine()!.split(separator: " ").map { Int(String($0))!}
    nArray.append(a)
}


print([countFirst(),countSecond(),countThird(),countFourth(),countFifth()].max()!)

func countFirst() -> Int {
    var count = 0
    for i in 0..<N {
        for j in 0..<M-3 {
            let sum = nArray[i][j] + nArray[i][j+1] + nArray[i][j+2] + nArray[i][j+3]
            //let sum = nArray[i][j...j+3].reduce(0) { $0 + $1 }
            count = max(count, sum)
        }
    }
    
    for i in 0..<N-3 {
        for j in 0..<M {
            let sum = nArray[i][j] + nArray[i+1][j] + nArray[i+2][j] + nArray[i+3][j]
            count = max(count, sum)
        }
    }
    return count
}

func countSecond() -> Int {
    var count = 0
    for i in 0..<N-1 {
        for j in 0..<M-1 {
            let sum = nArray[i][j] + nArray[i][j+1] + nArray[i+1][j] + nArray[i+1][j+1]
            count = max(count, sum)
        }
    }
    return count
}

func countThird() -> Int {
    var count = 0
    
    // > 1
    for i in 0..<N-2 {
        for j in 0..<M-1 {
            let sum = nArray[i][j] + nArray[i+1][j] + nArray[i+2][j] + max(nArray[i][j+1], nArray[i+2][j+1])

            count = max(count, sum)
        }
    }

    // > 3
    for i in 0..<N-2 {
        for j in 1..<M {
            let sum = nArray[i][j] + nArray[i+1][j] + nArray[i+2][j] + max(nArray[i][j-1], nArray[i+2][j-1])

            count = max(count, sum)
        }
    }
    
    // > 2
    for i in 1..<N {
        for j in 0..<M-2 {
            let sum = nArray[i][j] + nArray[i][j+1] + nArray[i][j+2] + max(nArray[i-1][j], nArray[i-1][j+2])
            
            count = max(count, sum)
        }
    }
    
    // > 4
    for i in 0..<N-1 {
        for j in 0..<M-2 {
            let sum = nArray[i][j] + nArray[i][j+1] + nArray[i][j+2] + max(nArray[i+1][j], nArray[i+1][j+2])
           
            count = max(count, sum)
        }
    }
    return count
}

func countFourth() -> Int {
    var count = 0
    
    // > 1
    for i in 0..<N-1 {
        for j in 0..<M-2 {
            let sum = nArray[i][j] + nArray[i][j+1] + nArray[i][j+2] + nArray[i+1][j+1]

            count = max(count,sum)
        }
    }
    
    // > 2
    for i in 1..<N {
        for j in 0..<M-2 {
            let sum = nArray[i][j] + nArray[i][j+1] + nArray[i][j+2] + nArray[i-1][j+1]

            count = max(count,sum)
        }
    }
    
    // > 3
    for i in 0..<N-2 {
        for j in 0..<M-1 {
            let sum = nArray[i][j] + nArray[i+1][j] + nArray[i+2][j] + nArray[i+1][j+1]

            count = max(count,sum)
        }
    }
    
    // > 4
    for i in 0..<N-2 {
        for j in 1..<M {
            let sum = nArray[i][j] + nArray[i+1][j] + nArray[i+2][j] + nArray[i+1][j-1]

            count = max(count,sum)
        }
    }
    return count
}

func countFifth() -> Int {
    var count = 0
    
    for i in 0..<N-2 {
        for j in 0..<M-1 {
            let a = nArray[i][j] + nArray[i+2][j+1]
            let b = nArray[i][j+1] + nArray[i+2][j]
            
            let sum = max(a, b) + nArray[i+1][j] + nArray[i+1][j+1]
            count = max(count, sum)
        }
    }
    
    for i in 0..<N-1 {
        for j in 0..<M-2 {
            let a = nArray[i][j] + nArray[i+1][j+2]
            let b = nArray[i][j+2] + nArray[i+1][j]
            
            let sum = max(a, b) + nArray[i][j+1] + nArray[i+1][j+1]
            
            count = max(count, sum)
        }
    }
    return count
}
