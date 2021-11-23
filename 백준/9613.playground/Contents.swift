import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let nArray = readLine()!.split(separator: " ").map { Int(String($0))!}
    let num = nArray[0]
    var gcd = 0

    for i in 1..<num {
        for j in i+1..<num+1 {
            var max = 0
            var min = 0
            
            if nArray[i] > nArray[j] {
                max = nArray[i]
                min = nArray[j]
            } else {
                max = nArray[j]
                min = nArray[i]
            }
            var r = max % min
            
            while r > 0  {
                max = min
                min = r
                r = max % min
            }
            
            gcd += min
            
        }
    }
    print(gcd)
}
