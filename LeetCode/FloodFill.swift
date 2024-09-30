class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        let originalColor = image[sr][sc]

        // 如果起始位置的颜色已经是目标颜色，直接返回图像
        if originalColor == color {
            return image
        }

        // 深度优先搜索递归函数
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
