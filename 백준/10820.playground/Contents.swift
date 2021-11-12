import Foundation

for _ in 0..<100 {

    var small = 0
    var large = 0
    var num = 0
    var blank = 0

    let line = readLine()


    if let line = line {

        for char in line {
            if Int(char.asciiValue!) >= 97 {
                small += 1
            } else if Int(char.asciiValue!) >= 65 {
                large += 1
            } else if Int(char.asciiValue!) == 32 {
                blank += 1
            } else {
                num += 1
            }
        }

        print([small,large,num,blank].map{String($0)}.joined(separator: " "))

    } else {
        break
    }


}
