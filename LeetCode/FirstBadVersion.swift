class Solution {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n

        while left < right {
            let mid = left + (right - left) / 2
            // (right - left) 先计算范围 ， 再 (right - left) / 2 计算偏移量
            // 再加上 left ，得到中间索引

            if isBadVersion(mid) {
                right = mid // 当前 mid 是版本是坏的，搜索左侧（把当前位置 mid 定义为 right）
            } else {
                left = mid + 1 // 当前 mid 版本没有问题，搜索右侧（把 mid + 1 定义为 left）
            }
        }

        return left 
        
    }
}