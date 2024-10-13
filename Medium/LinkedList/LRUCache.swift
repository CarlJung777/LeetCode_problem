// Doubly-Linked List    Hash Table   Design

// Least Recently Used

class LRUCache {
    class ListNode {
        var key: Int
        var value: Int
        var prev: ListNode?
        var next: ListNode?
        
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    private var capacity: Int
    private var cache = [Int: ListNode]()
    private var head = ListNode(0, 0)
    private var tail = ListNode(0, 0)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            moveToHead(node)
            return node.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            moveToHead(node)
        } else {
            let newNode = ListNode(key, value)
            cache[key] = newNode
            addNode(newNode)
            
            if cache.count > capacity {
                let tailNode = removeTail()
                cache.removeValue(forKey: tailNode.key)
            }
        }
    }
    
    // 辅助函数：将节点移到头部
    private func moveToHead(_ node: ListNode) {
        removeNode(node)
        addNode(node)
    }
    
    // 辅助函数：在头部插入新节点
    private func addNode(_ node: ListNode) {
        node.prev = head
        node.next = head.next
        head.next?.prev = node
        head.next = node
    }
    
    // 辅助函数：移除节点
    private func removeNode(_ node: ListNode) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
    }
    
    // 辅助函数：移除尾部节点
    private func removeTail() -> ListNode {
        let tailNode = tail.prev!
        removeNode(tailNode)
        return tailNode
    }
}