class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // 字典
        var anagramGroups: [String: [String]] = [:]
        
        for str in strs {
            // 排序 str 然后用 String 转换
            let sortedStr = String(str.sorted())

            
            if var group = anagramGroups[sortedStr] {
                group.append(str)
                anagramGroups[sortedStr] = group
            } else {
                anagramGroups[sortedStr] = [str]
            }
        }
        
        return Array(anagramGroups.values)
    }
}