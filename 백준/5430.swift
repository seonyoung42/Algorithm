// 문제 : 백준 AC
// 풀이 : 투 포인터

let T = Int(readLine()!)!

outer: for _ in 0..<T {
  let p = readLine()!
  let n = Int(readLine()!)!
  let nums = readLine()!.dropLast().dropFirst().split(separator:",").map{Int(String($0))!}
  
  var head = 0
  var tail = n - 1
  var isReversed = false
  
  for command in p {
    if command == "R" {
      isReversed = !isReversed
    } else {
      if head > tail {
        print("error")
        continue outer
      }
      if isReversed {
        tail -= 1
      } else {
        head += 1
      }
    }
  }
  
  if head > tail {
    print("[]")
  } else {
    if isReversed {
      print("[" + nums[head...tail].reversed().map{String($0)}.joined(separator:",") + "]")
    } else {
      print("[" + nums[head...tail].map{String($0)}.joined(separator:",") + "]")
    }
  }
}
