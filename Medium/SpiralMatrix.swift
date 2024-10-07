func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result = [Int]()
    var left = 0
    var right = matrix[0].count - 1
    var top = 0
    var bottom = matrix.count - 1

    while left <= right && top <= bottom {
        // Traverse top row 向左
        for i in stride(from: left, through: right, by: 1) {
            result.append(matrix[top][i])
        }
        top += 1
        
        // Traverse right column 向下
        for i in stride(from: top, through: bottom, by: 1) {
            result.append(matrix[i][right])
        }
        right -= 1
        
        // Traverse bottom row if top <= bottom  向右
        if top <= bottom {
            for i in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][i])
            }
            bottom -= 1
        }
        
        // Traverse left column if left <= right  向上
        if left <= right {
            for i in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[i][left])
            }
            left += 1
        }
    }

    return result
}
