class Solution {
    func sortColors(_ nums: inout [Int]) {
        var low = 0
        var mid = 0
        var high = nums.count - 1

        while mid <= high {
            if nums[mid] == 0 {
                nums.swapAt(low, mid)
                low += 1
                mid += 1
            } else if nums[mid] == 1 {
                mid += 1
            } else {
                nums.swapAt(mid, high)
                high -= 1
            }
        }
    }
}
// Dutch National Flag Problem