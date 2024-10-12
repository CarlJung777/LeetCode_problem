// Hash Table     Two Pointers     Sliding Window     String
 
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Len = s1.count
        let s2Len = s2.count
        
        // 如果 s1 比 s2 长，则不可能包含 s1 的排列
        if s1Len > s2Len {
            return false
        }
        
        // 将字符串转换为字符数组
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)
        
        // 记录 s1 中字符的频率
        var s1Count = [Int](repeating: 0, count: 26)
        for char in s1Chars {
            s1Count[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        // 记录滑动窗口中 s2 字符的频率
        var windowCount = [Int](repeating: 0, count: 26)
        for i in 0..<s1Len {
            windowCount[Int(s2Chars[i].asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        // 如果初始窗口就匹配，则返回 true
        if windowCount == s1Count {
            return true
        }
        
        // 移动滑动窗口
        for i in s1Len..<s2Len {
            // 添加新的字符到窗口
            windowCount[Int(s2Chars[i].asciiValue! - Character("a").asciiValue!)] += 1
            // 移除窗口中最左边的字符
            windowCount[Int(s2Chars[i - s1Len].asciiValue! - Character("a").asciiValue!)] -= 1
            
            // 检查窗口是否匹配
            if windowCount == s1Count {
                return true
            }
        }
        
        return false
    }
}






class Soluution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let len1 = s1.count, len2 = s2.count
        
        // s1 比 s2 长时，不可能有排列出现
        if len1 > len2 {
            return false
        }
        
        let s1Array = Array(s1), s2Array = Array(s2)
        var s1Count = [Int](repeating: 0, count: 26)
        var s2Count = [Int](repeating: 0, count: 26)
        
        // 初始化 s1 和 s2 的频率表
        for i in 0..<len1 {
            //  将 s1Array[i] 这个字符在 s1Count 数组中对应的位置
            // （通过字母的 ASCII 值映射到数组的索引）计数加 1，以记录 s1 中每个字符出现的次数
            //  假设 s1Array[i] 是 'c'，则 'c' 的 ASCII 值是 99，减去 'a' 的 ASCII 值 97
            //  结果是 2，这样 'c' 就对应数组中的索引 2
            s1Count[Int(s1Array[i].asciiValue! - Character("a").asciiValue!)] += 1
            s2Count[Int(s2Array[i].asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        // 如果最初的窗口就匹配
        if s1Count == s2Count {
            return true
        }
        
        // 移动窗口
        for i in len1..<len2 {
            s2Count[Int(s2Array[i].asciiValue! - Character("a").asciiValue!)] += 1
            s2Count[Int(s2Array[i - len1].asciiValue! - Character("a").asciiValue!)] -= 1
            
            // 每次检查新窗口是否匹配
            if s1Count == s2Count {
                return true
            }
        }
        
        return false
    }
}
