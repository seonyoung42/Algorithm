// 프로그래머스 - [1차] 프렌즈4블록

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map { Array($0) }
    var coordArr = Set<[Int]>()
    var count = 0
    
    while true {
        for i in 0..<(m-1) {
            for j in 0..<(n-1) {
                let chr = board[i][j]
                if chr == " " {
                    continue
                }
              
                if board[i][j+1] == chr && board[i+1][j] == chr && board[i+1][j+1] == chr {
                    [(i,j), (i,j+1), (i+1,j), (i+1,j+1)].forEach {
                        coordArr.insert([$0.0, $0.1])
                    }
                }
            }
        }
        
        if coordArr.isEmpty {
            break
        } else {
            count += coordArr.count
             for coord in coordArr {
                 if board[coord[0]][coord[1]] != " " {
                     board[coord[0]][coord[1]] = " "
                 }
             }
            coordArr = []
        }
        
        while true {
            var moved = false
            
            for i in 0..<(m-1) {
                for j in 0..<n {
                    if board[i][j] != " " && board[i+1][j] == " " {
                        board[i+1][j] = board[i][j]
                        board[i][j] = " "
                        moved = true
                    }
                }
            }
            
            if !moved {
                break
            }
        }
    }
    
    return count
}

