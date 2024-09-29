class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var majority: [Int : Int ] = [:]
        let size = nums.count
        for num in nums {
            if let count = majority[num] {
                majority[num] = count + 1
            } else {
                majority[num] = 1 
            }
            if majority[num]! > size / 2 {
                return num  
            }
        }
        return -1
    }
}