// Linked List     Divide and Conquer 
// Min-Heap (Priority Queue)    Merge Sort

public class ListNode {
    public var val: Int       // 节点的值
    public var next: ListNode? // 指向下一个节点的引用 (可能为空)

    // 默认构造函数，初始化为 0 和 nil
    public init() { 
        self.val = 0 
        self.next = nil 
    }

    // 构造函数，初始化给定的值和 next 为 nil
    public init(_ val: Int) { 
        self.val = val 
        self.next = nil 
    }

    // 构造函数，初始化给定的值和下一个节点
    public init(_ val: Int, _ next: ListNode?) { 
        self.val = val 
        self.next = next 
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        var arr: [Int] = []
        
        for list in lists.compactMap ({ $0 }) {
            var head: ListNode? = list
            while head != nil {
                arr.append(head!.val)
                head = head?.next
            }
        }
        arr.sort()
        if arr.isEmpty { return nil }
        
        let node = ListNode(0)
        var curr = ListNode(arr[0])
        node.next = curr
        
        for n in arr.dropFirst() {
            let tmp = ListNode(n)
            curr.next = tmp
            if let next = curr.next { curr = next }
        }
        return node.next
    }
}