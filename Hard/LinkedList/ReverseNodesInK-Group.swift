public class ListNode {
    public var val: Int         // 节点的值
    public var next: ListNode?  // 指向下一个节点的引用

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
    // Helper function to reverse a portion of the linked list
    private func reverse(_ head: ListNode?, _ tail: ListNode?) -> (ListNode?, ListNode?) {
        var prev: ListNode? = nil
        var curr = head
        while curr !== tail {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return (prev, head) // 返回反转后的新头和尾（反转后的尾是原来的头）
    }

    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 0
        var curr = head

        // Find the k-th node
        while count < k && curr != nil {
            curr = curr?.next
            count += 1
        }

        // If there are enough nodes to reverse
        if count == k {
            // Reverse the first k nodes
            let (newHead, newTail) = reverse(head, curr)

            // Recursively reverse the next part of the list
            newTail?.next = reverseKGroup(curr, k)

            return newHead // Return the new head of this part after reversal
        }

        // If there are not enough nodes left to reverse, return the head as is
        return head
    }
}

// Helper function to create a linked list from an array
func createLinkedList(_ arr: [Int]) -> ListNode? {
    let dummy = ListNode(0)    // 虚拟头节点
    var current: ListNode? = dummy

    for value in arr {
        current?.next = ListNode(value)
        current = current?.next
    }

    return dummy.next          // 返回真正的头节点
}

// Helper function to print a linked list
func printLinkedList(_ head: ListNode?) {
    var current = head
    var output: [Int] = []
    while current != nil {
        output.append(current!.val)
        current = current?.next
    }
    print(output)
}

// Test case 1: Reverse nodes in groups of 2
let head1 = createLinkedList([1, 2, 3, 4, 5])
let solution1 = Solution()
let result1 = solution1.reverseKGroup(head1, 2)
printLinkedList(result1)   // Expected output: [2, 1, 4, 3, 5]

// Test case 2: Reverse nodes in groups of 3
let head2 = createLinkedList([1, 2, 3, 4, 5])
let solution2 = Solution()
let result2 = solution2.reverseKGroup(head2, 3)
printLinkedList(result2)   // Expected output: [3, 2, 1, 4, 5]

// Test case 3: Reverse nodes in groups of 1 (no change expected)
let head3 = createLinkedList([1, 2, 3, 4, 5])
let solution3 = Solution()
let result3 = solution3.reverseKGroup(head3, 1)
printLinkedList(result3)   // Expected output: [1, 2, 3, 4, 5]

// Test case 4: Reverse nodes in groups of 5 (whole list should be reversed)
let head4 = createLinkedList([1, 2, 3, 4, 5])
let solution4 = Solution()
let result4 = solution4.reverseKGroup(head4, 5)
printLinkedList(result4)   // Expected output: [5, 4, 3, 2, 1]

