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

        var charCount = [Character: Int]()

        for char in s {
            charcount[char, default: 0] += 1
        }

        for char in t {
            charCount[char, default: 0] -= 1

            if chaCount[char] < 0 {
                return false
            }
        }
        return ture
    }
}
