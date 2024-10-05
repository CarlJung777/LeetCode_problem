class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        // 如果会议为空或者只有一个会议，直接返回true
        if intervals.count <= 1 {
            return true
        }
        
        // 按照会议开始时间排序
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        
        // 检查是否有重叠
        for i in 1..<sortedIntervals.count {
            if sortedIntervals[i][0] < sortedIntervals[i-1][1] {
                return false
            }
        }
        return true
    }
}

// Input: [[0,30],[5,10],[15,20]]
// Output: false

// Input 经过 intervals.sorted { $0[0] < $1[0] } 排序后变为 [[0, 30], [5, 10], [15, 20]]
// 然后用 sortedIntervals  Index 1 的第一个时间和 Index 0 的第二个时间对比
// 如果满足第一时间小于前面的第二个时间，就返回 false 
// 依次循环完毕整个 sortedIntervals 没有 false ，就返回 true