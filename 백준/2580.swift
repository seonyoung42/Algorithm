// 문제 : 백준 스도쿠
// 풀이 방법 : 재귀
// 비어 있는 위치들의 저장하는 emptyArray의 수 만큼 재귀함수가 실행되게끔 한다.
// 해당 위치에 들어갈 수 있는 지 여부를 isPossible로 확인한다.

import Foundation

var sudoku = [[Int]]()
var emptyArray = [(Int,Int)]()

for i in 0..<9 {
  let nums = readLine()!.split(separator:" ").map{Int(String($0))!}
  for j in 0..<9 {
    if nums[j] == 0 {
      emptyArray.append((i,j))
    }
  }
  sudoku.append(nums)
}

func recur(count: Int) {
  if count == emptyArray.count {
     for i in 0..<9 {
       print(sudoku[i].map{String($0)}.joined(separator:" "))
     }
     exit(0)
  }
  
  let (x,y) = (emptyArray[count].0, emptyArray[count].1)
  
  for num in 1...9 {
    if isPossible(x,y,num) {
      sudoku[x][y] = num
      recur(count: count + 1)
      sudoku[x][y] = 0
    }
  }
}

func isPossible(_ x:Int, _ y: Int, _ num: Int) -> Bool {
  let col = x / 3 * 3
  let row = y / 3 * 3
  
  /// 블록(9칸) 확인
  for i in col...(col + 2) {
    for j in row...(row + 2) {
      if sudoku[i][j] == num { return false }
    }
  }
  
  /// 세로 줄 확인
  for i in 0..<9 {
    if sudoku[x][i] == num { return false }
  }
  
  /// 가로 줄 확인
  for i in 0..<9 {
    if sudoku[i][y] == num { return false }
  }
 
  return true
}

recur(count: 0)
