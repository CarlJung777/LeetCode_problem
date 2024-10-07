// Dynamic Programming
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // 创建二维数组 dp，用于存储每个位置的路径数
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        // 遍历每个格子，跳过第一行和第一列，因为它们只有1种路径
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        
        // 返回右下角的路径数
        return dp[m - 1][n - 1]
    }
}
