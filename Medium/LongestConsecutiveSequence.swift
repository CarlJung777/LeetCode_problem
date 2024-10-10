class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var longestStreak = 0
        
        for num in numSet {
            // Check if it's the start of a sequence
            if !numSet.contains(num - 1) {
                var currentNum = num
                var currentStreak = 1
                
                // Count consecutive numbers
                while numSet.contains(currentNum + 1) {
                    currentNum += 1
                    currentStreak += 1
                }
                
                longestStreak = max(longestStreak, currentStreak)
            }
        }
        
        return longestStreak
    }
}

// Example usage:
let solution = Solution()
print(solution.longestConsecutive([100, 4, 200, 1, 3, 2])) // Output: 4
print(solution.longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1])) // Output: 9
