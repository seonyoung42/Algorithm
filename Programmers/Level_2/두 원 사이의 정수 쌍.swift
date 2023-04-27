// 문제 : https://school.programmers.co.kr/learn/courses/30/lessons/181187
// 1 사분면의 정수 갯수만 구해서 * 4를 해준다.
// y2는 무조건 버리고(floor), y1은 무조건 올림(ceil)으로 해서 갯수를 구한다. 이때 y1과 y2가 같은 경우도 있기 때문에 + 1 해준다.


func solution(_ r1:Int, _ r2:Int) -> Int {
  var count = 0 
  
  for x in 1...r2 {
    let y2 = sqrt(Double(r2 * r2 - x * x))
    let y1 = x > r1 ? 0 : sqrt(Double(r1 * r1 - x * x))
    
    count += Int(floor(y2) - ceil(y1)) + 1
  }
  
  return count * 4
}
