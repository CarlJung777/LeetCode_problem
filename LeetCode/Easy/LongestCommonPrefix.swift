class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstStr = strs.first else {
            return ""
        }
        // 检查数组 strs 是否为空

        var commonPrefix = ""
        for (index, char) in firstStr.enumerated() {
            for str in strs {
                if index >= str.count || str[str.index(str.startIndex, offsetBy: index) != char] {
                    return commonPrefix
                // str.startIndex     str的第一个字符索引

                // str.index(str.startIndex, offsetBy: index) 
                // 计算从 str 开始位置起偏移 index 个位置后的字符索引   

                // str[]   使用 Swift 字符串的下标语法 [ ] 来获取 str 字符串在该索引位置的字符
                // 这个 if 语句的 condition 就是检查是否 index 超出了当前 str 的长度
                // 然后获取 str 字符串中从 startIndex 起偏移 index 位置的字符和当前的 char 进行比较
                }
            }
            commonPrefix.append(char)
        }
        return commonPrefix
    }
}
// 外循环遍历 firstStr 字符，同时获取当前字符的 Index
// 内循环遍历字符串数组，检查数组里的每个元素 str

// 时间复杂度 O(m * n): 其中 m 是第一个字符串的长度，n 是字符串数组的长度。在最坏情况下，所有字符串都相同。
// 空间复杂度 O(1): 仅使用了固定的额外空间（存储公共前缀）

// swift 的 String 是基于 Unicode 标量表示的，不像其他语言那样直接通过整数下标访问字符
// 因此，Swift 需要通过 String.Index 类型的索引来获取某个字符的位置。







class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // 如果字符串数组为空，直接返回空字符串
        guard let firstStr = strs.first else {
            return ""
        }

        // 遍历 firstStr 中的每个字符和索引
        for (i, char) in firstStr.enumerated() {
            // 对每个字符串进行比较
            for str in strs {
                // 如果某个字符串长度不够，或字符不匹配，返回当前匹配的前缀
                if i >= str.count || str[str.index(str.startIndex, offsetBy: i)] != char {
                    return String(firstStr.prefix(i))
                }
            }
        }
        
        // 如果遍历完第一个字符串都没有提前返回，说明整个第一个字符串就是公共前缀
        return firstStr
    }
}
// 与第一个 class 相比取消了 var commonPrefix = ""






class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstStr = strs.first else {
            return ""
        }

        var prefix = firstStr
        for str in strs {
            while !str.hasPrefix(prefix) {
            // 用 hasPrefix 方法检查当前字符串是否有公共前缀  prefix  
                prefix = String(prefix.dropLast)
                // 用 String(prefix.dropLast) 删除最后一个字符串
                if prefix.isEmpty {
                    return ""
                }
            }
        }
        return prefix 
    }
}




class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstStr = strs.first else {
            return ""
        }

        var low = 0  // 前缀最短长度
        var high = firstStr.count //前缀最大长度

        while low <= high {
            let mid = (left + right) / 2

            let prefix = String(firstStr.prefix(mid))
            // 获取 firstStr 的前缀，长度时 mid

            if strs.allSatisfy({ $0.hasPrefix(prefix)}) {   
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return String(firstStr.prefix((low + high) / 2))
        // prefix 返回的值实际上是 Substring 类型（即子字符串）
        // 所以通过 String(...) 将其转换为 String 类型
    }
}
// 二分查找
// array.allSatisfy { condition } 检查数组是否满足给定条件 boolean
// {$0.hasPrefix(prefix)} 闭包（closure）
// $0 是闭包的第一个参数的简写，在这里 $0 代表数组中的每一个元素（即字符串 str）

// Substring 不会拷贝原始字符串的数据，而是直接引用原始字符串的内存
// 需要长期保留一个 Substring 时，通常会把它转化为 String
// 因为字符串是引用计数的，而子字符串的生命周期通常和原始字符串一致