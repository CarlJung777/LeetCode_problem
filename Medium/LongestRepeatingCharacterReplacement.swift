// Sliding Window      String      Hash Table

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var charCount = [Character: Int]()  // 用于统计窗口内各字符的频率
        var maxCount = 0  // 记录窗口内出现最多的字符的频率
        var left = 0  // 滑动窗口的左边界
        var result = 0  // 最终结果（最长的子串长度）
        
        let chars = Array(s)  // 将字符串转为字符数组
        
        for right in 0..<chars.count {
            charCount[chars[right], default: 0] += 1
            maxCount = max(maxCount, charCount[chars[right]]!)
            
            // 如果窗口长度减去出现最多的字符的频率大于 k，说明需要缩小窗口
            while (right - left + 1) - maxCount > k {
                charCount[chars[left]]! -= 1
                left += 1
            }
            
            // 更新结果为当前窗口的最大长度
            result = max(result, right - left + 1)
        }
        
        return result
    }
}
