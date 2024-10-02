class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var leeterCounts = [Character : Int] ()

        for letter in magazine {
            letterCounts[letter, default: 0] += 1
        }

        for letter in ransomNote {
            if let count = letterCounts[letter], count > 0 {
                letterCounts[letter]! -= 1
            }  else {
                return false
            }
        }
        return true
    }
}