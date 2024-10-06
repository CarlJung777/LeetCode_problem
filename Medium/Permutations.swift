class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []  // 存储所有排列结果
        var current: [Int] = []    // 当前排列

        // 回溯函数
        func backtrack(_ used: [Bool]) {

            // Base Case
            if current.count == nums.count {
                result.append(current)  // 找到一个有效的排列，添加到结果中
                return
            }

            // 遍历每个数字
            for i in 0..<nums.count {
                if used[i] { continue } // 如果当前数字已经使用，跳过

                current.append(nums[i])  // 添加当前数字
                var newUsed = used
                newUsed[i] = true  // 标记当前数字为已使用

                backtrack(newUsed)  // 递归调用，继续构建排列

                current.removeLast() // 回溯，移除最后一个数字
            }
        }

        backtrack(Array(repeating: false, count: nums.count)) // 初始化标记数组并开始回溯
        return result
    }
}


// 回溯算法（Backtracking）

// 确定 Base Case 递归结束的条件，防止无限递归
// 递归调用 Recursive Case