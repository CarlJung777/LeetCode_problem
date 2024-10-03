class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var result = ""
        var carry = 0
        
        let aChars = Array(a)
        let bChars = Array(b)
        // 字符串 转换成 字符数组，这样可以通过索引访问每个字符

        var i = aChars.count - 1
        var j = bChars.count - 1
        //  从最后一个字符开始遍历字符串
        //  所以 while 循环中每次都是 - 1
        

        
        while i >= 0 || j >= 0 || carry > 0 {
            let digitA = i >= 0 ? Int(String(aChars[i]))! : 0
            let digitB = j >= 0 ? Int(String(bChars[j]))! : 0
            // 三元运算 condition ? trueExpression : falseExpression
            // 如果 i 或者 j 大于 0，就从 xChars[i] 中取出字符，将其转为字符串，再转为整数
            
            let sum = digitA + digitB + carry

            carry = sum / 2
            // 当 sum 为 2 或 3 时，会产生进位（carry）。

            result = "\(sum % 2)" + result
            // 如果 sum = 0 或 2，sum % 2 = 0，如果 sum = 1 或 3，sum % 2 = 1。
            // sum % 2 结果是整数，所以用 "\(sum % 2)" 转换成字符串


            i -= 1
            j -= 1
            // 更新 index
        }
        
        return result
    }
}


