class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
}

// 二分查找 
// 先初始化左右边界变量的index
// 因为目标数组是升序，所以使用 Wille left <= right 的时候进行循环


// 然后找数组中间位置
// 如果直接使用 let mid = (left + right) / 2 
// 在left + right都是非常大的数字的情况下，可能出现正数益处
// right - left 计算搜索范围大小
// (right - left) / 2 计算这个范围的一半，也就是 left 到 mid 的偏移量
// left + (right - left) / 2 最后加上偏移量得到了 mid


// 如果刚好是中间数字就直接返回
// 如果中间数字小于目标数字，那么就把 left 赋值为 mid + 1 
// 如果中间数字大于目标数字，那么就把 right 赋值为 mid - 1 
// 这样每次循环都是从数组的中间开始判断