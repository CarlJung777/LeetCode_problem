func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    
    while left < right {
        let sum = numbers[left] + numbers[right]
        
        if sum == target {
            return [left + 1, right + 1] // 1-indexed result
        } else if sum < target {
            left += 1 // Move left pointer right if sum is too small
        } else {
            right -= 1 // Move right pointer left if sum is too large
        }
    }
    
    return [] // The problem guarantees a solution, so we won't reach this
}
