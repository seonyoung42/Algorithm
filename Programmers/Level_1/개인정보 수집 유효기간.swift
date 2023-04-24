// 문제 : 프로그래머스 - 개인정보 수집 유효기간
// 풀이 : 구현(날짜)

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let date = today.split(separator:".").map{Int(String($0))!}
    let year = date[0]
    let month = date[1]
    let day = date[2]
    
    var termDict = [String: Int]()
    var answer = [Int]()
    
    for term in terms {
        let term = term.split(separator:" ").map{String($0)}
        termDict[term[0]] = Int(term[1])!
    }
    
    for i in 0..<privacies.count {
        let term = privacies[i].split(separator:" ").map{String($0)}
        let d = term[0].split(separator:".").map{Int($0)!}
        let newDate = calDate(d, termDict[term[1]]!)
        
        if newDate[0] < year {
            answer.append(i+1)
        } else {
            if newDate[0] == year && newDate[1] < month {
                answer.append(i+1)
            } else {
                if newDate[0] == year && newDate[1] == month && newDate[2] < day {
                    answer.append(i+1)
                }
            }
        }
    }
    
    return answer
}

func calDate(_ date: [Int], _ add: Int) -> [Int] {
    var year = date[0]
    var month = date[1] + add
    var day = date[2]
    
    let a = month % 12 
    let b = month / 12
    
    year += b
    month = a
    day -= 1
    
    if day == 0 {
        month -= 1
        day = 28
    }
    
    if month < 1 { 
        year -= 1
        month = 12
    }
   
    return [year, month, day]
}
