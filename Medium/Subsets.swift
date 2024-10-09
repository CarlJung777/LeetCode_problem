// BackTracking 回溯
// Recursion 递归
// Inception
class Solution {
    func subsets(_ nums: [Int]) ->  [[Int]] {
        var result: [[Int]] = []
        var subset: [Int] = []

        func backtrack(_ start: Int) {
            result.append(subset)

            for i in start..<nums.count {
                subset.append(nums[i])
                backtrack(i + 1)

                // 让 subset 回到上一个状态，为了尝试其他可能的组合（如不选当前数字），这就是所谓的“回溯”。
                subset.removeLast()
            }
        }

        backtrack(0)
        return result
    }
}

// Base Case  

// Generalize the pattern

// Recursive Leap of Faith
// Assume simpler cases work out