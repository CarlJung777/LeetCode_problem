// array     binary search     matrix

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count     // 行数
        let n = matrix[0].count  // 列数
        
        var left = 0
        var right = m * n - 1
        
        while left <= right {
            let mid = (left + right) / 2
            let midValue = matrix[mid / n][mid % n]
            
            if midValue == target {
                return true
            } else if midValue < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return false
    }
}