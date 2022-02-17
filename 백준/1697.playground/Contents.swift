/**
 x 에서
 - 걷기 : x-1 or x +1  로 이동
 - 순간이동: 2*x.  로 이동
 x = k 가 되는 가장 빠른 시간
 */

import Foundation

let location = readLine()!.split(separator: " ").map { Int(String($0))!}
let start = location[0]
let destination = location[1]
let queue: Queue = Queue([])
var time = 0
var check = Array(repeating: false, count: 100001)

func bfs(_ start:Int) {
    queue.push(start)
    check[start] = true
    
    while true {
        if check[destination] {
            break
        }
        
        time += 1
        for _ in 0..<queue.count {
            guard let node = queue.pop() as? Int else { return }
            
            for i in [node+1, node-1, node*2] {
                if 0...100000 ~= i && !check[i] {
                    queue.push(i)
                    check[i] = true
                }
            }
        }
    }
    print(time)
}

bfs(start)

class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    init(_ queue: [T]) {
        self.enqueue = queue
    }
    
    func push(_ n: T) {
        enqueue.append(n)
    }
    
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}
