import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let num = Int(readLine()!)!

    var numArray = Array(repeating: true, count: num+1)
    var count = 0

    numArray[1] = false
    numArray[0] = false

    for i in 2...num {
        if numArray[i] == false {
            continue
        }

        for j in stride(from: i+i, through: num, by: i) {
            numArray[j] = false
        }
    }

    for i in 2...num {
        if numArray[i] == true {
            if numArray[num-i] == true {
                if i == num - i {
                    count += 2
                } else {
                    count += 1
                }
            }
        }
    }

    print(count/2)
}

