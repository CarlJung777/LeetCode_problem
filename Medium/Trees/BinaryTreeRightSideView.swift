// Depth-First Search    Breadth-First Search    Binary Tree

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        guard let root = root else { return result }
        
        var queue: [TreeNode] = [root]  // 使用队列来进行层次遍历
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var rightMostValue: Int = 0
            
            // 遍历当前层的所有节点
            for i in 0..<levelSize {
                let node = queue.removeFirst()
                
                // 更新当前层的最右侧节点
                rightMostValue = node.val
                
                // 将子节点加入队列
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            // 添加当前层的最右侧节点到结果中
            result.append(rightMostValue)
        }
        
        return result
    }
}
