class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }

        var dp = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2

        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }

        return dp[n]
    }
}
// 每次只依赖前两个状态（前两级台阶的方法数），然后通过迭代依次推导出后续结果。
// 时间复杂度：O(n)，因为循环从3到n，计算每一级台阶的方法数。
// 空间复杂度：O(n)，因为我们使用了一个长度为 n+1 的数组来存储中间结果。
// 动态规划（Dynamic Programming）,将问题拆成更小的问题