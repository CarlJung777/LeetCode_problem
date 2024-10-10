class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {

        // 棋盘的每个元素是数字或者点，所以这里用 Set<Character>()
        // 九行 九列 九个Box
        var rows = Array(repeating: Set<Character>(), count: 9)
        var cols = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)
        

        // 双循环遍历棋盘
        for i in 0..<9 {
            for j in 0..<9 {

                // 声明常量 num 表示当前位置
                let num = board[i][j]
                
                // 空格跳过
                if num == "." {
                    continue
                }
                
                // i / 3   每个子方块包含 3 行，用 i 除以 3 得到该行所在的子方块的行索引
                // j / 3   确定当前列 j 位于哪个 3x3 子方块中
                // 通过 (i / 3) * 3 计算得到的是当前子方块在整个 9x9 棋盘中垂直位置（行）对应的索引
                // 然后通过 + (j / 3) 计算出在该子方块中具体的子方块索引
                // 最终，这个公式将会得到一个范围在 0 到 8 之间的索引，表示在 9 个子方块中的位置
                let boxIndex = (i / 3) * 3 + j / 3
                
                // 检查当前行、列和 3x3 小格子中是否有重复的数字
                if rows[i].contains(num) || cols[j].contains(num) || boxes[boxIndex].contains(num) {
                    return false
                }
                
                // 检查如果没有重复，将当前数字 num 插入到相应的集合中
                rows[i].insert(num)
                cols[j].insert(num)
                boxes[boxIndex].insert(num)
            }
        }
        return true
    }
}

// 测试用例
let solution = Solution()
let board1: [[Character]] = [["5","3",".",".","7",".",".",".","."]
                           ,["6",".",".","1","9","5",".",".","."]
                           ,[".","9","8",".",".",".",".","6","."]
                           ,["8",".",".",".","6",".",".",".","3"]
                           ,["4",".",".","8",".","3",".",".","1"]
                           ,["7",".",".",".","2",".",".",".","6"]
                           ,[".","6",".",".",".",".","2","8","."]
                           ,[".",".",".","4","1","9",".",".","5"]
                           ,[".",".",".",".","8",".",".","7","9"]]

print(solution.isValidSudoku(board1))  // 输出: true

let board2: [[Character]] = [["8","3",".",".","7",".",".",".","."]
                           ,["6",".",".","1","9","5",".",".","."]
                           ,[".","9","8",".",".",".",".","6","."]
                           ,["8",".",".",".","6",".",".",".","3"]
                           ,["4",".",".","8",".","3",".",".","1"]
                           ,["7",".",".",".","2",".",".",".","6"]
                           ,[".","6",".",".",".",".","2","8","."]
                           ,[".",".",".","4","1","9",".",".","5"]
                           ,[".",".",".",".","8",".",".","7","9"]]

print(solution.isValidSudoku(board2))  // 输出: false
