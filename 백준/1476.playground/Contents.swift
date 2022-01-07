import Foundation

let nums = readLine()!.split(separator: " ").map { Int(String($0))!}


if nums[1] > 0 &&  nums[1] < 16 {
    if (nums[1] == nums[0]) && (nums[1] == nums[2]) {
        print(nums[1])
    } else {
        getRealNum()
    }
} else if nums[1] > 15 && nums[1] < 20 {
    if nums[1] == nums[2] {
        print(nums[1])
    } else {
        getRealNum()
    }
} else {
    getRealNum()
}


func getRealNum() {
    var count = 0
    
    while true {
        let s = count * 28 + nums[1]
        
        var e = s%15
        if e == 0 {
            e = 15
        }
        
        var m = s%19
        
        if m == 0 {
            m = 19
        }
        
        if (m == nums[2]) && (e == nums[0]) {
            print(s)
            break
        } else {
            print("\(s) : \(e) - \(m)")
            count += 1
        }
    }
}
