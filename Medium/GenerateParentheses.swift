class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        
        func backtrack(_ current: String, _ open: Int, _ close: Int) {
            // If the current string has reached the maximum length (2 * n), add it to the result
            if current.count == n * 2 {
                result.append(current)
                return
            }
            
            // If we can still add an opening parenthesis, do so
            if open < n {
                backtrack(current + "(", open + 1, close)
            }
            
            // If we can add a closing parenthesis without breaking balance, do so
            if close < open {
                backtrack(current + ")", open, close + 1)
            }
        }
        
        // Start the backtracking process
        backtrack("", 0, 0)
        
        return result
    }
}