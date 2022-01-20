import Foundation

while true {
    let nums = readLine()!.split(separator: " ").map {Int(String($0))!}

    if nums[0] == 0 {
        break
    } else {

        let n = nums[0]
        let nArray = nums[1...n].sorted()
        var result = [String]()
        var printResult = ""

        func recur(_ num: Int, _ start: Int) {
            if num == 6 {
                printResult += result.joined(separator: " ")
                printResult += "\n"
                return
            }

            for i in start..<n {
                if !result.contains(String(nArray[i])) {
                    result.append(String(nArray[i]))
                    recur(num + 1, i + 1)
                    result.removeLast()
                }
            }
        }

        recur(0, 0)
        print(printResult)
    }
}




