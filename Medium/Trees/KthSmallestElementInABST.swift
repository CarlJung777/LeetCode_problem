
// Depth-First Search      Binary Search Tree       Binary Tree
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var result = -1
        
        // 定义一个中序遍历的递归函数
        func inOrderTraversal(_ node: TreeNode?) {
            guard let node = node else { return }
            
            // 先遍历左子树
            inOrderTraversal(node.left)
            
            // 处理当前节点
            count += 1
            if count == k {
                result = node.val
                return
            }
            
            // 再遍历右子树
            inOrderTraversal(node.right)
        }
        
        // 开始中序遍历
        inOrderTraversal(root)
        return result
    }
}
