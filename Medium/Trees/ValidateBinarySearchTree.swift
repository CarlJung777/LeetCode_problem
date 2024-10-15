// Depth-First search       Binary Search     Tree Binary Tree
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        // 调用辅助函数，初始范围为负无穷到正无穷
        return isValidBSTHelper(root, nil, nil)
    }
    
    // 辅助函数：通过递归验证每个节点
    func isValidBSTHelper(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        // 如果节点为空，返回 true（空树是有效的BST）
        guard let node = node else { return true }
        
        // 如果当前节点的值不在合法范围内，返回 false
        if let min = min, node.val <= min { return false }
        if let max = max, node.val >= max { return false }
        
        // 递归验证左子树和右子树
        // 左子树的最大值是当前节点值，右子树的最小值是当前节点值
        return isValidBSTHelper(node.left, min, node.val) && 
               isValidBSTHelper(node.right, node.val, max)
    }
}
