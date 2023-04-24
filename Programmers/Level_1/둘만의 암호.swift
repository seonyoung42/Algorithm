// 문제 : 프로그래머스 둘만의 암호
// 풀이 : 구현

func solution(_ s:String, _ skip: String, _ index: Int) -> String {
  var skipArray = skip.map{ Int(UnicodeScalar(String($0))!.value) }
  let aAscii = Int(UnicodeScalar("a").value)
  let zAscii = Int(UnicodeScalar("z").value)
  var ansArray = [Int]()
  
  for char in s {
    var val = Int(UnicodeScalar(String(char))!.value)
    var count = index 
    
    while count > 0 {
      val += 1
      count -= 1
      
      if val > zAscii {
        val = aAscii
      }
      
      if skipArray.contains(val) {
        count += 1
      }
    }
    ansArray.append(val)
  }
  return String(ansArray.map{ Character(UnicodeScalar($0)!) })
}
