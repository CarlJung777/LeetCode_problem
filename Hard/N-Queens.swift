class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()       // 保存所有解的结果
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)  // 初始化空棋盘
        backtrack(&board, 0, &result, n)
        return result
    }
    
    // 回溯算法函数
    private func backtrack(_ board: inout [[String]], _ row: Int, _ result: inout [[String]], _ n: Int) {
        // 如 果成功到达最后一行，说明找到了一组解
        if row == n {
            result.append(board.map { $0.joined() }) // 将二维棋盘转为一维表示形式
            return
        }
        
        for col in 0..<n {
            if isValid(board, row, col, n) {   // 检查是否可以在 (row, col) 位置放置皇后
                board[row][col] = "Q"          // 放置皇后
                backtrack(&board, row + 1, &result, n)  // 递归放置下一行的皇后
                board[row][col] = "."          // 回溯，撤销之前的选择
            }
        }
    }
    
    // 判断是否可以在棋盘的 (row, col) 位置放置皇后
    private func isValid(_ board: [[String]], _ row: Int, _ col: Int, _ n: Int) -> Bool {
        // 检查当前列是否已有皇后
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // 检查左上对角线是否有皇后
        var i = row - 1, j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        // 检查右上对角线是否有皇后
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        return true
    }
}
