func lengthOfLongestSubstring(_ s: String) -> Int {
    var charSet = Set<Character>()  // 用于存储当前窗口的字符
    var left = 0  // 左指针 窗口起始位置
    var maxLength = 0  // 最长子字符串长度

    let characters = Array(s)  // 将字符串转换为字符数组以便索引

    for right in 0..<characters.count {  // 右指针遍历字符串
        // 当遇到重复字符时，收缩窗口
        while charSet.contains(characters[right]) {
            charSet.remove(characters[left])  // 移除左边字符
            left += 1  // 左指针向右移动
        }
        
        charSet.insert(characters[right])  // 添加当前字符到集合
        maxLength = max(maxLength, right - left + 1)  // 更新最大长度
    }
    
    return maxLength  // 返回最长子字符串的长度
}



func lengthOfLongestSubstring(_ s: String) -> Int {
    var characters = [Character: Int]()
    var start = 0 //表示当前无重复字符子字符串的起始位置
    var maxLength = 0

    // 用 enumerated() 方法遍历字符串 s，获取每个字符及其对应的索引。index 是字符的索引，char 是字符
    for (index, char) in s.enumerated() {
        if let lastIndex = characters[char] {
            start = max(start, lastIndex + 1)
        }
        characters[char] = index
        maxLength = max(maxLength, index - start + 1)
    }

    return maxLength
}

// 滑动窗口，实时维护一个无重复字符的窗口，窗口的起始位置（start）会调整到重复字符的下一个位置