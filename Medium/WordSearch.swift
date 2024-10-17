class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        var board = board
        let word = Array(word) // 将字符串转化为字符数组以方便操作
        
        // 定义DFS函数
        func dfs(_ i: Int, _ j: Int, _ index: Int) -> Bool {
            // 如果当前匹配的字符序列长度等于目标单词长度，说明找到了完整的单词
            if index == word.count {
                return true
            }
            
            // 检查边界条件，如果当前位置越界或字符不匹配，则返回false
            if i < 0 || i >= rows || j < 0 || j >= cols || board[i][j] != word[index] {
                return false
            }
            
            // 临时保存当前字符并将其标记为访问过
            let temp = board[i][j]
            board[i][j] = "#"
            
            // 递归调用，探索上下左右四个方向
            let found = dfs(i + 1, j, index + 1) ||
                        dfs(i - 1, j, index + 1) ||
                        dfs(i, j + 1, index + 1) ||
                        dfs(i, j - 1, index + 1)
            
            // 回溯，将当前字符恢复
            board[i][j] = temp
            
            return found
        }
        
        // 遍历网格的每个位置，启动DFS
        for i in 0..<rows {
            for j in 0..<cols {
                if dfs(i, j, 0) {
                    return true
                }
            }
        }
        
        return false
    }
}

// 测试
let solution = Solution()
let board1: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
let word1 = "ABCCED"
print(solution.exist(board1, word1)) // 输出: true

let board2: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
let word2 = "SEE"
print(solution.exist(board2, word2)) // 输出: true

let board3: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
let word3 = "ABCB"
print(solution.exist(board3, word3)) // 输出: false
