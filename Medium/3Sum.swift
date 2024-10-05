class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let sortedNums = nums.sorted()

        // 使用 i 遍历排序后的数组，作为三元组的第一个元素
        for i in 0..<sortedNums.count {
            // 如果当前元素与前一个元素相同，则跳过该元素，以避免生成重复的三元组
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }

            // 双指针初始化
            var left = i + 1
            var right = sortedNums.count - 1
            
            // 当 left 指针小于 right 指针时，计算三数之和        
            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]

                if sum == 0 {
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        right -= 1
                    }

                    left += 1
                    right -= 1                  
                } else if sum < 0 {
                    // 移动 left 指针向右，以增大和
                    left += 1
                } else {
                    // 移动 right 指针向左，以减小和
                    right -= 1
                }  
            }
        }
        return result
    }
}


// 排序数组 方便跳过重复元素，更有效的使用双指针
// 外层循环使用一个指针 i 遍历每个元素 ，这个元素后面的两个元素 left right 用来补全三元组
// 初始化两个指针 left 当前元素后面的第一个元素      right 指向数组的最后一个元素
