class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var frequency = [Int](repeating: 0, count: 26)
        for task in tasks {
            let index = Int(task.asciiValue! - Character("A").asciiValue!)
            frequency[index] += 1
        }
        
        let maxFreq = frequency.max() ?? 0
        let maxFreqCount = frequency.filter { $0 == maxFreq }.count
        let baseTime = (maxFreq - 1) * (n + 1) + maxFreqCount
        
        return max(baseTime, tasks.count)
    }
}



class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var taskCounts = [Int](repeating: 0, count: 26)  // 用于记录每个任务的出现次数
        for task in tasks {
            taskCounts[Int(task.asciiValue! - Character("A").asciiValue!)] += 1
        }
        
        // 找到出现次数最多的任务
        let maxCount = taskCounts.max()!
        
        // 计算最多任务的数量
        var maxFreqTasks = 0
        for count in taskCounts {
            if count == maxCount {
                maxFreqTasks += 1
            }
        }
        
        // 计算最少的间隔时间
        let partCount = maxCount - 1
        let emptySlots = partCount * (n - (maxFreqTasks - 1))
        let availableTasks = tasks.count - maxFreqTasks * maxCount
        let idles = max(0, emptySlots - availableTasks)
        
        return tasks.count + idles
    }
}
