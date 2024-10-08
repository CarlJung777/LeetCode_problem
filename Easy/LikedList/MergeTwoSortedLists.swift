public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
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

// 辅助函数：打印链表
func printList(_ head: ListNode?) {
    var current = head
    while current != nil {
        print(current!.val, terminator: " -> ")
        current = current?.next
    }
    print("nil")
}

// 构建链表的辅助函数
func buildList(_ arr: [Int]) -> ListNode? {
    let dummy = ListNode(0)
    var current: ListNode? = dummy
    for value in arr {
        current?.next = ListNode(value)
        current = current?.next
    }
    return dummy.next
}
// 测试代码
let list1 = buildList([1, 2, 4])  // 第一个有序链表
let list2 = buildList([1, 3, 4])  // 第二个有序链表
print("List 1:")
printList(list1)

print("List 2:")
printList(list2)

let solution = Solution()
let mergedList = solution.mergeTwoLists(list1, list2)

// 打印合并后的链表
print("Merged List:")
printList(mergedList)

