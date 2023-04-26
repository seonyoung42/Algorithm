// 문제 : 프로그래머스 - 신고 결과 받기 -> https://school.programmers.co.kr/learn/courses/30/lessons/92334
// 풀이 : 구현

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
  // 유저 별로 신고한 아이디 리스트를 저장하는 딕셔너리
  var reportDict = [String: [String]]()
  // 신고된 아이디 별 횟수를 저장하는 딕셔너리
  var reportedIdDict = [String: Int]()
  // k번 이상 신고된 아이디를 저장하는 집합
  var reportedIdSet = Set<String>()
  var answer = [Int]()
  
  for report in Set(report) {
    let rep = report.split(separator:" ").map{String($0)}
    reportDict[rep[0]] = (reportDict[rep[0]] ?? []) + [rep[1]]
    reportedIdDict[rep[1]] = (reportedIdDict[rep[1]] ?? 0) + 1
    if reportedIdDict[rep[1]]! == k {
      reportedIdSet.insert(rep[1])
    }
  }
  
  for id in id_list {
    var ans = 0
    if let reportedId = reportDict[id] {
      for id in reportedId {
        if reportedIdSet.contains(id) { ans += 1 }
      }
    }
    answer.append(ans)
  }
  
  return answer
}
              
