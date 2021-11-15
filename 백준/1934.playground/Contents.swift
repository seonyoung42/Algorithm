import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    var max = nums.max()!
    var min = nums.min()!
    var r = max%min

    while r != 0 {
        max = min
        min = r
        r = max%min
    }


    print(nums[0]*nums[1]/min)
}
