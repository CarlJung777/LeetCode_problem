func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var answer = Array(repeating: 1, count: n)
    
    // 计算前缀积
    var prefix = 1
    for i in 0..<n {
        answer[i] = prefix
        prefix *= nums[i]
    }
    
    // 计算后缀积并与前缀积相乘
    var suffix = 1
    for i in (0..<n).reversed() {
        answer[i] *= suffix
        suffix *= nums[i]
    }
    
    return answer
}





func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var result = Array(repeating: 1, count: n)
    
    // 计算前缀积
    for i in 1..<n {
        result[i] = result[i - 1] * nums[i - 1]
    }
    
    // 计算后缀积并更新结果
    var suffix = 1
    for i in (0..<n).reversed() {
        result[i] *= suffix
        suffix *= nums[i]
    }
    
    return result
}

// 时间复杂度：整个算法的时间复杂度为 𝑂(𝑛)，因为只遍历了数组两次。
// 空间复杂度：额外空间复杂度为 𝑂(1)，因为除了输出数组 result 外，没有使用其他额外的存储空间。


// 先计算当前数字的前缀积，然后计算后缀积，因为题目是需要计算除当前位置之外的所有数字的乘积
// 所以后续前缀积 * 后缀积 = 结果
// 因为题目要求不能用除法，所以就不能整体计算，化繁为简，化整为二，分头计算结果，最后再统一计算