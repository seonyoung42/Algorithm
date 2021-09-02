import Foundation

let num = Int(readLine()!)!
var numArray = [(x:Int?, y:Int?)]()

for _ in 0..<num {
    let line = readLine()?.split(separator: " ")
    numArray.append((x:Int(line![0]),y:Int(line![1])))
}

// > 정렬 기준 두 개 : x 좌표가 같은 경우 y좌표 순으로 정렬하고 그렇지 않으면 x좌표 순으로 정렬한다
numArray.sort { (first, second) -> Bool in
    if first.x == second.x {
        return first.y! < second.y!
    } else {
        return first.x! < second.x!
    }
}

numArray.forEach { member in print("\(member.x!) \(member.y!)") }
