// 문제: 백준 수학은 비대면강의입니다.
// 풀이: 수학 or 브루트포스

let nums = readLine()!.split(separator:" ").map{Int(String($0))!}
let (a, b, c, d, e, f) = (nums[0], nums[1], nums[2], nums[3], nums[4], nums[5])

// 수학으로 풀이하는 경우
let y = (c * d - f * a) / (b * d - e * a)
let x = (c * e - f * b) / (a * e - d * b)

print("\(x) \(y)")

// 브루트포스로 풀이하는 경우
for i in -999...999 {
  for j in -999...999 {
    if (a*i + b*j == c) && (d*i + e*j == f) {
      print("\(i) \(j)")
      break
    }
  }
}
