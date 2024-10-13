// 定义 ListNode(类名称) 结构
public class ListNode {
    public var value: Int
    // ListNode?：可选类型（Optional） next 要么是另一个 ListNode 实例，要么是 nil
    // nil 表示当前节点是链表的末尾节点
    public var next: ListNode?

    // 无参数构造函数
    // self 代表当前实例，self.value 表示当前对象的 value 属性。这里将 value 初始化为 0
    // 将 next 属性初始化为 nil，表示初始状态下没有后续节点
    public init() { self.value = 0; self.next = nil; }

    // 单参数构造函数
    // 带参数的构造函数，允许在创建节点时指定 value 的值
    public init(_ value: Int) { self.value = value; self.next = nil; }

    // 双参数构造函数
    // 一个带两个参数的构造函数，允许在创建节点时指定节点的值 value 和指向下一个节点的引用 next
    public init(_ value: Int, _ next: ListNode?) { self.value = value; self.next = next; }
}


// Solution 类 ｜  类是 Swift 中的基本构建块，用于封装数据和功能（方法）
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head

        while curr != nil {
            let nextTemp = curr!.next  // 暂存当前节点的下一个节点
            curr!.next = prev  // 反转当前节点的指针
            prev = curr  // 向前移动 prev
            curr = nextTemp  // 向前移动 curr
        }
        
        return prev
    }
}

// 测试代码
func printList(_ head: ListNode?) {
    var curr = head
    while curr != nil {
        print(curr!.value, terminator: " -> ")
        curr = curr!.next
    }
    print("nil")
}

// 创建链表: 1 -> 2 -> 3 -> 4 -> 5 -> nil
let head = ListNode(1)
head.next = ListNode(2)
head.next!.next = ListNode(3)
head.next!.next!.next = ListNode(4)
head.next!.next!.next!.next = ListNode(5)

// 打印原始链表
print("Original List:")
printList(head)

// 反转链表
let solution = Solution()
let reversedHead = solution.reverseList(head)

// 打印反转后的链表
print("Reversed List:")
printList(reversedHead)


// In Swift, structures, enumerations, and tuples are all value tyoes
// They behave similar to sending your friend a copy of a document

// In Swift, classes, actors, and closures are all reference types
// They behave similar to sending your friend a link to a shared document