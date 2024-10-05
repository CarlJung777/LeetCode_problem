class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        // 创建一个空数组

        let mappings: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        // 字典： Key 对应 Value

        for char in s {
        //遍历目标字符串    
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else {
                if stack.isEmpty {
                    return false
                }

                let topChar = stack.removeLast()
                let expectedChar = mappings[char]

                if topChar != expectedChar {
                    return false
                }
            }
            // 把目标字符串中对应字典的value的值压入stack中
            //遇到对应的Key就去用mappings[char]获取对应的value
            //stack.removeLast()取出了刚才压入的v值，然后对比得出结果
        }

        return stack.isEmpty
    }
}