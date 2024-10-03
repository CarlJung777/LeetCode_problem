// first solution
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool{
        let sortedS = String(s.sorted())
        let sortedT = String(t.sorted())
        if sorteds == sortedT {
            return true
        } else {
            return false
        }
    }
}

//second solution
class Solution {
    func isAnagram (_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        //字符串大小不同直接返回 false

        var charCount = [Character: Int]()
        // 创建字典统计字符出现频率

        for char in s {
            charcount[char, default: 0] += 1
        }
        //用字典先统计一个字符串的字符频率

        for char in t {
            charCount[char, default: 0] -= 1

            if chaCount[char] < 0 {
                return false
            }
            // 如果某个字符在 t 中出现次数超过 s，直接返回 false
            
        }
        //然后用同一个字典统计另一个字符串，

        return ture
    }
}
