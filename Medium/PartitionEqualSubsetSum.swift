class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let totalSum = nums.reduce(0, +)
        
        // 如果总和是奇数，则不能分成两部分
        if totalSum % 2 != 0 {
            return false
        }
        
        let target = totalSum / 2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true // 0可以总是通过不选择任何元素来形成

        for num in nums {
            for j in stride(from: target, through: num, by: -1) {
                dp[j] = dp[j] || dp[j - num]
            }
        }
        
        return dp[target]
    }
}
