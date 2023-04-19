// 문제 : 백준 별 찍기 - 10 
// 풀이 : 재귀

let N = Int(readLine()!)!

func printStar(num: Int, str:[String]) {
  if num == 1 {
    str.forEach { print($0) }
    return
  }
  
  let first = str.map{ $0 + $0 + $0 }
  let second = str.map { $0 + " " * $0.count + $0 }
  let third = str.map{ $0 + $0 + $0 }
  
  printStar(num: num / 3, str: first + second + third)
}

printStar(num: N, str:["*"])
