// 문제 : 프로그래머스 - 과제 진행하기 https://school.programmers.co.kr/learn/courses/30/lessons/176962
// 풀이 : 큐

func solution(_ plans:[[String]]) -> [String] {
  var plans = [(String, Int, Int)]()
  var finished = [String]()
  var stopped = [(String, Int)]()
  
  for plan in plans {
    let startTime = plan[1].split(separator:":").map{Int(String($0))!}
    plans.append((plan[0], startTime[0] * 60 + startTime[1], Int(plan[2])!))
  }
  
  plans.sort{ $0.1 < $1.1}
  
  for i in 0..<plans.count {
    if i == plans.count - 1 {
      finished.append(plans[i].0)
      break
    }
    
    var extra = plans[i + 1].1 - (plans[i].1 + plans[i].2)
    
    if extra >= 0 {
      finished.append(plans[i].0)
      
      while !stopped.isEmpty {
        let plan = stopped.removeLast()
        
        if plan.1 >= extra {
          finished.append(plan.0)
          extra -= plan.1
        } else {
          stopped.append((plan.0, plan.1 - extra))
          break
        }
      }
    } else {
      stopped.append((plans[i].0, -extra))
    }
  }
  
  while !stopped.isEmpty {
    let plan = stopped.removeLast()
    finished.append(plan.0)
  }
  
  return finished
}
