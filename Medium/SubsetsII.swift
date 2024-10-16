class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        let sortedNums = nums.sorted()
        
        func backtrack(_ start: Int) {
            // 把当前的子集添加到结果中
            result.append(current)
            
            // 从 start 开始构造子集
            for i in start..<sortedNums.count {
                // 如果当前元素与前一个元素相同且前一个元素未被选择，跳过这个元素以避免重复子集
                if i > start && sortedNums[i] == sortedNums[i - 1] {
                    continue
                }
                // 选择当前元素
                current.append(sortedNums[i])
                // 递归选择下一个元素
                backtrack(i + 1)
                // 撤销选择
                current.removeLast()
            }
        }
        
        // 从第0个元素开始回溯
        backtrack(0)
        return result
    }
}

// 测试代码
let solution = Solution()
print(solution.subsetsWithDup([1, 2, 2]))  // 输出: [[],[1],[1,2],[1,2,2],[2],[2,2]]
print(solution.subsetsWithDup([0]))        // 输出: [[],[0]]
