// Linked List     Hash Table

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?

    // 初始化方法，用于创建一个值为 `val` 的节点，`next` 和 `random` 默认指向 `nil`
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}


class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        // Step 1: Insert new nodes after each original node
        var curr = head
        while curr != nil {
            let newNode = Node(curr!.val)  // Create a copy of the current node
            newNode.next = curr!.next      // Point new node's next to current node's next
            curr!.next = newNode           // Insert new node after the current node
            curr = newNode.next            // Move to the next original node
        }
        
        // Step 2: Copy the random pointers
        curr = head
        while curr != nil {
            if let randomNode = curr!.random {
                curr!.next!.random = randomNode.next   // Copy random pointer to the new node
            }
            curr = curr!.next!.next    // Move two steps to skip the copied node
        }
        
        // Step 3: Separate the original list and the copied list
        curr = head
        let dummyHead = Node(0)  // Dummy node to help extract the copied list
        var copyCurr: Node? = dummyHead
        
        while curr != nil {
            let nextOriginal = curr!.next!.next  // Original next node
            let copyNode = curr!.next            // Copied node
            
            // Attach the copied node to the new list
            copyCurr!.next = copyNode
            copyCurr = copyCurr!.next
            
            // Restore the original list
            curr!.next = nextOriginal
            curr = nextOriginal
        }
        
        // Return the deep copied list
        return dummyHead.next
    }
}