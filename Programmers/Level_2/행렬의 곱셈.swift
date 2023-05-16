// 문제 : 프로그래머스 - 행렬의 곱셈 https://school.programmers.co.kr/learn/courses/30/lessons/12949
// 풀이 : 행렬의 곱셈
// ( 1 2 3 )                                    ( 4 ) 
// ( 2 2 3 ) 이라는 (3 x 2) 행렬과 곱할 수 있는 행렬은  ( 5 ) 이라는 (1 X 3) 행렬 처럼 열의 개수가 본인의 행의 개수와 동일한 행렬이다.
//                                              ( 6 )
// 이 두 행렬을 곱하면 (1 x 2) 행렬이 된다.
// 
// 즉 (a x b) 행렬과 (c x b) 행렬을 곱하려면
// a와 b가 동일해야하고, 그 곱셈의 결과는 (c x b) 행렬이 된다.

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
  var arr = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
  
  for i in 0..<arr1.count {
    for j in 0..<arr2[0].count {
      var sum = 0
      for k in 0..<arr1[i].count {
        sum += arr1[i][k] * arr2[k][j]
      }
      arr[i][j] = sum
    }
  }
  return arr
}
