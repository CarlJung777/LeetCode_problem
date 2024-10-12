class solution {
    func MaxSubArray(_ nums: [Int]) -> Int {
        var maxEndingHere = nums[0]  // 储存当前子数组的最大和
        var maxSoFar = nums[0]      // 储存目前为止遇到的最大子数组和

        for i in 1..<nums.count {   // 从第二个元素开始



            maxEndingHere = max(nums[i], maxEndingHere + nums[i])

            // 更新最大和
            maxSoFar = max(maxSoFar, maxEndingHere)

        }
        return maxSoFar
    }
}

// kadane's Algorithm