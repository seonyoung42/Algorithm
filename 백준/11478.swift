## 문제 : 백준 서로 다른 부분 문자열의 개수
## 풀이 : 문자열 

let s = readLine()!.map{ $0 }
var strSet = Set<String>()

for i in 0..<s.count {
  var str = ""
  for j in i..<s.count {
    str += String(s[i])
    strSet.insert(str)
  }
}

print(strSet.count)
