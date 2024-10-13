// Sliding Window    Heap(Priority Queue)    Double-ended queue!!

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var deque: [Int] = []  // 双端队列，用于存储索引
    var result: [Int] = [] // 用于存储最终结果
    
    for i in 0..<nums.count {
        // 移除掉超出窗口范围的元素
        if !deque.isEmpty && deque.first! < i - k + 1 {
            deque.removeFirst()
        }
        
        // 移除比当前元素小的队列尾部元素
        while !deque.isEmpty && nums[deque.last!] < nums[i] {
            deque.removeLast()
        }
        
        // 将当前元素索引加入队列
        deque.append(i)
        
        // 窗口大小达到 k 时，队列头部元素是当前窗口的最大值
        if i >= k - 1 {
            result.append(nums[deque.first!])
        }
    }
    
    return result
}
