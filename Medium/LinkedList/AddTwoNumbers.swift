// Linked List   Recursion  Math

public class ListNode {
    public var val: Int    // 存储当前节点的整数值
    public var next: ListNode?    // 指向下一个节点的指针，可能为空（nil）
    
    // 默认的初始化器，节点值为 0，指针指向 nil
    public init() { 
        self.val = 0
        self.next = nil
    }
    
    // 带一个参数的初始化器，允许设置节点的值，指针指向 nil
    public init(_ val: Int) { 
        self.val = val
        self.next = nil
    }
    
    // 带两个参数的初始化器，允许设置节点的值，并指定指针指向的下一个节点
    public init(_ val: Int, _ next: ListNode?) { 
        self.val = val
        self.next = next
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 初始化虚拟头节点和当前节点
        let dummy = ListNode(0)
        var current: ListNode? = dummy
        
        var carry = 0  // 进位初始化为 0
        var p = l1  // 指针 p 指向 l1 链表
        var q = l2  // 指针 q 指向 l2 链表
        
        // 循环遍历直到两个链表都到尾部，并处理进位
        while p != nil || q != nil {
            let x = p?.val ?? 0  // 取 p 当前的值，如果为 nil 则为 0
            let y = q?.val ?? 0  // 取 q 当前的值，如果为 nil 则为 0
            let sum = carry + x + y  // 计算当前节点的和
            
            carry = sum / 10  // 计算进位
            current?.next = ListNode(sum % 10)  // 创建当前节点值为 sum % 10
            
            current = current?.next  // 移动到下一个节点
            
            // 移动 p 和 q 指针
            if p != nil { p = p?.next }
            if q != nil { q = q?.next }
        }
        
        // 最后如果还有进位，创建一个新节点
        if carry > 0 {
            current?.next = ListNode(carry)
        }
        
        return dummy.next  // 返回真正的头节点
    }
}