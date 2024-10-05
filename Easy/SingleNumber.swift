class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
    let distinctNums = Set(nums)
    return distinctNums.reduce(0, +) * 2 - nums.reduce(0, +)
    }
}
// 使用 set type 去除数组的重复值
// distinctNums.reduce(0, +) 使用 reduce 函数计算 Set 中所有唯一数字的和
// 然后翻倍减去 nums.reduce(0, +) 原始数组的总和，剩下就是缺失的数字


class Sloution  {
    func singleNumber(_ nums: [Int]) -> Int {
        var uniqueNumber = 0
        for num in nums {
            uniqueNumber ^=num
        }
        return uniqueNumber
    }
}
// 使用逻辑异或（Exclusive or）XOR
// 时间复杂度 O(n): 只遍历一次数组
// 空间复杂度 O(1)：只使用一个变量