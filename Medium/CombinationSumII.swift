class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()          // 存储所有符合条件的组合
        var current = [Int]()           // 当前组合
        let sortedCandidates = candidates.sorted()  // 对候选数组进行排序
        
        func backtrack(_ start: Int, _ remainingTarget: Int) {
            // 如果剩余目标为0，说明找到一个符合条件的组合
            if remainingTarget == 0 {
                result.append(current)
                return
            }
            
            // 遍历候选数组，从start开始
            for i in start..<sortedCandidates.count {
                // 跳过重复的元素
                if i > start && sortedCandidates[i] == sortedCandidates[i - 1] {
                    continue
                }
                
                let currentNum = sortedCandidates[i]
                
                // 如果当前数字大于剩余目标，后续数字只会更大，直接剪枝
                if currentNum > remainingTarget {
                    break
                }
                
                // 选择当前数字
                current.append(currentNum)
                
                // 递归调用，注意下一个起点是i+1，因为每个数字只能使用一次
                backtrack(i + 1, remainingTarget - currentNum)
                
                // 撤销选择
                current.removeLast()
            }
        }
        
        // 开始回溯，初始起点为0，剩余目标为target
        backtrack(0, target)
        return result
    }
}

// 测试代码
let solution = Solution()
let test1 = solution.combinationSum2([10,1,2,7,6,1,5], 8)
print("Test 1 Output:", test1) 
// 期望输出: [[], [1,1,6], [1,2,5], [1,7], [2,6]]

let test2 = solution.combinationSum2([2,5,2,1,2], 5)
print("Test 2 Output:", test2) 
// 期望输出: [[1,2,2], [5]]
