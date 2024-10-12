func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    var left = 1
    var right = piles.max()! // 最大香蕉堆的数量即为最大速度上限
    
    // Helper 函数：计算以 k 速度吃完所有香蕉需要的时间
    func canFinish(_ k: Int) -> Bool {
        var hours = 0
        for pile in piles {
            // 向上取整，即每堆需要多少小时
            hours += (pile + k - 1) / k
        }
        return hours <= h
    }
    
    // 二分查找最小速度
    while left < right {
        let mid = (left + right) / 2
        if canFinish(mid) {
            right = mid // 尝试更慢的速度
        } else {
            left = mid + 1 // 需要更快的速度
        }
    }
    
    return left
}
