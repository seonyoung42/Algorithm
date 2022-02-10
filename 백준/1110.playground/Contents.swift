import Foundation

let n = Int(readLine()!)!

var a = n < 10 ? 0 : n/10
var b = n%10
var count = 0

while true {
    count += 1
    let b2 = b
    b = a+b < 10 ? a+b : (a+b)%10
    a = b2
  
    if (a*10+b) == n {
        print(count)
        break
    }
}


