// array  binary search

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = (left + right) / 2

            // 如果中间元素就是目标值，直接返回其索引
            if nums[mid] == target {
                return mid
            }

            // 判断 mid 是在左侧有序部分还是右侧有序部分
            if nums[left] <= nums[mid] {
                // mid 在左侧有序部分
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                // mid 在右侧有序部分
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }

        // 如果没有找到目标值，返回 -1
        return -1
    }
}

// 时间复杂度 O(log n)     算法的运行时间随着输入规模 n 的增加以对数方式增长
// 每增加一倍的输入规模，运行时间只会增加一个常数，而不是线性增加
// 二分查找  平衡二叉搜索树
// 与 O(n) 时间复杂度相比，O(log n) 的复杂度要更高效
// 在大规模数据集的情况下，O(log n) 的算法能显著减少计算时间
// "对数" 是数学中的一种运算，通常用来表示反向的指数关系
// O(log n) 复杂度，通常基于 2（即二进制），表示的是输入规模每次减半的情况