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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // 创建虚拟头节点
        let dummy = ListNode(0)
        var current: ListNode? = dummy
        var l1 = list1
        var l2 = list2
        
        // 遍历两个链表，比较节点值，依次将较小的节点加入到新链表中
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                current?.next = l1
                l1 = l1?.next
            } else {
                current?.next = l2
                l2 = l2?.next
            }
            current = current?.next
        }
        
        // 处理剩余的节点
        if l1 != nil {
            current?.next = l1
        } else {
            current?.next = l2
        }
        
        return dummy.next
    }
}