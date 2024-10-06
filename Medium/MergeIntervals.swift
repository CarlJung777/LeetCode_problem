class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // 先对区间按起始值进行排序
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var merged: [[Int]] = []
        
        for interval in sortedIntervals {
            // 如果结果数组为空或当前区间与上一个区间不重叠，直接添加
            if merged.isEmpty || merged.last![1] < interval[0] {
                merged.append(interval)
            } else {
                // 否则合并当前区间和上一个区间
                merged[merged.count - 1][1] = max(merged.last![1], interval[1])
            }
        }
        
        return merged
    }
}
