class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        for right in 0..<nums.count {
            if nums[right] != 0 {
                (nums[left], nums[right]) = (nums[right], nums[left])
                left += 1
            }
        }
    }
}

// 使用双指针
// 时间复杂度：O(n)，因为遍历整个数组一次。
// 空间复杂度：O(1)，只用了常量空间存储两个指针 left 和 right
// inout 关键字让函数可以直接修改传入的变量
// 调用时需要使用 & 例：moveZeroes(&nums) 
// 不能将常量或字面量传递给 inout 参数，因为这些值无法被修改

// Argument Label: 用于函数调用时，标识传递给函数的每个参数的含义
// Parameter Name: 用于函数内部的变量名，处理函数逻辑时使用
func greet(person name: String, from city: String) {
    print("Hello \(name)! How's the weather in \(city)?")
}
greet(person: "Alice", form: "New York")
// person 和 from 是 argument labels（参数标签），需要在调用函数时使用它们
// name 和 city 是 parameter names（参数名），在函数内部使用