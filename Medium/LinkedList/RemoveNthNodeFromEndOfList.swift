// Linked List     Two Pointers
public class ListNode {
    public var val: Int  // 链表节点的值
    public var next: ListNode?  // 指向下一个节点的指针，可能为空
    
    // 默认初始化器，节点值设为 0，next 指针设为 nil
    public init() {
        self.val = 0
        self.next = nil
    }

    // 带有节点值的初始化器，next 指针设为 nil
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    // 带有节点值和下一个节点指针的初始化器
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}


class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 创建一个虚拟节点，指向 head，这样可以避免删除头节点时的特殊处理
        let dummy = ListNode(0, head)
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy
        
        // 先让快指针前进 n 步
        for _ in 0..<n {
            fast = fast?.next
        }
        
        // 快慢指针一起移动，直到快指针到达末尾
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        // 删除慢指针所指节点的下一个节点
        slow?.next = slow?.next?.next
        
        // 返回新的头节点
        return dummy.next
    }
}