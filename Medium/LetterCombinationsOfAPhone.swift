class Solution {
    let phone: [Character: [Character]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    
    func letterCombinations(_ digits: String) -> [String] {
        var result: [String] = []
        if digits.isEmpty {
            return result
        }
        
        func dfs(_ current: String, _ index: Int) {
            if index == digits.count {
                result.append(current)
                return
            }
            
            let digit = digits[digits.index(digits.startIndex, offsetBy: index)]
            guard let letters = phone[digit] else { return }
            for letter in letters {
                dfs(current + String(letter), index + 1)
            }
        }
        
        dfs("", 0)
        return result
    }
}