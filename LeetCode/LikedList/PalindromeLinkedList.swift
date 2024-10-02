/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        // 边界情况处理
        if head == nil || head?.next == nil {
            return true
        }
        
        // 找到链表的中间节点
        var slow = head
        var fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // 反转后半部分链表
        var prev: ListNode? = nil
        var curr = slow?.next
        while curr != nil {
            let nextTemp = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextTemp
        }
        
        // 比较前半部分和反转后的后半部分链表是否相等
        var p1 = head
        var p2 = prev
        while p2 != nil {
            if p1?.val != p2?.val {
                return false
            }
            p1 = p1?.next
            p2 = p2?.next
        }
        
        return true
    }
}