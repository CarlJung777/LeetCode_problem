class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let m = mat.count
        let n = mat[0].count
        var result = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        var queue = [(Int, Int)]()

        // 初始化队列，将所有0的坐标加入队列
        for i in 0..<m {
            for j in 0..<n {
                if mat[i][j] == 0 {
                    result[i][j] = 0
                    queue.append((i, j))
                }
            }
        }

        // 定义四个方向：上、下、左、右
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        // 进行广度优先搜索
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            for direction in directions {
                let newX = x + direction.0
                let newY = y + direction.1
                
                // 检查新的坐标是否在矩阵范围内，并且当前距离是否可以更新
                if newX >= 0 && newY >= 0 && newX < m && newY < n && result[newX][newY] > result[x][y] + 1 {
                    result[newX][newY] = result[x][y] + 1
                    queue.append((newX, newY))
                }
            }
        }

        return result
    }
}