import Foundation

var nums = readLine()!.split(separator: " ").map{Int(String($0))!}

var decimal = nums[0]
var num = nums[1]

print(String(decimal,radix: num).uppercased())

//extension Array where Element == String {
//    func concatenate() -> String {
//        return self.reduce("", {$0 + $1 + ""})
//    }
//}
//
//
//let arr = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").map { String($0) }
//let input: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
////let input = [60466175, 36]
//
//var N = input[0]
//let B = input[1]
//
//var result = [String]()
//while N != 0 {
//    result.append((arr[N % B]))
//    N /= B
//}
//
//print(String(result.concatenate().reversed()))
//
