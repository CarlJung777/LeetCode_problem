/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        // 使用快慢指针，如果存在环，则快指针最终会追上慢指针
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            // 如果快指针追上了慢指针，说明存在环
            if slow === fast {
                return true
            }
        }
        
        // 如果快指针到达链表末尾，则说明不存在环
        return false
    }
}