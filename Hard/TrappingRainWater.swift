class Solution {
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        var leftMax = Array(repeating: 0, count: n)
        var rightMax = Array(repeating: 0, count: n)
        var puddle = Array(repeating: 0, count: n)

        leftMax[0] = height[0]
        for i in 1..<n {
            leftMax[i] = max(leftMax[i - 1], height[i])
        }

        rightMax[n - 1] = height[n - 1]
        for i in (0..<(n - 1)).reversed() {
            rightMax[i] = max(rightMax[i + 1], height[i])
        }
        var water = 0
        for i in 0..<n {
        puddle[i] = min(leftMax[i], rightMax[i]) - height[i]
        water += puddle[i]
        }
    return water
    }
}


class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else {
            return 0
        }
        
        var left = 0  // 左指针
        var right = height.count - 1  // 右指针
        var leftMax = 0  // 左侧最高的柱子
        var rightMax = 0  // 右侧最高的柱子
        var waterTrapped = 0  // 总的接水量
        
        while left < right {
            if height[left] < height[right] {
                if height[left] >= leftMax {
                    leftMax = height[left]  // 更新左侧最高的柱子
                } else {
                    waterTrapped += leftMax - height[left]  // 计算左侧能接的水
                }
                left += 1
            } else {
                if height[right] >= rightMax {
                    rightMax = height[right]  // 更新右侧最高的柱子
                } else {
                    waterTrapped += rightMax - height[right]  // 计算右侧能接的水
                }
                right -= 1
            }
        }
        
        return waterTrapped
    }
}