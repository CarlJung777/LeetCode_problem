class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let expectedSum = n * (n + 1) / 2
        let actualSum = nums.reduce(0, +)
        return expectedSum - actualSum
    }
}
// 使用连续整数和公式 sum = n(n+1) / 2
// 时间复杂度 O(n)：需要遍历数组求和 let actualSum = nums.reduce(0, +)
// 空间复杂度 O(1)： 只使用了常量空间




class Solution  {
    func missingNumber(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        for i in 0..<sortedNums.count {
            if sortedNums[i] != i {
                return i
            }
        }
        return sortedNums.count
    }
}
// 先排序后查找
// 时间复杂度 O(n)： 因为排序的时间复杂度是 O(n log n)。
// 空间复杂度 O(1)： 排序操作需要额外的空间。




class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var numSet = Set(0...nums.count)
        for num in nums {
            numSet.remove(num)
        }
        return numSet.first!
    }
}
// 使用 collection type 的 set  
// 时间复杂度 O(n)： 遍历数组
// 空间复杂度 O(n):  需要一个额外的集合。




class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var missing = nums.count
        // 确定最大数字

        for i in 0..<nums.count {
        // 确定索引范围
        
            missing ^= i ^ nums[i]
        }
        return missing
    }
}
//  位运算（XRO）
//  i ^ nums[i]: 先将数组索引 i 和数组中的值 nums[i] 进行异或
//  missing ^= i ^ nums[i]: 然后将 i ^ nums[i] 的结果与 missing 进行异或 

// missing = missing ^ i
// missing = missing ^ nums[i]
// 利用异或运算的结合性（a ^ b ^ c = (a ^ b) ^ c），将这两步合并为一行
// missing ^= i ^ nums[i]