// 深度优先搜索递归函数（DFS）
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image // 创建图像副本（二维数组），以便后面修改
        let originalColor = image[sr][sc]  // 获取起始位置的颜色

        // 如果起始位置的颜色已经是目标颜色，直接返回图像
        if originalColor == color {
            return image
        }

        // 深度优先搜索递归函数（DFS）    
        func dfs(_ r: Int, _ c: Int) {
            // 检查是否越界或者颜色不匹配
            if r < 0 || r >= image.count || c < 0 || c >= image[0].count || image[r][c] != originalColor {
                return
            }

            // 将当前位置涂成目标颜色
            image[r][c] = color

            // 递归处理四个方向的邻接点
            dfs(r + 1, c) // 向下
            dfs(r - 1, c) // 向上
            dfs(r, c + 1) // 向右
            dfs(r, c - 1) // 向左
        }

        // 从起始位置开始填充
        dfs(sr, sc)

        return image
    }
}


// 创建图像副本，存储修改后的二维数组
// 然后根据已知坐标获取起始位置的值






// 广度优先搜索递归函数（BFS）
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image // 创建可变的图像副本
        let originalColor = image[sr][sc]
        
        // 如果起始颜色和目标颜色相同，直接返回图像
        if originalColor == color {
            return image
        }
        
        // 使用队列进行 BFS
        var queue: [(Int, Int)] = [(sr, sc)]
        let directions: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)] // 四个方向
        
        while !queue.isEmpty {
            let (r, c) = queue.removeFirst() // 取出队列中的第一个元素
            image[r][c] = color // 将当前像素涂上目标颜色
            
            // 遍历四个方向的相邻像素
            for direction in directions {
                let newRow = r + direction.0
                let newCol = c + direction.1
                
                // 检查新坐标是否在图像范围内，且颜色是否与原始颜色相同
                if newRow >= 0 && newRow < image.count && newCol >= 0 && newCol < image[0].count && image[newRow][newCol] == originalColor {
                    queue.append((newRow, newCol)) // 将相邻像素加入队列
                }
            }
        }
        
        return image // 返回修改后的图像
    }
}
