class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var seenNumbers = Set<Int>()
        
        for num in nums {
            if seenNumbers.contains(num) {
                return true // 如果 num 已经在集合中，表示有重复，返回 true
            }
            seenNumbers.insert(num) // 否则将 num 插入集合中
        }
        
        return false // 如果遍历完数组没有发现重复元素，返回 false
    }
}
// 使用 Set.contains() 查看当前 num 是否已经存在
// 循环完毕没有重复的就 return false
// 数组 nums 需要判断两种情况，1.里面有重复的。2.里面的数字都是独特的。
// 这个方法是从 1 着手解决




class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}

// 如果没有重复的情况下，Set(nums).count  和 nums.count 的结果相同
// 数组 nums 需要判断两种情况，1.里面有重复的。2.里面的数字都是独特的。
// 这个方法是从 2 着手解决


class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var numsDictionary: [Int: Int] = [:]

        for num in nums {
            if numsDictionary[num] != nil {
                return true
            }
            numsDictionary[num] = 1
        }

        return false
    }
}

// 数组 nums 需要判断两种情况，1.里面有重复的。2.里面的数字都是独特的。
// 这个方法是从 1 着手解决

// 每次检查字典是否包含当前 num ， 如果有就 return true
// 没有就将 num 加入字典
// 循环完毕都没有重复的情况下，return flase