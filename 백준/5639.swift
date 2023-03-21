// 문제 : 백준 이진 검색 트리
// 풀이 : 이진 검색, 그래프(전위 순회, 후위 순회), 재귀
// 전위 순회에서 0 번째가 루트 노드, 1번째 부터 왼쪽 자식 노드이므로 binarySearch의 node 매개변수에는 start가, start 매개변수에는 start + 1이 들어간다.
// 후위 순회에서 루트 노드는 마지막이지만, 전위 순회에서 루트노드는 시작점이므로 postOrder함수의 마지막에 preOrderList[start]를 출력한다.

var preOrderList = [Int]()

while let input = readLine(), 
      let num = Int(input) {
  preOrderList.append(num)
}

postOrder(start: 0, end: preOrderList.count)

func postOrder(start: Int, end: Int) {
  if start >= end { return }
  let index = binarySearch(start: start + 1, end: end, node: preOrderList[start])
  postOrder(start: start+1, end: index)
  postOrder(start: index, end: end)
  print(preOrderList[start])
}
        
func binarySearch(start: Int, end: Int, node: Int) -> Int {
  var start = start
  var end = end
  
  while start < end {
    let mid = (start + end) / 2
    
    if preOrderList[mid] > node {
      end = mid
    } else {
      start = mid + 1
    }
  }
  return start
}
