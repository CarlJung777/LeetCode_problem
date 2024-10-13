class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        // 定义快慢两个指针
        var slow = head
        var fast = head
        
        // 开始遍历链表
        while fast != nil && fast?.next != nil {
            slow = slow?.next              // 慢指针走一步
            fast = fast?.next?.next         // 快指针走两步
            
            if slow === fast {              // 如果快指针追上慢指针，说明有环
                return true
            }
        }
        
        return false                        // 如果没有追上，说明没有环
    }
}
