class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var majority: [Int : Int ] = [:]
        // 创建空字典计算 Key 数字对应的 value 次数

        let size = nums.count
        //  获取 nums 数组的大小

        for num in nums {
            if let count = majority[num] {
                majority[num] = count + 1
            // 如果有这个字典有这个数字就 + 1 
            } else {
                majority[num] = 1 
            // 没有这个数字，就把它加进字典，计数为 1
            }
            if majority[num]! > size / 2 {
            // majority[num]! 强制解包    
            // 判断这个数字对应的 value 次数是不是大于数组的一半    
                return num  
            }
        }
        return -1
    }
}

// 解包（unwrapping）
// 可选类型（optinal）表示一个变量： 要么有值 或者为 nil
// 使用可选类型时，swift 会强制要求解包，保证不会因为变量为 nil 而崩溃
// 例子 ： var name: String?  这里 name 可能是 String 或者 nil

// 使用 ！强制解包（force unwrapping），但是如果可选值是 nil ，就会出现运行时错误
// 使用 if let 或 guard let  可选绑定（optional binding）安全解包