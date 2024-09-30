class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map { $0 * $0 }.sorted() // 先平方再排序
    }
}
// 使用内置函数的方法 map
//  { $0 * $0 }：这是一个闭包，表示对 nums 中的每个元素进行的操作，$0 是隐式参数名



class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var newArray:[Int] = []
        for num in nums {
            var squareNum = num
            squareNum = squareNum * squareNum
            newArray.append(squareNum)
        }
        newArray.sort()
        return newArray
    }
}
// 遍历数组，每次都执行平方，完成后把结果加入新的数组，然后排序



class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var left = 0
        var right = n - 1

        var result = Array(repeating: 0, count: n) 
        // 创建一个和 nums 一样大小的结果数组

        var index = n - 1 
        // 从结果数组的最后一位开始填充
        
        while left <= right {
            let leftSquare = nums[left] * nums[left]
            let rightSquare = nums[right] * nums[right]
            
            // 将较大的平方值放入结果数组的末尾
            if leftSquare > rightSquare {
                result[index] = leftSquare
                left += 1
            } else {
                result[index] = rightSquare
                right -= 1
            }
            index -= 1
            // 移动到下一个位置
        }
        
        return result
    }
}


// 双指针 时间复杂度 O(n)