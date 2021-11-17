import Foundation

let num = Int(readLine()!)!

func factorial(n: Int) -> Int {
    if n <= 1 {
        return 1
    } else {
        return factorial(n: n-1) * n
    }
}

func power(x:Double, n:Int) -> Double {
    if n == 0 {
        return 1
    }
    else if n > 0
    {
        if n % 2 == 0
        {
            return power(x: x, n: n / 2) * power(x: x, n: n / 2)
        } else {
            return x * power(x: x, n: n-1)
        }
    } else {
        return 1 / power(x: x, n: -n)
    }
}


func countZero(x:Int) -> Int {
    
    var count = 0
    
    while true {
        
        if x % Int(power(x: 10.0, n: count)) != 0 {
            break
        }
        count += 1
    }
    
    return count - 1
}
print(countZero(x: factorial(n: num)))
