class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let filteredString = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return filteredString == String(filteredString.reversed()) 
    }
}