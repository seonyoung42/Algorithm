import Foundation

let test = Int(readLine()!)!

for _ in 0..<test {
    
    let line = readLine()!.split(separator: " ")
    var array = [Character]()
    
    for i in 0..<line.count {
        for char in line[i] {
            array.insert(char, at: 0)
        }
        
        for char in array {
            print(char,terminator: "")
        }
       print(" ",terminator: "")
       array = []
    }    
}


