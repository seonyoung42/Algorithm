// 프로그래머스 : [3차] 파일명 정렬 - https://school.programmers.co.kr/learn/courses/30/lessons/17686
// 파일명을 크게 HEAD, NUMBER, TAIL의 세 부분으로 나누어
// Head는 사전순으로 정렬한다. 이때 head가 동일할 경우 Number 숫자순으로 정렬한다 head와 number가 모두 동일할 경우 기존순서를 유지한다.
// 파일명에서 head를 분리하기 위해 prefix(), drop()을 사용했다. 
// prefix(조건) : 배열 앞에서부터 조건을 만족하는 원소를 모두 반환함
// drop(조건) : 배열에서 조건을 만족하는 원소 뒤 원소를 모두 반환함 (= 조건을 처음으로 만족하지 않는 원소부터 배열의 마지막 원소까지 반환함)

func solution(_ files:[String]) -> [String] {
  var files: [[String]] = files.map { Array($0).map {String($0)} }
  let numeric: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  var order = [(String, Int, Int)]()
  var answer = [String]()
  var idx = 0
  
  for file in files {
    let head = file.prefix{ numeric.contains($0) == false }
    let number = file.drop { numeric.contains($0) == false }.prefix { numeric.contains($0) == true }
    order.append((String(head.uppercased()), Int(number)!, idx))
    idx += 1
  }

  order.sorted { 
    if $0.0 == $1.0 {
      if $0.1 == $1.1 {
        return $0 < $1
      } else {
        return $0.1 < $1.1
      }
    } else {
      return $0.0 < $1.0
    }
  }

  for file in order {
    answer.append(files[file.2])
  }
  
  return answer
}
