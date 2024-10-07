class Solution {
    func longestPalindrome(_ s: String) -> String {
        let sArray = Array(s) // 将字符串转为字符数组
        let n = sArray.count
        if n == 0 { return "" }

        var start = 0, end = 0

        // 用来扩展回文串的函数
        func expandAroundCenter(_ left: Int, _ right: Int) -> (Int, Int) {
            var left = left
            var right = right
            while left >= 0 && right < n && sArray[left] == sArray[right] {
                left -= 1
                right += 1
            }
            // 返回扩展后的左右边界（注意 left 和 right 已经多走了一步）
            return (left + 1, right - 1)
        }

        // 遍历每个字符，尝试作为回文的中心
        for i in 0..<n {
            // 情况1：一个字符为中心，奇数长度回文
            let (left1, right1) = expandAroundCenter(i, i)
            if right1 - left1 > end - start {
                start = left1
                end = right1
            }

            // 情况2：两个字符为中心，偶数长度回文
            if i < n - 1 {
                let (left2, right2) = expandAroundCenter(i, i + 1)
                if right2 - left2 > end - start {
                    start = left2
                    end = right2
                }
            }
        }

        // 截取并返回最长回文子串
        return String(sArray[start...end])
    }
}




class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty { return "" }
        
        let chars = Array(s)
        var start = 0
        var end = 0
        
        for i in 0..<chars.count {
            let len1 = expandAroundCenter(chars, left: i, right: i)
            let len2 = expandAroundCenter(chars, left: i, right: i + 1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        
        return String(chars[start...end])
    }
    
    private func expandAroundCenter(_ chars: [Character], left: Int, right: Int) -> Int {
        var L = left
        var R = right
        while L >= 0 && R < chars.count && chars[L] == chars[R] {
            L -= 1
            R += 1
        }
        return R - L - 1
    }
}