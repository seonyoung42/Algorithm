import Foundation

let firstLine = readLine() ?? ""
let num = Int(firstLine) ?? 0

for _ in 0..<num {

    let secondLine = readLine()!
    let thirdLine = readLine()!
    let secondArray = secondLine.components(separatedBy: " ")
    var thirdArray = thirdLine.split(separator: " ").map{Int($0)!}
    var indexArray : [(Int,Int)] = thirdArray.enumerated().map{($0,Int(String($1))!)}
    
    // enumerated : Array의 index 와 value 를 반환하는 메서드
    // map : 클로저로 각 항목들을 반영한 결과물을 가진 배열 반환
    // $0 : 첫번째 매개변수 -> 여기서는 index/ $1 : 두 번째 매개변수 -> 여기서는 값
    
    
    let a = Int(secondArray[0]) ?? 0 // 문서 갯수
    let b = Int(secondArray[1]) ?? 0 // 해당 문서의 인덱스
    var count = 0
    
    while true {
        let maxValue = thirdArray.max()
        let maxIndex = thirdArray.index(of:maxValue!)
        
        if indexArray[0].1 == thirdArray.max() {
            count += 1
            if indexArray[0].0 == b {
                print(count)
                break
            } else {
                indexArray.removeFirst()
                thirdArray.remove(at: maxIndex!)
            }
        } else {
            indexArray.append(indexArray.removeFirst())
        }
    }
}
