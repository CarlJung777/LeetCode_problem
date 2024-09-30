class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numToIndex = [Int: Int]()
        //  需要一个字典存储数字和对应的index

        for (index, num) in nums.enumerated() {
            let complement = target - num
            if let complementIndex = numToIndex[complement] {
            // 安全解包（optional binding）    

                return [complementIndex, index]
            }
            numToIndex[num] = index
            //每次循环 如果 complement 数字不存在的话，将当前数字存入字典，以备后用
        }

        fatalError("No solution")
    }
}


