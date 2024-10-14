//   Floyd’s Tortoise and Hare   Two Pointers   Binary Search   Bit Manipulation
//   将数组视为一个链表，其中数组元素的值指向链表的下一个节点
//   利用数组中的数字和索引的关系，来模拟链表中的环
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]
        
        // 阶段 1：使用快慢指针寻找循环（即重复的数字）
        // proves we have a cycle(by going 2X & 1x)
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        
        // 阶段 2：找到循环的入口
        // find where the cycle is (by resetting both to 1x speed)
        slow = nums[0]
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
}

//  Given an array of integers nums containing n + 1 integers
//  where each integer is in the range [1, n] inclusive.
//  因此可以把数组的每个数字都看成是 Index 
//  因为是范围是[1, n] ， 所以不会有指向 Index 0 的，也就是最开始的地方