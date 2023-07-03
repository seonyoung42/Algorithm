// 프로그래머스 : 방문 길이 - https://school.programmers.co.kr/learn/courses/30/lessons/49994
// 원래는 historySet에 방문한 좌표를 tuple 집합으로 넣고 싶었으나.. 불가해서 정수 배열로 넣었다.
// 방문한 좌표를 해당 좌표만 저장하는 것이 아니라 시작점과 끝점을 함께 저장하는 것이 포인트! 
// 또한 시작점 -> 끝점뿐만 아니라 끝점 -> 시작점도 historySet에 포함되어 있는지 확인해야 진짜 해당 길을 방문했는지 정확히 알 수 있다.

func solution(_ dirs:String) -> Int {
  var location: (x: Int, y:Int) = (0,0)
  var historySet = Set<[Int]>()              
  
  for dir in dirs {
    var move: (x: Int, y:Int) = (0, 0)
    switch dir {
      case "U": 
        move = (0, 1)
      case "D":
        move = (0, -1)
      case "R":
        move = (1, 0)
      case "L":
        move = (-1, 0)
      default:
        return 
    }

    let newLocation: (x: Int, y:Int) = (location.x + move.x, location.y + move.y)
    if abs(newLocation.x) <= 5 && abs(newLocation.y) <= 5 {
    
      if !historySet.contains([location.x,location.y, newLocation.x, newLocation.y)]) && !historySet.contains([newLocation.x, newLocation.y, location.x, location.y]) {
          historySet.insert([newLocation.x, newLocation.y, location.x,location.y])
      }
      location = newLocation
    }
  }
  return historySet.count
}
