// Sliding Window     Hash Table    String

func minWindow(_ s: String, _ t: String) -> String {
    let sArray = Array(s)
    let tArray = Array(t)
    
    // 记录 t 中每个字符的频率
    var tCount: [Character: Int] = [:]
    for char in tArray {
        tCount[char, default: 0] += 1
    }

    // 用于记录滑动窗口中字符的频率
    var windowCount: [Character: Int] = [:]
    
    var have = 0
    let need = tCount.count
    var left = 0
    var right = 0
    var res: (start: Int, len: Int) = (-1, Int.max)  // 记录最小窗口的起点和长度
    
    // 开始滑动窗口
    while right < sArray.count {
        let rightChar = sArray[right]
        windowCount[rightChar, default: 0] += 1
        
        // 如果当前字符的频率满足了 t 中的要求
        if let requiredFreq = tCount[rightChar], windowCount[rightChar] == requiredFreq {
            have += 1
        }
        
        // 当 have 满足了 need（即当前窗口包含了 t 中所有字符）
        while have == need {
            // 更新最小窗口
            if right - left + 1 < res.len {
                res = (left, right - left + 1)
            }
            
            // 尝试缩小窗口
            let leftChar = sArray[left]
            windowCount[leftChar]! -= 1
            if let requiredFreq = tCount[leftChar], windowCount[leftChar]! < requiredFreq {
                have -= 1
            }
            left += 1
        }
        
        // 移动右指针扩大窗口
        right += 1
    }
    
    return res.len == Int.max ? "" : String(sArray[res.start..<res.start + res.len])
}
