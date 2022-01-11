import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let M = nums[0]
    let N = nums[1]
    let x = nums[2]
    let y = nums[3]
    var mode = true
   
    if M > N {
        for i in 0..<40000 {
            let a = M*i + x
            var b = a%N
            if b == 0 {
                b = N
            }
            
            if b == y {
                mode = false
                print(a)
                break
            }
        }
    } else {
        for i in 0..<40000 {
            let a = N*i + y
            var b = a%M
            if b == 0 {
                b = M
            }
            
            if b == x {
                mode = false
                print(a)
                break
            }
        }
    }
    
    if mode {
        print(-1)
    }
}


