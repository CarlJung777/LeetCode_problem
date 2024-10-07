class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0  // 左指针
        var right = height.count - 1  // 右指针
        var maxArea = 0  // 最大面积
        
        // 当左右指针没有相遇时，进行遍历
        while left < right {
            // 计算当前容器的宽度和高度
            let width = right - left
            let minHeight = min(height[left], height[right])
            
            // 计算当前容器的面积
            let currentArea = width * minHeight
            
            // 更新最大面积
            maxArea = max(maxArea, currentArea)
            
            // 移动指针：移动较小高度的一侧
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea  // 返回最终的最大面积
    }
}





func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    var left = 0
    var right = height.count - 1

    while left < right {
        let area = (right - left) * min(height[left], height[right])
        maxArea = max(maxArea, area)

        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }

    return maxArea
}