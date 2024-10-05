class Solution {
    func insert(_ intervals: [[Int]], newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()   // 储存结果
        var i = 0  // 计数器，用来遍历数组
        let n = intervals.count // 获取数组的元素数量


        // 添加所有在 newInterval 前且不重叠的区间
        while i < n && intervals[i][1] < newInterval[0] {
            result.append(intervals[i])
            i += 1
        }

        // 合并所有与 newInterval 重叠的区间
        var newInterval = newInterval
        while i < n && intervals[i][0] <= newInterval[1] {
            newInterval[0] = min(newInterval[0], intervals[i][0])
            newinterval[1] = max(newInterval[1], intervals[i][1])
            i += 1
        }
        resrlt.append(newInterval)

        // 添加所有在 newInterval 后的区间
        while i < n {
            result.append(intervals[i])
            i += 1
        }

        return result
    }
}