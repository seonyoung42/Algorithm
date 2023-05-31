// 문제: 프로그래머스 - 주차 요금 계산 https://school.programmers.co.kr/learn/courses/30/lessons/92341
// input : solution([180, 5000, 10, 600],	
                    ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"])
// ceil() -> 소수점 올림

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
  var carDict = [String: String]()
  var timeDict = [Int:Int]()
  var ans = [Int]()
  
  for record in records {
    let rec = record.split(separator:" ").map{String($0)}
    let carTime = rec[0]
    let carNum = rec[1]
    
    if rec[2] == "IN" {
      carDict[carNum] = carTime
    } else {
      let time = calTime(carDict[carNum]!, carTime)
      var totalTime = timeDict[Int(carNum)!] ?? 0 
      
      timeDict[Int(carNum)!] = totalTime + time
      carDict[carNum] = nil
    }
  }
  
  for car in carDict {
    let time = calTime(car.value, "23:59")
    var totalTime = timeDict[Int(car.key)!] ?? 0
    timeDict[Int(car.key)!] = totalTime + time
  }
  
  for time in timeDict.sorted(by:{$0.0 < $1.0}) {
    let fee = calFee(fees, time.1)
    ans.append(fee)
  }
  
  return ans
}

func calTime(_ inTime: String, _ outTime: String) -> Int {
    let a = inTime.split(separator:":").map{Int(String($0))!}
    let b = outTime.split(separator:":").map{Int(String($0))!}
    
    let inTime = a[0]*60 + a[1]
    let outTime = b[0]*60 + b[1]
    
    return outTime - inTime
}

func calFee(_ fees: [Int], _ totalTime: Int) -> Int {
    if totalTime <= fees[0] {
        return fees[1]
    } else {
        let time = Double(totalTime - fees[0])
        return Int(ceil(time / Double(fees[2]))) * fees[3] + fees[1]
    }
}

