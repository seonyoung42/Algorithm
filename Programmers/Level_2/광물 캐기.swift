// 문제 : 프로그래머스 - 광물 캐기 : https://school.programmers.co.kr/learn/courses/30/lessons/172927
// 풀이 : BFS

import Foundation

var minCount = Int.max
// key: 광물, val: 사용하는 곡괭이 별 피로도 
var tiredDict: [String: [Int]] = ["diamond": [1,5,25],
                                  "iron": [1,1,5],
                                  "stone": [1,1,1]]

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
  
  bfs(picks, minerals, 0, 0)
  return minCount
}

func bfs(_ picks: [Int], _ minerals: [String], _ count: Int, _ tired: Int) {
  
  if count == minerals.count || picks.reduce(0, +) == 0 {
    minCount = min(minCount, tired)
    return 
  }
  
  var picks = picks
  
  for i in 0..<3 {
    if picks[i] == 0 { continue }
    picks[i] -= 1
    
    let last = min(count + 5, minerals.count)
    var temp = 0
    
    for j in count..<last {
      let val = tiredDict[minerals[j]]!
      temp += val[i]
    }
    
    bfs(picks, minerals, last, tired + temp)
    picks[i] += 1
  }
}
