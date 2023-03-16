// 문제 : 백준 공유기 설치
// 풀이 : 이분 탐색
// 공유기 간격을 기준 이분탐색

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let (N, C) = (input[0], input[1])
var homeArray = [Int]()
var result = 0

for _ in 0..<N {
  let home = Int(readLine()!)!
  homeArray.append(home)
}

homeArray.sort()
binarySearch()
print(result)

func binarySearch() {
  var start = 1
  var end = homeArray.last! - homeArray.first!
  
  while start <= end {
    
    let mid = (start + end) / 2
    var previousHome = homeArray[0]
    var count = 1
    
    for i in 1..<N {
      if homeArray[i] - previousHome >= mid {
        count += 1
        previousHome = homeArray[i]
      }
    }
    
    if count < C {
      end = mid - 1
    } else {
      start = mid + 1
      result = max(result, mid)
    }
  }
}
  
  
