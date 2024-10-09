class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // Step 1: 统计每个元素的频率
        var frequencyDict: [Int: Int] = [:]
        for num in nums {
            frequencyDict[num, default: 0] += 1
        }
        
        // Step 2: 使用最小堆来存储前 k 个最频繁的元素
        let sortedElements = frequencyDict.sorted { $0.value > $1.value }
        return Array(sortedElements.prefix(k).map { $0.key })
    }
}

// 测试用例
let solution = Solution()
print(solution.topKFrequent([1, 1, 1, 2, 2, 3], 2))  // 输出: [1, 2]
print(solution.topKFrequent([1], 1))                 // 输出: [1]


class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // Step 1: 统计每个元素的频率
        var frequencyDict: [Int: Int] = [:]
        for num in nums {
            frequencyDict[num, default: 0] += 1
        }
        
        // Step 2: 使用桶排序来存储不同频率的元素
        var buckets: [[Int]] = Array(repeating: [], count: nums.count + 1)
        for (num, freq) in frequencyDict {
            buckets[freq].append(num)
        }
        
        // Step 3: 从高频到低频遍历桶，获取前 k 个频率最高的元素
        var result: [Int] = []
        for i in stride(from: buckets.count - 1, through: 0, by: -1) {
            for num in buckets[i] {
                result.append(num)
                if result.count == k {
                    return result
                }
            }
        }
        
        return result
    }
}

// 测试用例
let solution = Solution()
print(solution.topKFrequent([1, 1, 1, 2, 2, 3], 2))  // 输出: [1, 2]
print(solution.topKFrequent([1], 1))                 // 输出: [1]