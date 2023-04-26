// 문제 : 프로그래머스 - 신규 아이디 추천 -> https://school.programmers.co.kr/learn/courses/30/lessons/72410

func solution(_ new_id:String) -> String {
  var newId = new_id
  
  // 1단계 : 모두 소문자로 치환
  newId = newId.lowercased()
  
  // 2단계 : 알파벳 소문자, 숫자, 빼기, 밑줄, 마침표를 제외한 모든 문자 제거
  let possibleLetter = "abcdefghijklmnopqrstuvwxyz0123456789-_."
  for char in newId {
    if possibleLetter.contains(char) {
      newId = newId.replacingOccurrences(of:char, with:"")
    }
  }
  
  // 3단계 : 마침표가 두 번 이상 연속된 부분을 하나의 마침표로 치환
  while newId.contains("..") {
    newId = newId.replacingOccurrences(of:"..", with:".")
  }
  
  // 4단계 : 마침표가 처음이나 끝에 위치하면 제거
  while newId.hasPrefix(".") {
    newId.removeFirst()
  }
  while newId.hasSuffix(".") {
    newId.removeLast()
  }
  
  // 5단계 : newId가 빈 문자열이면 "a"대입
  if newId.isEmpty {
    newId += "a"
  }
  
  // 6단계 : newId가 16자 이상이면, newId의 첫 15개 문자를 제외한 나머지 문자 모두 제거
  if newId.count >= 16 {
    newId = Array(newId[0...15])
    if newId.hasSuffix(".") { 
      newId.removeLast() 
    }
  }
  
  // 7단계 : newId가 2자 이하면, newId의 마지막 문자를 길이가 3이 될때까지 반복해서 끝에 붙임
  while newId.count < 3 {
    newId += newId.last!
  }
  
  return newId
}
