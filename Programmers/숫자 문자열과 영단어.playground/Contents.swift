import Foundation


func solution(_ s:String) -> Int {
    
    let numArray = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var resultArray = s
    
    for i in 0..<numArray.count {
        resultArray = resultArray.replacingOccurrences(of: numArray[i], with: "\(i)")
        print(resultArray)
    }
    
//
//
//    var testArray = s
//    var resultArray = ""
//    var index : String.Index
//
//    if !testArray.isEmpty {
//        index = testArray.index(testArray.startIndex, offsetBy: 1)
//    } else {
//        index = testArray.startIndex
//    }
//
//    func removeElements(times: Int) {
//        for _ in 0..<times {
//            testArray.removeFirst()
//        }
//    }
//
//    while !testArray.isEmpty {
//        for char in testArray {
//
//            if char == "z" {
//                resultArray.append("0")
//                removeElements(times: 4)
//                break
//
//            } else if char == "o" {
//                resultArray.append("1")
//                removeElements(times: 3)
//                break
//
//            } else if char == "t" {
//
//                if testArray[index] == "w" {
//                    resultArray.append("2")
//                    removeElements(times: 3)
//
//                } else {
//                    resultArray.append("3")
//                    removeElements(times: 5)
//                }
//                break
//
//            } else if char == "f" {
//                if testArray[index] == "o" {
//                    resultArray.append("4")
//                    removeElements(times: 4)
//                } else {
//                    resultArray.append("5")
//                    removeElements(times: 4)
//                }
//                break
//            } else if char == "s" {
//                if testArray[index] == "i" {
//                    resultArray.append("6")
//                    removeElements(times: 3)
//                } else {
//                    resultArray.append("7")
//                    removeElements(times: 5)
//                }
//                break
//
//            } else if char  == "e" {
//                resultArray.append("8")
//                removeElements(times: 5)
//                break
//            } else if char == "n" {
//                resultArray.append("9")
//                removeElements(times: 4)
//                break
//            } else {
//                resultArray.append(testArray.removeFirst())
//            }
//
//        }
//    }
//
    return Int(resultArray)!
}


solution("one4seveneight")
