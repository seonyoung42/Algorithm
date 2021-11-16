import Foundation

var num = Int(readLine()!)!
//var num = 1
var factorial = num

if num <= 1 {
    factorial = 1
} else {
    while num > 1 {
        num -= 1
        factorial = factorial * num
    }
}

print(factorial)
