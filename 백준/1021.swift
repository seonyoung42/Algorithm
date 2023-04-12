// 문제 : 백준 회전하는 큐
// 풀이 : 큐
// removeFirst()가 자주 사용되고 있어 시간복잡도를 줄이고자 Queue를 만들었다. 
// 근데 Queue를 만들던, 그냥 배열을 사용하건 백준 사이트 상에서 시간은 동일하게 나왔다 (핳ㅠ)


let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let indexArray = readLine()!.split(separator:" ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var numArray = Queue(nums: [Int](1...N)) 
var count = 0

for index in indexArray {
  
  while index != numArray.first! {
    let idx = numArray.firstIndex(of: index)!
    
    if idx > numArray.count / 2 {
      let num = numArray.removeLast()
      numArray.insert(num)
    } else {
      let num = numArray.removeFirst()
      numArray.append(num)
    }
    count += 1
  }
  
  numArray.removeFirst()
}

print(count)

struct Queue {
    var left = [Int]()
    var right = [Int]()
  
    init(nums: [Int]) {
        left = nums
    }
    
    var count: Int {
        return left.count + right.count
    }
    
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    var first: Int? {
        if isEmpty {
            return nil
        } else {
            if right.isEmpty {
                return left.first!
            } else {
                return right.last!
            }
        }
    }
    
    func firstIndex(of: Int) -> Int? {
        if let leftIndex = left.firstIndex(of: of) {
            if right.isEmpty {
                return leftIndex
            } else {
                return right.count + leftIndex
            }
        } else if let rightIndex = right.firstIndex(of: of) {
            return right.count - rightIndex - 1
        } else {
            return nil
        }
    }
  
    mutating func append(_ num: Int) {
        left.append(num)
    }
  
    mutating func insert(_ num: Int) {
        right.append(num)
    }
  
    mutating func removeFirst() -> Int {
        if right.isEmpty {
            right = left.reversed()
            left = []
        }
        return right.removeLast()
    }
  
    mutating func removeLast() -> Int {
        if left.isEmpty {
            left = right.reversed()
            right = []
        }
        return left.removeLast()
    }
}

