class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // 字典
        var anagramGroups: [String: [String]] = [:]
        
        for str in strs {
            // 按字母排序 str 然后用 String 转换
            let sortedStr = String(str.sorted())


            if var group = anagramGroups[sortedStr] { // 检查字典中是否有排序后的字符串
                group.append(str) // 存在的话就将当前字符串加入到该组中
                anagramGroups[sortedStr] = group // 更新字典中的该组
            } else {
                anagramGroups[sortedStr] = [str] // 如果不存在，创建新的组并将字符串加入
            }
        }
        
        return Array(anagramGroups.values)  // 返回所有的字母异位词分组
    }
}
