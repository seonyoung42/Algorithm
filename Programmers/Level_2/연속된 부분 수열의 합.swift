// 문제 : https://school.programmers.co.kr/learn/courses/30/lessons/178870
// 풀이 : 투 포인터 - 포인터를 사용해서 sum이 k가 되는 경우 range를 확인하게 한다.
// sequence는 오름차순으로 정렬되어 있기 때문에
// sum이 k보다 큰 경우 sum에서 sequence[start] 를 빼고 start 포인트를 오른쪽으로 한 칸 이동한다.
// sum이 K보다 작거나 같은 경우 end 포인트를 오른쪽으로 한 칸 이동하고, sum에 sequence[end] 를 더해준다.


func solution(_ sequence: [Int], _ k: Int) -> [Int] {
  var start = 0
  var end = 0
  var sum = sequence[0]
  var range = [0, Int.max]

  while start < sequence.count && end < sequence.count {
    if sum == k {
      if end - start < range[1] - range[0] {
        range = [start, end]
      }
    }
    
    if sum <= k {
      end += 1
      if end == sequence.count { break }
      sum += sequence[end]
    } else {
      sum -= sequence[start]
      start += 1
    }
  }
  
  return range
}
