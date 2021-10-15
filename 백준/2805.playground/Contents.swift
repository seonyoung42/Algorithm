import Foundation

let firstArray = readLine()!.split(separator: " ").map { Int(String($0))!}
var heightArray = readLine()!.split(separator: " ").map { Int(String($0))!}

heightArray.sort(by: >)
var limit = firstArray[1]

func binary_search() {
    var left = 1
    var right = heightArray.max()!
    
    while left <= right {
        let mid = (left + right)/2
        var sum = 0
        
        for i in heightArray {
            sum += i - mid
            if sum >= limit { break }
        }
        
        if sum >= limit {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    print(right)
}

binary_search()
