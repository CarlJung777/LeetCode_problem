class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: temperatures.count)  // 初始化答案数组，默认值为0
        var stack: [Int] = []  // 栈，用于存储温度的索引
        
        // 遍历温度数组
        for i in 0..<temperatures.count {
            // 当栈不为空且当前温度比栈顶的温度高时
            while !stack.isEmpty && temperatures[i] > temperatures[stack.last!] {
                let prevIndex = stack.removeLast()  // 弹出栈顶索引
                answer[prevIndex] = i - prevIndex  // 计算等待天数
            }
            // 将当前温度的索引入栈
            stack.append(i)
        }
        
        return answer
    }
}
// 栈中存放的是还没有找到更高温度的天数索引。栈里的温度是 递减 的顺序，确保栈顶元素是最需要找到更高温度的天数。
// 一旦遇到比栈顶温度高的值，就说明栈顶温度找到了解决方案，出栈并计算差值。
// 每个元素最多被压栈和弹栈各一次，所以时间复杂度是 𝑂(𝑛)



// Brute Force 
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: temperatures.count)
        
        for i in 0..<temperatures.count {
            for j in (i + 1)..<temperatures.count {
                if temperatures[j] > temperatures[i] {
                    answer[i] = j - i
                    break
                }
            }
        }
        
        return answer
    }
}
