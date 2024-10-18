class Solution {
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var current = [String]()
        let characters = Array(s)  // 将字符串转化为字符数组
        
        func isPalindrome(_ start: Int, _ end: Int) -> Bool {
            var left = start
            var right = end
            while left < right {
                if characters[left] != characters[right] {
                    return false
                }
                left += 1
                right -= 1
            }
            return true
        }
        
        func backtrack(_ start: Int) {
            if start == characters.count {
                result.append(current)
                return
            }
            
            for end in start..<characters.count {
                if isPalindrome(start, end) {
                    current.append(String(characters[start...end]))
                    backtrack(end + 1)
                    current.removeLast()
                }
            }
        }
        
        backtrack(0)
        return result
    }
}

// 测试
let solution = Solution()
let s1 = "aab"
print(solution.partition(s1)) // 输出: [["a","a","b"],["aa","b"]]

let s2 = "a"
print(solution.partition(s2)) // 输出: [["a"]]
