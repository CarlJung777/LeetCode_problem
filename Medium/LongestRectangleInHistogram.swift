// monotonic stack    stack     array

func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea = 0
    var stack: [Int] = []  // 用于存储索引
    let heights = heights + [0]  // 在数组末尾添加一个 0，以便处理完栈中所有元素

    for i in 0..<heights.count {
        // 如果当前高度小于栈顶所指高度，开始计算面积
        while let last = stack.last, heights[i] < heights[last] {
            let h = heights[stack.removeLast()]  // 弹出栈顶并获取高度
            let w = stack.isEmpty ? i : i - stack.last! - 1  // 宽度根据栈是否为空决定
            maxArea = max(maxArea, h * w)  // 更新最大面积
        }
        stack.append(i)  // 将当前索引压入栈中
    }

    return maxArea
}




func LULULULUlargestRectangleArea(_ heights: [Int]) -> Int {
    var stack: [Int] = []
    var maxArea = 0
    let n = heights.count

    for i in 0...n {
        let h = (i == n ? 0 : heights[i])
        while !stack.isEmpty && heights[stack.last!] > h {
            let height = heights[stack.removeLast()]
            let width = stack.isEmpty ? i : i - stack.last! - 1
            maxArea = max(maxArea, height * width)
        }
        stack.append(i)
    }

    return maxArea
}
