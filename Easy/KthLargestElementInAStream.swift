class KthLargest {
    private var minHeap: [Int] = [] // 用于存储前 k 大的元素
    private var k: Int // 目标 k 值

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        
        // 添加初始的分数到最小堆
        for num in nums {
            add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
        // 将新分数添加到堆中
        minHeap.append(val)
        // 维护最小堆的大小，确保堆的大小不超过 k
        if minHeap.count > k {
            // 移除最小的元素
            minHeap.sort() // 将数组排序（O(n log n)），然后去掉最小的
            minHeap.removeFirst() // 去掉第一个元素
        }
        return minHeap.min() ?? Int.min // 返回当前的 k 大元素
    }
}