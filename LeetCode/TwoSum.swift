class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numToIndex = [Int: Int]()

        for (index, num) in nums.enumerated() {
            let complement = target - num
            if let complementIndex = numToIndex[complement] {
                return [complementIndex, index]
            }
            numToIndex[num] = index
        }

        fatalError("No solution")
    }
}
