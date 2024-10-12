//  array      binary search   
   
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let mid = (left + right) / 2
            // 如果中间值大于右边界，说明最小值在右半部分
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                // 否则，最小值在左半部分或者是中间值
                right = mid
            }
        }
        
        // 当左右指针相遇时，最小值就是这个位置的值
        return nums[left]
    }