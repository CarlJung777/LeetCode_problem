class Solution {
    func findAnagrams(_ s: String,_ p: String) -> [Int] {
        var result = [Int]()
        let sArray = Array(s)
        let pArray = Array(p)

        // s 的长度小于 p，直接返回空数组
        if s.count < p.count {return result}

        // 创建两个数组来记录字符频率
        var sCount = Array(repeating: 0, count: 26)
        var pCount = Array(repeating: 0, count: 26)
        
        // aAscii 用于将字符转换为数组的索引
        // a 的 ASCII 值是 97 ，行代码会将 aAscii 设置为 97
        let aAscii = Int(Chararcter("a").asciiValue!)

        // 统计 p 中的字符频率
        for char in pArray {

            // Int(char.asciiValue!) 获取 char 的 ASCII 值，强制解包，然后从 UInt8 转换为 Int 类型
            // - aAscii 之前 aAscii 定义为 97 ， 对于字符 'a'， 97 - 97 = 0，即 'a' 对应数组的第 0 个位置
            pCount[Int(char.asciiValue!) - aAscii] += 1
        }

        // 遍历 s ，使用滑动窗口
        for i in 0..<sArray.count {
            sCount[Int(sArray[i].asciiValue!) - aAscii] += 1

            if i >= pArray.count {
                 sCount[Int(sArray[i - pArray.count].asciiValue!) - aAscii] -= 1
            }
            
            if sCount == pCount {
                result.append(i - pArray.count + 1)
            }
        }

        return reslut 
    }
}