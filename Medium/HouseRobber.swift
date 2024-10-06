// DP(Dynamic Programming)
class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        guard nums.count > 1 else { return nums[0] }

        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])

        for i in 2..<nums.count {
            dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
        }

        return dp[nums.count - 1]
    }
}



class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        if n == 1 { return nums[0] }
        
        var prev2 = nums[0]
        var prev1 = max(nums[0], nums[1])
        
        for i in 2..<n {
            let current = max(prev1, prev2 + nums[i])
            prev2 = prev1
            prev1 = current
        }
        
        return prev1
    }
}
// 空间复杂度O(1)



class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        if n == 1 { return nums[0] }
        
        // 定义一个辅助函数，用来计算从某个起点开始的最大收益
        func robFrom(_ start: Int) -> Int {
            var prev2 = 0  // 上上个房子的最大收益
            var prev1 = 0  // 上一个房子的最大收益
            
            for i in start..<n {
                let current = max(prev1, prev2 + nums[i])
                prev2 = prev1
                prev1 = current
            }
            
            return prev1
        }
        
        // 分别从第一个房子和第二个房子开始抢劫
        let result1 = robFrom(0)
        let result2 = robFrom(1)
        
        return max(result1, result2)
    }
}