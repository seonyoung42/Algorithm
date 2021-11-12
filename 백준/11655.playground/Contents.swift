import Foundation

let line = readLine()!

for char in line {
    
    var charAscii = char.asciiValue!
    
    if charAscii >= 65 && charAscii <= 90 {
        
        if charAscii + 13 > 90 {
            print(Character(UnicodeScalar(charAscii  - 13)),terminator: "")
        } else {
            print(Character(UnicodeScalar(charAscii + 13)),terminator: "")
        }
        
    } else if charAscii >= 97 && charAscii <= 122 {
        
        if charAscii + 13 > 122 {
            print(Character(UnicodeScalar(charAscii  - 13)),terminator: "")
        } else {
            print(Character(UnicodeScalar(charAscii + 13)),terminator: "")
        }
    } else {
        print(char,terminator: "")
    }
    
  
}
