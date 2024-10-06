class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []  // 用于存储结果的数组
        var combination: [Int] = []  // 当前组合的数组
        
        // 回溯函数
        func backtrack(_ remaining: Int, _ start: Int) {

            // Base Case 递归结束条件，防止无限循环
            if remaining == 0 {
                result.append(combination)  // 找到一个有效组合，添加到结果中
                return
            } else if remaining < 0 {
                return  // 如果剩余值小于 0，返回
            }
            
            // 遍历候选数字
            for i in start..<candidates.count {
                combination.append(candidates[i])  // 将当前数字添加到组合中

                // 递归调用（Recursive Case），允许重复使用当前数字
                // remaining - candidates[i] 剩余数字减去当前数字，然后从当前位置再开始
                backtrack(remaining - candidates[i], i) 
                combination.removeLast() // 回溯，移除最后一个数字
            }
        }
        
        backtrack(target, 0) // 从目标值开始回溯
        return result
    }
}

// 回溯算法（Backtracking）
