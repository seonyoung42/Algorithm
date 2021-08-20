import Foundation


let test = [ 1,4,5,7,2,8]
test.enumerated()
print(test[4])

let firstLine = readLine() ?? ""
let num = Int(firstLine) ?? 0


for _ in 0..<num {

    let secondLine = readLine() ?? ""
    let thirdLine = readLine() ?? ""
    let array = secondLine.components(separatedBy: " ")
    let thirdArray = thirdLine.components(separatedBy: " ").enumerated()
    
    let a = Int(array[0]) ?? 0
    let b = Int(array[1]) ?? 0
    var count = 1
    

    while 
    
    
    
    for i in 0..<a {
        
    }
    

//    if a == 1 {
//        print("1")
//    } else {
//        for i in 0..<a {
//            if Int(thirdArray[i])! > Int(thirdArray[b])! {
//                count += 1
//            } else if Int(thirdArray[i])! == Int(thirdArray[b])! {
//                same += 1
//
//            }
//        }
//    }
    
    
    
    

    print(count + same - b + 1)
}









//let thirdArray = [1,1,9,1,1,1]
//let a = 6
//let b = 0
//var count = 1
//var same = 0
//
//if a == 1 {
//    print("1")
//} else {
//    for i in 0..<a {
//        if Int(thirdArray[i]) > Int(thirdArray[b]) {
//            count += 1
//        } else if Int(thirdArray[i]) == Int(thirdArray[b]) {
//            same += 1
//
//        }
//    }
//
//    for i in 0..<a {
//        for j in i+1..<a {
//            if Int(thirdArray[i]) > Int(thirdArray[j]) {
//
//            }
//        }
//    }
//
//}
//
//
//
//print(count + same - (b+1) )
