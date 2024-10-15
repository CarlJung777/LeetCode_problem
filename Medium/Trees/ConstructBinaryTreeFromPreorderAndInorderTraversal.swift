// Hash      Table Divide and Conquer       Tree Binary      Tree
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
    var preorderIndex = 0
    var inorderIndexMap = [Int: Int]()
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // 将 inorder 中每个值的索引存储在哈希表中，以便快速查找
        for (index, value) in inorder.enumerated() {
            inorderIndexMap[value] = index
        }
        
        // 调用递归函数构建树
        return buildTreeHelper(preorder, 0, inorder.count - 1)
    }
    
    private func buildTreeHelper(_ preorder: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        // 如果左右索引越界，返回 nil
        if left > right {
            return nil
        }
        
        // 从 preorder 中获取根节点的值
        let rootValue = preorder[preorderIndex]
        preorderIndex += 1
        
        // 创建当前根节点
        let root = TreeNode(rootValue)
        
        // 获取当前根节点在 inorder 中的索引
        let inorderIndex = inorderIndexMap[rootValue]!
        
        // 递归构建左子树
        root.left = buildTreeHelper(preorder, left, inorderIndex - 1)
        
        // 递归构建右子树
        root.right = buildTreeHelper(preorder, inorderIndex + 1, right)
        
        return root
    }
}
